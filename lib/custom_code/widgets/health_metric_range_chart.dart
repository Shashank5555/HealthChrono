// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:health/health.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HealthMetricRangeChart extends StatefulWidget {
  const HealthMetricRangeChart({
    super.key,
    required this.startDate, // ISO-8601 string, e.g. "2025-09-01"
    required this.endDate, // ISO-8601 string (inclusive)
    required this.metric, // 'steps','heart_rate','active_energy_burned','sleep_asleep', etc.
    this.width,
    this.height,
  });

  final String startDate;
  final String endDate; // inclusive
  final String metric;
  final double? width;
  final double? height;

  @override
  State<HealthMetricRangeChart> createState() => _HealthMetricRangeChartState();
}

class _HealthMetricRangeChartState extends State<HealthMetricRangeChart> {
  bool _loading = true;
  String? _error;

  List<_XY> _points = []; // sample-based metrics (line)
  List<_XY> _dailyBars =
      []; // daily totals: steps, active_energy_burned, sleep_asleep

  late DateTime _start;
  late DateTime _endInc;

  @override
  void initState() {
    super.initState();
    try {
      final parsedStart = DateTime.parse(widget.startDate);
      final parsedEnd = DateTime.parse(widget.endDate);
      _start = parsedStart;
      _endInc = _inclusiveEnd(parsedEnd);
      _load();
    } catch (e) {
      setState(() {
        _loading = false;
        _error =
            'Invalid date format. Use ISO-8601, e.g. 2025-09-01 or 2025-09-01T08:00:00';
      });
    }
  }

  DateTime _inclusiveEnd(DateTime d) {
    final isMidnight = d.hour == 0 &&
        d.minute == 0 &&
        d.second == 0 &&
        d.millisecond == 0 &&
        d.microsecond == 0;
    return isMidnight
        ? d
            .add(const Duration(days: 1))
            .subtract(const Duration(milliseconds: 1))
        : d;
  }

  double _numOrZero(dynamic v) {
    if (v == null) return 0.0;
    if (v is num) return v.toDouble();
    try {
      final nv = (v as dynamic).numericValue;
      if (nv is num) return nv.toDouble();
    } catch (_) {}
    return double.tryParse(v.toString()) ?? 0.0;
  }

  Future<void> _load() async {
    try {
      if (!Platform.isAndroid && !Platform.isIOS) {
        throw 'Unsupported platform';
      }

      final health = Health();
      final spec = _metricSpec(widget.metric);

      final has = (await health.hasPermissions(spec.types)) ?? false;
      if (!has) {
        final granted =
            (await health.requestAuthorization(spec.types)) ?? false;
        if (!granted) throw 'Health permissions not granted';
      }

      // Daily-aggregate metrics
      if (spec.kind == _Kind.dailySteps ||
          spec.kind == _Kind.dailySumNumeric ||
          spec.kind == _Kind.dailySleepHours) {
        final days = _endInc.difference(_start).inDays + 1;
        final fmt = DateFormat('yyyy-MM-dd');
        final bars = <_XY>[];

        for (int i = 0; i < days; i++) {
          final dayStart = DateTime(_start.year, _start.month, _start.day)
              .add(Duration(days: i));
          final dayEnd = dayStart.add(const Duration(days: 1));

          double total = 0.0;

          if (spec.kind == _Kind.dailySteps) {
            try {
              final t = await health.getTotalStepsInInterval(dayStart, dayEnd);
              if (t != null) total = t.toDouble();
            } catch (_) {}
          } else {
            final daySamples = await health.getHealthDataFromTypes(
              startTime: dayStart,
              endTime: dayEnd,
              types: spec.types,
            );

            if (spec.kind == _Kind.dailySumNumeric) {
              for (final p in daySamples) {
                if (!spec.accept(p.type)) continue;
                total += _numOrZero(p.value);
              }
            } else if (spec.kind == _Kind.dailySleepHours) {
              Duration sleepDur = Duration.zero;
              for (final p in daySamples) {
                if (!spec.accept(p.type)) continue;
                final from = p.dateFrom.toLocal();
                final to = p.dateTo.toLocal();
                final overlapStart = from.isAfter(dayStart) ? from : dayStart;
                final overlapEnd = to.isBefore(dayEnd) ? to : dayEnd;
                if (!overlapEnd.isBefore(overlapStart)) {
                  sleepDur += overlapEnd.difference(overlapStart);
                }
              }
              total = sleepDur.inMinutes / 60.0;
            }
          }

          bars.add(_XY(dayStart, total, label: fmt.format(dayStart)));
        }

        if (!mounted) return;
        setState(() {
          _dailyBars = bars;
          _points = const [];
          _loading = false;
          _error = null;
        });
        return;
      }

      // Sample-based metrics
      final samples = await health.getHealthDataFromTypes(
        startTime: _start,
        endTime: _endInc,
        types: spec.types,
      );

      final pts = <_XY>[];
      for (final p in samples) {
        if (!spec.accept(p.type)) continue;
        final from = p.dateFrom.toLocal();
        final to = p.dateTo.toLocal();
        final when = to.isAfter(from)
            ? DateTime.fromMillisecondsSinceEpoch(
                ((from.millisecondsSinceEpoch + to.millisecondsSinceEpoch) ~/
                    2))
            : from;
        pts.add(_XY(when, _numOrZero(p.value)));
      }
      pts.sort((a, b) => a.x.compareTo(b.x));

      if (!mounted) return;
      setState(() {
        _points = pts;
        _dailyBars = const [];
        _loading = false;
        _error = pts.isEmpty ? 'No samples in selected range' : null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final chart = _buildChart();
    if (_loading) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: const Center(child: CircularProgressIndicator()),
      );
    }
    if (_error != null) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_error!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 8),
            Expanded(child: chart),
          ],
        ),
      );
    }
    return SizedBox(width: widget.width, height: widget.height, child: chart);
  }

  Widget _buildChart() {
    final trackball = TrackballBehavior(
      enable: true,
      shouldAlwaysShow: true,
      activationMode: ActivationMode.singleTap,
      tooltipAlignment: ChartAlignment.near,
      tooltipDisplayMode: TrackballDisplayMode.nearestPoint,
      tooltipSettings: const InteractiveTooltip(
        enable: true,
        format: 'Date: point.x\nValue: point.y',
      ),
    );
    final zoomPan = ZoomPanBehavior(
      enablePinching: true,
      enablePanning: true,
      enableDoubleTapZooming: true,
      zoomMode: ZoomMode.x,
    );

    DateTime? axisMin;
    DateTime? axisMax;

    final isDaily = _dailyBars.isNotEmpty || _specKindIsDaily(widget.metric);
    if (isDaily) {
      if (_dailyBars.isEmpty) {
        axisMin = _start;
        axisMax = _endInc;
      } else if (_dailyBars.length == 1) {
        axisMin = _dailyBars.first.x.subtract(const Duration(days: 1));
        axisMax = _dailyBars.first.x.add(const Duration(days: 1));
      } else {
        axisMin = _start;
        axisMax = _endInc;
      }

      final seriesData = _dailyBars;
      return SfCartesianChart(
        zoomPanBehavior: zoomPan,
        trackballBehavior: trackball,
        primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat.MMMd(),
          intervalType: DateTimeIntervalType.days,
          minimum: axisMin,
          maximum: axisMax,
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
        primaryYAxis: NumericAxis(),
        series: <CartesianSeries>[
          ColumnSeries<_XY, DateTime>(
            dataSource: seriesData,
            xValueMapper: (d, _) => d.x,
            yValueMapper: (d, _) => d.y,
            width: 0.8,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
          ScatterSeries<_XY, DateTime>(
            dataSource: seriesData,
            xValueMapper: (d, _) => d.x,
            yValueMapper: (d, _) => d.y,
            markerSettings: const MarkerSettings(
              isVisible: true,
              shape: DataMarkerType.circle,
              width: 6,
              height: 6,
              borderWidth: 1.5,
            ),
            enableTooltip: true,
          ),
        ],
      );
    } else {
      if (_points.isEmpty) {
        axisMin = _start;
        axisMax = _endInc;
      } else if (_points.length == 1) {
        axisMin = _points.first.x.subtract(const Duration(days: 1));
        axisMax = _points.first.x.add(const Duration(days: 1));
      } else {
        axisMin = _start;
        axisMax = _endInc;
      }

      final seriesData = _points;
      return SfCartesianChart(
        zoomPanBehavior: zoomPan,
        trackballBehavior: trackball,
        primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat.MMMd(),
          intervalType: DateTimeIntervalType.days,
          minimum: axisMin,
          maximum: axisMax,
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
        primaryYAxis: NumericAxis(),
        series: <CartesianSeries>[
          SplineSeries<_XY, DateTime>(
            dataSource: seriesData,
            xValueMapper: (d, _) => d.x,
            yValueMapper: (d, _) => d.y,
            splineType: SplineType.natural,
            width: 1.5,
            enableTooltip: false,
          ),
          ScatterSeries<_XY, DateTime>(
            dataSource: seriesData,
            xValueMapper: (d, _) => d.x,
            yValueMapper: (d, _) => d.y,
            markerSettings: const MarkerSettings(
              isVisible: true,
              shape: DataMarkerType.circle,
              width: 7,
              height: 7,
              borderWidth: 1.5,
            ),
            enableTooltip: true,
          ),
        ],
      );
    }
  }

  bool _specKindIsDaily(String metric) {
    final m = metric.toLowerCase().trim();
    return m == 'steps' || m == 'active_energy_burned' || m == 'sleep_asleep';
  }

  _MetricSpec _metricSpec(String metric) {
    final m = metric.toLowerCase().trim();
    switch (m) {
      case 'steps':
        return _MetricSpec(
          types: const [HealthDataType.STEPS],
          kind: _Kind.dailySteps,
        );
      case 'active_energy_burned':
        return _MetricSpec(
          types: const [HealthDataType.ACTIVE_ENERGY_BURNED],
          kind: _Kind.dailySumNumeric,
        );
      case 'sleep_asleep':
        return _MetricSpec(
          types: const [HealthDataType.SLEEP_ASLEEP],
          kind: _Kind.dailySleepHours,
        );
      case 'heart_rate':
        return _MetricSpec(types: const [HealthDataType.HEART_RATE]);
      case 'blood_oxygen':
        return _MetricSpec(types: const [HealthDataType.BLOOD_OXYGEN]);
      case 'systolic_bp':
        return _MetricSpec(
          types: const [HealthDataType.BLOOD_PRESSURE_SYSTOLIC],
          accept: (t) => t == HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
        );
      case 'diastolic_bp':
        return _MetricSpec(
          types: const [HealthDataType.BLOOD_PRESSURE_DIASTOLIC],
          accept: (t) => t == HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
        );
      case 'blood_glucose':
        return _MetricSpec(types: const [HealthDataType.BLOOD_GLUCOSE]);
      case 'respiratory_rate':
        return _MetricSpec(types: const [HealthDataType.RESPIRATORY_RATE]);
      case 'body_temperature':
        return _MetricSpec(types: const [HealthDataType.BODY_TEMPERATURE]);
      case 'body_fat_percentage':
        return _MetricSpec(types: const [HealthDataType.BODY_FAT_PERCENTAGE]);
      case 'water':
        return _MetricSpec(types: const [HealthDataType.WATER]);
      default:
        return _MetricSpec(types: const [HealthDataType.HEART_RATE]);
    }
  }
}

// --- Models -----------------------------------------------------------------

class _XY {
  final DateTime x;
  final double y;
  final String? label;
  _XY(this.x, this.y, {this.label});
}

enum _Kind { samples, dailySteps, dailySumNumeric, dailySleepHours }

class _MetricSpec {
  final List<HealthDataType> types;
  final _Kind kind;
  final bool Function(HealthDataType) accept;

  _MetricSpec({
    required this.types,
    this.kind = _Kind.samples,
    bool Function(HealthDataType)? accept,
  }) : accept = accept ?? ((_) => true);
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

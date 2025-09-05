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
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';

/// A bar chart of daily steps between [from] and [to].
///
/// If both are omitted, it shows today’s steps.
class StepsChart extends StatefulWidget {
  final DateTime? from;
  final DateTime? to;
  final double? width;
  final double? height;

  const StepsChart({
    Key? key,
    this.from,
    this.to,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<StepsChart> createState() => _StepsChartState();
}

class _StepsChartState extends State<StepsChart> {
  late final DateTime _start;
  late final DateTime _end;

  bool _loading = true;
  String? _error;

  List<String> _labels = [];
  List<int> _values = [];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _start = widget.from ?? DateTime(now.year, now.month, now.day); // midnight
    _end = widget.to ?? now; // now
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      // 1) Android runtime permission (don’t request on iOS/other)
      if (Platform.isAndroid) {
        try {
          final status = await Permission.activityRecognition.request();
          if (status.isPermanentlyDenied) {
            _finishWithError(
                'Activity Recognition permission permanently denied');
            return;
          }
          if (!status.isGranted) {
            _finishWithError('Activity Recognition permission denied');
            return;
          }
        } catch (e) {
          // Some platforms/OEMs may throw "lookup failed" here; continue gracefully.
          debugPrint('permission_handler error: $e');
        }
      } else if (!Platform.isIOS) {
        _finishWithError('Unsupported platform');
        return;
      }

      // 2) Health authorization (Health Connect / HealthKit)
      final health = Health();
      const types = [HealthDataType.STEPS];
      const perms = [HealthDataAccess.READ];

      final hasPerms =
          await health.hasPermissions(types, permissions: perms) ?? false;
      if (!hasPerms) {
        final granted =
            await health.requestAuthorization(types, permissions: perms);
        if (!granted) {
          _finishWithError('Health permissions not granted');
          return;
        }
      }

      // 3) Build daily labels and totals
      final fmt = DateFormat('yyyy-MM-dd');
      final totalDays = _end.difference(_start).inDays + 1;
      final labels = <String>[];
      final values = <int>[];

      for (var i = 0; i < totalDays; i++) {
        final dayStart = _start.add(Duration(days: i));
        final dayEnd = dayStart.add(const Duration(days: 1));
        labels.add(fmt.format(dayStart));

        int total = 0;
        try {
          total = await health.getTotalStepsInInterval(dayStart, dayEnd) ?? 0;
        } catch (e, st) {
          debugPrint(
              'getTotalStepsInInterval error on ${labels.last}: $e\n$st');
        }
        values.add(total);
        debugPrint('Steps ${labels.last}: $total');
      }

      if (!mounted) return;
      setState(() {
        _labels = labels;
        _values = values;
        _loading = false;
        _error = null;
      });
    } catch (e, st) {
      debugPrint('StepsChart fatal: $e\n$st');
      _finishWithError('Failed to load steps');
    }
  }

  void _finishWithError(String msg) {
    if (!mounted) return;
    setState(() {
      _loading = false;
      _error = msg;
      // Provide a minimal chart footprint so layout remains stable.
      _labels = [DateFormat('yyyy-MM-dd').format(_start)];
      _values = [0];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    final chart = _buildChart();

    if (_error != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Text(
              _error!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
          chart,
        ],
      );
    }

    return chart;
  }

  Widget _buildChart() {
    final maxVal = (_values.isEmpty ? 0 : _values.reduce(max)).toDouble();
    final yMax = max((maxVal * 1.1).ceilToDouble(), 10.0);

    Widget chart = BarChart(
      BarChartData(
        maxY: yMax,
        barTouchData: BarTouchData(enabled: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                final idx = value.toInt();
                if (idx < 0 || idx >= _labels.length)
                  return const SizedBox.shrink();
                // Thin labels if many days
                final show = _labels.length > 14 ? (idx % 2 == 0) : true;
                return show
                    ? Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(_labels[idx],
                            style: const TextStyle(fontSize: 10)),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: (yMax / 5).ceilToDouble(),
            ),
          ),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(
          _values.length,
          (i) => BarChartGroupData(
            x: i,
            barRods: [BarChartRodData(toY: _values[i].toDouble())],
          ),
        ),
      ),
    );

    if (widget.width != null || widget.height != null) {
      chart =
          SizedBox(width: widget.width, height: widget.height, child: chart);
    }

    return Padding(padding: const EdgeInsets.all(8.0), child: chart);
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

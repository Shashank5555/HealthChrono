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
/// If you omit both, it defaults to just “today”.
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
  List<String> _labels = [];
  List<int> _values = [];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _start = widget.from ?? DateTime(now.year, now.month, now.day);
    _end = widget.to ?? now;
    _loadData();
  }

  Future<void> _loadData() async {
    if (Platform.isAndroid) {
      final status = await Permission.activityRecognition.request();
      if (!status.isGranted) return;
    }

    final health = Health();
    const types = [HealthDataType.STEPS];
    const perms = [HealthDataAccess.READ];
    if (!(await health.hasPermissions(types, permissions: perms) ?? false)) {
      final ok = await health.requestAuthorization(types, permissions: perms);
      if (!ok) return;
    }

    final fmt = DateFormat('yyyy-MM-dd');
    final days = _end.difference(_start).inDays + 1;
    final labels = <String>[];
    final vals = <int>[];

    for (var i = 0; i < days; i++) {
      final dayStart = _start.add(Duration(days: i));
      final dayEnd = dayStart.add(const Duration(days: 1));
      labels.add(fmt.format(dayStart));
      final total = await health.getTotalStepsInInterval(dayStart, dayEnd) ?? 0;
      vals.add(total);
    }

    setState(() {
      _labels = labels;
      _values = vals;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_labels.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

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
              getTitlesWidget: (value, meta) {
                final idx = value.toInt();
                if (idx < 0 || idx >= _labels.length) return const SizedBox();
                return Text(_labels[idx], style: const TextStyle(fontSize: 10));
              },
              reservedSize: 40,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: (yMax / 5).ceilToDouble(),
            ),
          ),
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
      chart = SizedBox(
        width: widget.width,
        height: widget.height,
        child: chart,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: chart,
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

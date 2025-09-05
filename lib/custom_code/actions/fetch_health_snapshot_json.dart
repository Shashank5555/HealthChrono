// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:health/health.dart';

double _numOrZero(dynamic v) {
  if (v == null) return 0.0;
  if (v is num) return v.toDouble();
  return double.tryParse(v.toString()) ?? 0.0;
}

double _pointValue(dynamic v) {
  if (v == null) return 0.0;
  if (v is num) return v.toDouble();
  // Handle plugin value wrappers (e.g., NumericHealthValue)
  try {
    // Many health plugin wrappers expose a numericValue
    final numeric = (v as dynamic).numericValue;
    if (numeric is num) return numeric.toDouble();
  } catch (_) {}
  return double.tryParse(v.toString()) ?? 0.0;
}

bool _isAfterOrEqual(DateTime a, DateTime b) =>
    a.isAfter(b) || a.isAtSameMomentAs(b);
bool _isBeforeOrEqual(DateTime a, DateTime b) =>
    a.isBefore(b) || a.isAtSameMomentAs(b);

Duration _overlap(Duration a, DateTime aStart, DateTime aEnd, DateTime bStart,
    DateTime bEnd) {
  final start = aStart.isAfter(bStart) ? aStart : bStart;
  final end = aEnd.isBefore(bEnd) ? aEnd : bEnd;
  if (end.isBefore(start)) return Duration.zero;
  return end.difference(start);
}

bool _overlaps(DateTime aStart, DateTime aEnd, DateTime bStart, DateTime bEnd) {
  return !(aEnd.isBefore(bStart) || aStart.isAfter(bEnd));
}

/// Returns a JSON string with numeric values (never null).
Future<String> fetchHealthSnapshotJson() async {
  final now = DateTime.now();
  final dayStart = DateTime(now.year, now.month, now.day); // local midnight
  final measureStart =
      dayStart.subtract(const Duration(days: 30)); // for "latest" vitals search
  final dayEnd = dayStart.add(const Duration(days: 1)); // next local midnight
  final health = Health();

  // Distance removed to avoid HC "Datatype DISTANCE_WALKING_RUNNING not found"
  final types = <HealthDataType>[
    HealthDataType.HEART_RATE,
    HealthDataType.BLOOD_OXYGEN,
    HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
    HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.BASAL_ENERGY_BURNED,
    HealthDataType.BODY_TEMPERATURE,
    HealthDataType.BODY_FAT_PERCENTAGE,
    HealthDataType.RESPIRATORY_RATE,
    HealthDataType.WATER,
    HealthDataType.SLEEP_ASLEEP,
  ];

  // ---- Permissions (coalesce after await; your build returns bool?) ----
  final has = (await health.hasPermissions(types)) ?? false;
  if (!has) {
    final granted = (await health.requestAuthorization(types)) ?? false;
    if (!granted) return jsonEncode({'error': 'permissions_denied'});
  }

  // ---- Read points (NAMED args in your build) ----
  List<HealthDataPoint> pts = [];
  try {
    pts = await health.getHealthDataFromTypes(
      startTime:
          measureStart, // fetch a wider window so vitals aren't forced to "today"
      endTime: dayEnd,
      types: types,
    );
    // Do NOT call removeDuplicates to avoid version differences
  } catch (e) {
    return jsonEncode({'error': 'read_failed: $e'});
  }

  double latest(HealthDataType t) {
    final list = pts.where((p) => p.type == t).toList()
      ..sort((a, b) => b.dateFrom.compareTo(a.dateFrom));
    if (list.isEmpty) return 0.0;
    return _pointValue(list.first.value);
  }

  double sumToday(HealthDataType t) {
    double total = 0.0;

    for (final p in pts.where((p) => p.type == t)) {
      final fromL = p.dateFrom.toLocal();
      final toL = p.dateTo.toLocal();
      // Skip if no overlap with [dayStart, dayEnd)
      if (!_overlaps(fromL, toL, dayStart, dayEnd)) continue;

      final value = _pointValue(p.value);

      // Instantaneous sample: count if timestamp lies within the window
      final duration = toL.difference(fromL);
      if (duration.inSeconds <= 0) {
        if (_isAfterOrEqual(fromL, dayStart) && fromL.isBefore(dayEnd)) {
          total += value;
        }
        continue;
      }

      // Weight by overlap proportion within today's window
      final ov = _overlap(duration, fromL, toL, dayStart, dayEnd);
      final frac = ov.inSeconds / duration.inSeconds;
      total += value * frac;
    }

    return total;
  }

  double sleepHoursLastNight() {
    final windowStart = dayStart;
    final windowEnd = dayEnd;
    Duration total = Duration.zero;

    for (final p in pts.where((p) => p.type == HealthDataType.SLEEP_ASLEEP)) {
      final fromL = p.dateFrom.toLocal();
      final toL = p.dateTo.toLocal();

      // Overlap with window: [max(start, from), min(end, to)]
      final overlapStart = fromL.isAfter(windowStart) ? fromL : windowStart;
      final overlapEnd = toL.isBefore(windowEnd) ? toL : windowEnd;

      if (_isBeforeOrEqual(overlapStart, overlapEnd)) {
        total += overlapEnd.difference(overlapStart);
      }
    }

    return double.parse((total.inMinutes / 60.0).toStringAsFixed(2));
  }

  // Prefer plugin's fast total for steps within today's window
  double stepsTodayTotal = 0.0;
  try {
    final total = await health.getTotalStepsInInterval(dayStart, dayEnd);
    if (total != null) stepsTodayTotal = total.toDouble();
  } catch (_) {
    // ignore, fallback below
  }
  if (stepsTodayTotal == 0.0) {
    stepsTodayTotal = sumToday(HealthDataType.STEPS);
  }

  return jsonEncode({
    'error': '',
    // latest vitals (always numbers)
    'heartRateBpm': latest(HealthDataType.HEART_RATE),
    'spo2Percent': latest(HealthDataType.BLOOD_OXYGEN),
    'bpSystolic': latest(HealthDataType.BLOOD_PRESSURE_SYSTOLIC),
    'bpDiastolic': latest(HealthDataType.BLOOD_PRESSURE_DIASTOLIC),
    'glucoseMgDl': latest(HealthDataType.BLOOD_GLUCOSE),
    'respiratoryRate': latest(HealthDataType.RESPIRATORY_RATE),
    'bodyTempC': latest(HealthDataType.BODY_TEMPERATURE),
    'bodyFatPercent': latest(HealthDataType.BODY_FAT_PERCENTAGE),

    // today totals (always numbers)
    'stepsToday': stepsTodayTotal.toInt(),
    'activeCaloriesToday': sumToday(HealthDataType.ACTIVE_ENERGY_BURNED),
    'basalCaloriesToday': sumToday(HealthDataType.BASAL_ENERGY_BURNED),
    'waterToday': sumToday(HealthDataType.WATER),

    // sleep
    'sleepHoursLastNight': sleepHoursLastNight(),
  });
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

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

// Give me a custom action which gives me the number of steps taken
import 'dart:io';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

Future<int> getDailyStepCount() async {
  final health = Health();

  // Runtime perm
  if (!(await Permission.activityRecognition.request()).isGranted) return 0;

  const types = [HealthDataType.STEPS];
  const perms = [HealthDataAccess.READ];

  final already =
      await health.hasPermissions(types, permissions: perms) ?? false;
  bool granted =
      already || await health.requestAuthorization(types, permissions: perms);
  if (!granted) return 0;

  // >>> History grant (only if you need >30 days) <<<
  if (Platform.isAndroid) {
    final hist = await health.isHealthDataHistoryAuthorized();
    if (!hist) {
      await health.requestHealthDataHistoryAuthorization();
    }
  }

  final start =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final end = start.add(const Duration(days: 1));
  final total = await health.getTotalStepsInInterval(start, end);
  if (total != null) return total;

  final pts = await health.getHealthDataFromTypes(
    startTime: start,
    endTime: end,
    types: types,
  );
  int manual = 0;
  for (final p in pts) {
    final v = p.value;
    if (v is NumericHealthValue) manual += v.numericValue.toInt();
  }
  return manual;
}

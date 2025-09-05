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

import 'dart:io';
import 'package:health/health.dart';

Future<bool> requestHealthPermissions() async {
  if (!Platform.isAndroid && !Platform.isIOS) return false;

  final health = Health();

  // Supported types in `health`
  final types = <HealthDataType>[
    HealthDataType.HEART_RATE,
    HealthDataType.BLOOD_OXYGEN,
    HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
    HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.BASAL_ENERGY_BURNED,
    HealthDataType.WORKOUT,
    HealthDataType.BODY_TEMPERATURE,
    HealthDataType.BODY_FAT_PERCENTAGE,
    HealthDataType.RESPIRATORY_RATE,
    HealthDataType.WATER,
    HealthDataType.SLEEP_ASLEEP,
  ];

  final perms = List.filled(types.length, HealthDataAccess.READ);
  final has = await health.hasPermissions(types, permissions: perms) ?? false;
  if (has) return true;

  return await health.requestAuthorization(types, permissions: perms);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

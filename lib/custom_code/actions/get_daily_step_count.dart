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
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

/// Returns today’s total step count, or 0 if permissions are denied, or -1 if
/// Health Connect / HealthKit isn’t available.
Future<int> getDailyStepCount() async {
  try {
    // 1️⃣ Activity recognition (required for steps on Android)
    if (await Permission.activityRecognition.request().isDenied) {
      print('⛔️ Activity Recognition permission denied');
      return 0;
    }

    // 2️⃣ Create plugin instance
    final health = Health();

    // 3️⃣ Specify STEPS and read-only access
    const types = [HealthDataType.STEPS];
    const permissions = [HealthDataAccess.READ];

    // 4️⃣ Request authorization
    final granted =
        await health.requestAuthorization(types, permissions: permissions);
    if (!granted) {
      print('⛔️ Health authorization denied');
      return 0;
    }

    // 5️⃣ Time window: midnight → now
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);

    // 6️⃣ Fetch total steps
    final totalSteps =
        await health.getTotalStepsInInterval(startOfDay, now) ?? 0;
    print('✅ Steps today: $totalSteps');
    return totalSteps;
  } catch (e, st) {
    print('❌ Error fetching step count: $e\n$st');
    return 0;
  }
}

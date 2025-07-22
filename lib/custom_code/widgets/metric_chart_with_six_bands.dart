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

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class MetricChart extends StatelessWidget {
  const MetricChart({
    super.key,
    this.width,
    this.height,
    required this.xData,
    required this.yData,
    required this.metric,
    required this.gender,
    required this.age,
  });

  final double? width;
  final double? height;
  final List<String> xData;
  final List<double> yData;
  final String metric;
  final String gender; // "male" or "female"
  final int age; // Age of the person

  @override
  Widget build(BuildContext context) {
    if (xData.length != yData.length) {
      return const Center(
        child: Text("Error: xData and yData lengths do not match!",
            style: TextStyle(color: Colors.red)),
      );
    }

    // ✅ Define Age Groups
    String ageGroup = age > 65
        ? "65+"
        : age > 55
            ? "56-65"
            : age > 45
                ? "46-55"
                : age > 35
                    ? "36-45"
                    : age > 25
                        ? "26-35"
                        : "18-25";

    // ✅ Define Classification Ranges for Waist-to-Hip Ratio
    Map<String, Map<String, Map<String, List<Map<String, dynamic>>>>>
        classificationRanges = {
      "waist_to_hip_ratio": {
        "male": {
          "18-25": [
            {
              "min": 0.0,
              "max": 0.85,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.85,
              "max": 0.9,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.9, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "26-35": [
            {
              "min": 0.0,
              "max": 0.86,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.86,
              "max": 0.91,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.91, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "36-45": [
            {
              "min": 0.0,
              "max": 0.88,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.88,
              "max": 0.93,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.93, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "46-55": [
            {"min": 0.0, "max": 0.9, "color": Colors.green, "label": "Healthy"},
            {
              "min": 0.9,
              "max": 0.95,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.95, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "56-65": [
            {
              "min": 0.0,
              "max": 0.92,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.92,
              "max": 0.97,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.97, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "65+": [
            {
              "min": 0.0,
              "max": 0.94,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.94,
              "max": 1.0,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 1.0, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
        },
        "female": {
          "18-25": [
            {
              "min": 0.0,
              "max": 0.75,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.75,
              "max": 0.82,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.82, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "26-35": [
            {
              "min": 0.0,
              "max": 0.77,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.77,
              "max": 0.84,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.84, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "36-45": [
            {
              "min": 0.0,
              "max": 0.79,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.79,
              "max": 0.86,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.86, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "46-55": [
            {
              "min": 0.0,
              "max": 0.81,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.81,
              "max": 0.88,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.88, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "56-65": [
            {
              "min": 0.0,
              "max": 0.83,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.83,
              "max": 0.9,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.9, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "65+": [
            {
              "min": 0.0,
              "max": 0.85,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.85,
              "max": 0.92,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.92, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
        },
      },
      "bmi": {
        "male": {
          "18-25": [
            {
              "min": 0.0,
              "max": 18.5,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 18.5,
              "max": 24.9,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 25.0,
              "max": 29.9,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 30.0,
              "max": 34.9,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 35.0,
              "max": 39.9,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 999.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "26-35": [
            {
              "min": 0.0,
              "max": 19.0,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 19.0,
              "max": 25.4,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 25.5,
              "max": 30.4,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 30.5,
              "max": 35.4,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 35.5,
              "max": 39.9,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 999.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "36-45": [
            {
              "min": 0.0,
              "max": 19.5,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 19.5,
              "max": 26.0,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 26.1,
              "max": 30.9,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 31.0,
              "max": 35.9,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 36.0,
              "max": 39.9,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 999.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "46-55": [
            {
              "min": 0.0,
              "max": 20.0,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 20.0,
              "max": 26.5,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 26.6,
              "max": 31.5,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 31.6,
              "max": 36.5,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 36.6,
              "max": 39.9,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 999.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "56-65": [
            {
              "min": 0.0,
              "max": 20.5,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 20.5,
              "max": 27.0,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 27.1,
              "max": 32.0,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 32.1,
              "max": 37.0,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 37.1,
              "max": 39.9,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 999.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "65+": [
            {
              "min": 0.0,
              "max": 21.0,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 21.0,
              "max": 27.5,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 27.6,
              "max": 32.5,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 32.6,
              "max": 37.5,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 37.6,
              "max": 39.9,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 999.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
        },
        "female": {
          "18-25": [
            {
              "min": 0.0,
              "max": 18.5,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 18.5,
              "max": 24.5,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 24.6,
              "max": 29.5,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 29.6,
              "max": 34.5,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 34.6,
              "max": 39.9,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 999.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "26-35": [
            {
              "min": 0.0,
              "max": 19.0,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 19.0,
              "max": 25.0,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 25.1,
              "max": 30.0,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 30.1,
              "max": 35.0,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 35.1,
              "max": 39.9,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 999.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "36-45": [
            {
              "min": 0.0,
              "max": 19.5,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 19.5,
              "max": 25.5,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 25.6,
              "max": 30.5,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 30.6,
              "max": 35.5,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 35.6,
              "max": 39.9,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 999.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "46-55": [
            {
              "min": 0.0,
              "max": 20.0,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 20.0,
              "max": 26.0,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 26.1,
              "max": 31.0,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 31.1,
              "max": 36.0,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 36.1,
              "max": 39.9,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 999.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "56-65": [
            {
              "min": 0.0,
              "max": 20.5,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 20.5,
              "max": 26.5,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 26.6,
              "max": 31.5,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 31.6,
              "max": 36.5,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 36.6,
              "max": 39.9,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 999.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "65+": [
            {
              "min": 0.0,
              "max": 21.0,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 21.0,
              "max": 27.0,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 27.1,
              "max": 32.0,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 32.1,
              "max": 37.0,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 37.1,
              "max": 39.9,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 999.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
        },
      },
      "heart_rate": {
        "male": {
          "18-25": [
            {"min": 0, "max": 49, "color": Colors.grey, "label": "Low"},
            {
              "min": 50,
              "max": 55,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {"min": 56, "max": 61, "color": Colors.green, "label": "Healthy"},
            {"min": 62, "max": 70, "color": Colors.orange, "label": "Elevated"},
            {"min": 71, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "26-35": [
            {"min": 0, "max": 50, "color": Colors.grey, "label": "Low"},
            {
              "min": 51,
              "max": 56,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {"min": 57, "max": 62, "color": Colors.green, "label": "Healthy"},
            {"min": 63, "max": 72, "color": Colors.orange, "label": "Elevated"},
            {"min": 73, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "36-45": [
            {"min": 0, "max": 51, "color": Colors.grey, "label": "Low"},
            {
              "min": 52,
              "max": 57,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {"min": 58, "max": 63, "color": Colors.green, "label": "Healthy"},
            {"min": 64, "max": 74, "color": Colors.orange, "label": "Elevated"},
            {"min": 75, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "46-55": [
            {"min": 0, "max": 52, "color": Colors.grey, "label": "Low"},
            {
              "min": 53,
              "max": 58,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {"min": 59, "max": 64, "color": Colors.green, "label": "Healthy"},
            {"min": 65, "max": 76, "color": Colors.orange, "label": "Elevated"},
            {"min": 77, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "56-65": [
            {"min": 0, "max": 53, "color": Colors.grey, "label": "Low"},
            {
              "min": 54,
              "max": 59,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {"min": 60, "max": 65, "color": Colors.green, "label": "Healthy"},
            {"min": 66, "max": 78, "color": Colors.orange, "label": "Elevated"},
            {"min": 79, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "65+": [
            {"min": 0, "max": 54, "color": Colors.grey, "label": "Low"},
            {
              "min": 55,
              "max": 60,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {"min": 61, "max": 66, "color": Colors.green, "label": "Healthy"},
            {"min": 67, "max": 80, "color": Colors.orange, "label": "Elevated"},
            {"min": 81, "max": 200, "color": Colors.red, "label": "High"},
          ],
        },
        "female": {
          "18-25": [
            {"min": 0, "max": 53, "color": Colors.grey, "label": "Low"},
            {
              "min": 54,
              "max": 60,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {"min": 61, "max": 66, "color": Colors.green, "label": "Healthy"},
            {"min": 67, "max": 75, "color": Colors.orange, "label": "Elevated"},
            {"min": 76, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "26-35": [
            {"min": 0, "max": 54, "color": Colors.grey, "label": "Low"},
            {
              "min": 55,
              "max": 61,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {"min": 62, "max": 67, "color": Colors.green, "label": "Healthy"},
            {"min": 68, "max": 77, "color": Colors.orange, "label": "Elevated"},
            {"min": 78, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "36-45": [
            {"min": 0, "max": 55, "color": Colors.grey, "label": "Low"},
            {
              "min": 56,
              "max": 62,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {"min": 63, "max": 68, "color": Colors.green, "label": "Healthy"},
            {"min": 69, "max": 78, "color": Colors.orange, "label": "Elevated"},
            {"min": 79, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "46-55": [
            {"min": 0, "max": 56, "color": Colors.grey, "label": "Low"},
            {
              "min": 57,
              "max": 63,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {"min": 64, "max": 69, "color": Colors.green, "label": "Healthy"},
            {"min": 70, "max": 80, "color": Colors.orange, "label": "Elevated"},
            {"min": 81, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "56-65": [
            {"min": 0, "max": 57, "color": Colors.grey, "label": "Low"},
            {
              "min": 58,
              "max": 64,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {"min": 65, "max": 70, "color": Colors.green, "label": "Healthy"},
            {"min": 71, "max": 82, "color": Colors.orange, "label": "Elevated"},
            {"min": 83, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "65+": [
            {"min": 0, "max": 58, "color": Colors.grey, "label": "Low"},
            {
              "min": 59,
              "max": 65,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {"min": 66, "max": 71, "color": Colors.green, "label": "Healthy"},
            {"min": 72, "max": 85, "color": Colors.orange, "label": "Elevated"},
            {"min": 86, "max": 200, "color": Colors.red, "label": "High"},
          ],
        },
      },
      "systolic_bp": {
        "male": {
          "18-25": [
            {"min": 0, "max": 119, "color": Colors.green, "label": "Normal"},
            {
              "min": 120,
              "max": 129,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 130,
              "max": 139,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 140,
              "max": 179,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 180,
              "max": 250,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "26-35": [
            {"min": 0, "max": 120, "color": Colors.green, "label": "Normal"},
            {
              "min": 121,
              "max": 129,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 130,
              "max": 139,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 140,
              "max": 179,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 180,
              "max": 250,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "36-45": [
            {"min": 0, "max": 122, "color": Colors.green, "label": "Normal"},
            {
              "min": 123,
              "max": 129,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 130,
              "max": 139,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 140,
              "max": 179,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 180,
              "max": 250,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "46-55": [
            {"min": 0, "max": 124, "color": Colors.green, "label": "Normal"},
            {
              "min": 125,
              "max": 129,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 130,
              "max": 139,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 140,
              "max": 179,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 180,
              "max": 250,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "56-65": [
            {"min": 0, "max": 126, "color": Colors.green, "label": "Normal"},
            {
              "min": 127,
              "max": 134,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 135,
              "max": 144,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 145,
              "max": 179,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 180,
              "max": 250,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "65+": [
            {"min": 0, "max": 128, "color": Colors.green, "label": "Normal"},
            {
              "min": 129,
              "max": 135,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 136,
              "max": 145,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 146,
              "max": 179,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 180,
              "max": 250,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
        },
        "female": {
          "18-25": [
            {"min": 0, "max": 118, "color": Colors.green, "label": "Normal"},
            {
              "min": 119,
              "max": 127,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 128,
              "max": 137,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 138,
              "max": 179,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 180,
              "max": 250,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "26-35": [
            {"min": 0, "max": 119, "color": Colors.green, "label": "Normal"},
            {
              "min": 120,
              "max": 128,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 129,
              "max": 138,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 139,
              "max": 179,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 180,
              "max": 250,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "36-45": [
            {"min": 0, "max": 121, "color": Colors.green, "label": "Normal"},
            {
              "min": 122,
              "max": 129,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 130,
              "max": 139,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 140,
              "max": 179,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 180,
              "max": 250,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "46-55": [
            {"min": 0, "max": 123, "color": Colors.green, "label": "Normal"},
            {
              "min": 124,
              "max": 130,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 131,
              "max": 140,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 141,
              "max": 179,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 180,
              "max": 250,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "56-65": [
            {"min": 0, "max": 125, "color": Colors.green, "label": "Normal"},
            {
              "min": 126,
              "max": 132,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 133,
              "max": 142,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 143,
              "max": 179,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 180,
              "max": 250,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "65+": [
            {"min": 0, "max": 127, "color": Colors.green, "label": "Normal"},
            {
              "min": 128,
              "max": 133,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 134,
              "max": 143,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 144,
              "max": 179,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 180,
              "max": 250,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
        },
      },
      "diastolic_bp": {
        "male": {
          "18-25": [
            {"min": 0, "max": 79, "color": Colors.green, "label": "Normal"},
            {"min": 80, "max": 89, "color": Colors.yellow, "label": "Elevated"},
            {
              "min": 90,
              "max": 98,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 99,
              "max": 118,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 119,
              "max": 200,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "26-35": [
            {"min": 0, "max": 80, "color": Colors.green, "label": "Normal"},
            {"min": 81, "max": 90, "color": Colors.yellow, "label": "Elevated"},
            {
              "min": 91,
              "max": 100,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 101,
              "max": 120,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 121,
              "max": 200,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "36-45": [
            {"min": 0, "max": 82, "color": Colors.green, "label": "Normal"},
            {"min": 83, "max": 92, "color": Colors.yellow, "label": "Elevated"},
            {
              "min": 93,
              "max": 102,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 103,
              "max": 122,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 123,
              "max": 200,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "46-55": [
            {"min": 0, "max": 84, "color": Colors.green, "label": "Normal"},
            {"min": 85, "max": 94, "color": Colors.yellow, "label": "Elevated"},
            {
              "min": 95,
              "max": 104,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 105,
              "max": 124,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 125,
              "max": 200,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "56-65": [
            {"min": 0, "max": 86, "color": Colors.green, "label": "Normal"},
            {"min": 87, "max": 96, "color": Colors.yellow, "label": "Elevated"},
            {
              "min": 97,
              "max": 106,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 107,
              "max": 126,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 127,
              "max": 200,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "65+": [
            {"min": 0, "max": 88, "color": Colors.green, "label": "Normal"},
            {"min": 89, "max": 98, "color": Colors.yellow, "label": "Elevated"},
            {
              "min": 99,
              "max": 108,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 109,
              "max": 128,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 129,
              "max": 200,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
        },
        "female": {
          "18-25": [
            {"min": 0, "max": 78, "color": Colors.green, "label": "Normal"},
            {"min": 79, "max": 88, "color": Colors.yellow, "label": "Elevated"},
            {
              "min": 89,
              "max": 98,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 99,
              "max": 118,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 119,
              "max": 200,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "26-35": [
            {"min": 0, "max": 80, "color": Colors.green, "label": "Normal"},
            {"min": 81, "max": 90, "color": Colors.yellow, "label": "Elevated"},
            {
              "min": 91,
              "max": 100,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 101,
              "max": 120,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 121,
              "max": 200,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "36-45": [
            {"min": 0, "max": 82, "color": Colors.green, "label": "Normal"},
            {"min": 83, "max": 92, "color": Colors.yellow, "label": "Elevated"},
            {
              "min": 93,
              "max": 102,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 103,
              "max": 122,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 123,
              "max": 200,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "46-55": [
            {"min": 0, "max": 84, "color": Colors.green, "label": "Normal"},
            {"min": 85, "max": 94, "color": Colors.yellow, "label": "Elevated"},
            {
              "min": 95,
              "max": 104,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 105,
              "max": 124,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 125,
              "max": 200,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "56-65": [
            {"min": 0, "max": 86, "color": Colors.green, "label": "Normal"},
            {"min": 87, "max": 96, "color": Colors.yellow, "label": "Elevated"},
            {
              "min": 97,
              "max": 106,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 107,
              "max": 126,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 127,
              "max": 200,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
          "65+": [
            {"min": 0, "max": 88, "color": Colors.green, "label": "Normal"},
            {"min": 89, "max": 98, "color": Colors.yellow, "label": "Elevated"},
            {
              "min": 99,
              "max": 108,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 109,
              "max": 128,
              "color": Colors.red,
              "label": "Stage 2 Hypertension"
            },
            {
              "min": 129,
              "max": 200,
              "color": Colors.purple,
              "label": "Hypertensive Crisis"
            },
          ],
        },
      },
      "waist_to_height_ratio": {
        "male": {
          "18-25": [
            {
              "min": 0.0,
              "max": 0.34,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.35, "max": 0.42, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.43,
              "max": 0.46,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {"min": 0.47, "max": 0.52, "color": Colors.green, "label": "Ideal"},
            {"min": 0.53, "max": 0.57, "color": Colors.orange, "label": "High"},
            {
              "min": 0.58,
              "max": 0.62,
              "color": Color(0xFFF08080),
              "label": "Very High"
            },
            {
              "min": 0.63,
              "max": 2.0,
              "color": Colors.red,
              "label": "Extremely High"
            },
          ],
          "26-35": [
            {
              "min": 0.0,
              "max": 0.35,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.36, "max": 0.43, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.44,
              "max": 0.47,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {"min": 0.48, "max": 0.53, "color": Colors.green, "label": "Ideal"},
            {"min": 0.54, "max": 0.58, "color": Colors.orange, "label": "High"},
            {
              "min": 0.59,
              "max": 0.63,
              "color": Color(0xFFF08080),
              "label": "Very High"
            },
            {
              "min": 0.64,
              "max": 2.0,
              "color": Colors.red,
              "label": "Extremely High"
            },
          ],
          "36-45": [
            {
              "min": 0.0,
              "max": 0.36,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.37, "max": 0.44, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.45,
              "max": 0.48,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {"min": 0.49, "max": 0.54, "color": Colors.green, "label": "Ideal"},
            {"min": 0.55, "max": 0.59, "color": Colors.orange, "label": "High"},
            {
              "min": 0.60,
              "max": 0.64,
              "color": Color(0xFFF08080),
              "label": "Very High"
            },
            {
              "min": 0.65,
              "max": 2.0,
              "color": Colors.red,
              "label": "Extremely High"
            },
          ],
          "46-55": [
            {
              "min": 0.0,
              "max": 0.36,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.37, "max": 0.44, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.45,
              "max": 0.48,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {"min": 0.49, "max": 0.54, "color": Colors.green, "label": "Ideal"},
            {"min": 0.55, "max": 0.59, "color": Colors.orange, "label": "High"},
            {
              "min": 0.60,
              "max": 0.64,
              "color": Color(0xFFF08080),
              "label": "Very High"
            },
            {
              "min": 0.65,
              "max": 2.0,
              "color": Colors.red,
              "label": "Extremely High"
            },
          ],
          "56-65": [
            {
              "min": 0.0,
              "max": 0.37,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.38, "max": 0.45, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.46,
              "max": 0.49,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {"min": 0.50, "max": 0.55, "color": Colors.green, "label": "Ideal"},
            {"min": 0.56, "max": 0.60, "color": Colors.orange, "label": "High"},
            {
              "min": 0.61,
              "max": 0.65,
              "color": Color(0xFFF08080),
              "label": "Very High"
            },
            {
              "min": 0.66,
              "max": 2.0,
              "color": Colors.red,
              "label": "Extremely High"
            },
          ],
          "65+": [
            {
              "min": 0.0,
              "max": 0.38,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.39, "max": 0.46, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.47,
              "max": 0.50,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {"min": 0.51, "max": 0.56, "color": Colors.green, "label": "Ideal"},
            {"min": 0.57, "max": 0.61, "color": Colors.orange, "label": "High"},
            {
              "min": 0.62,
              "max": 0.66,
              "color": Color(0xFFF08080),
              "label": "Very High"
            },
            {
              "min": 0.67,
              "max": 2.0,
              "color": Colors.red,
              "label": "Extremely High"
            },
          ],
        },
        "female": {
          "18-25": [
            {
              "min": 0.0,
              "max": 0.32,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.33, "max": 0.40, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.41,
              "max": 0.45,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {"min": 0.46, "max": 0.51, "color": Colors.green, "label": "Ideal"},
            {"min": 0.52, "max": 0.56, "color": Colors.orange, "label": "High"},
            {
              "min": 0.57,
              "max": 0.61,
              "color": Color(0xFFF08080),
              "label": "Very High"
            },
            {
              "min": 0.62,
              "max": 2.0,
              "color": Colors.red,
              "label": "Extremely High"
            },
          ],
          "26-35": [
            {
              "min": 0.0,
              "max": 0.33,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.34, "max": 0.41, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.42,
              "max": 0.46,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {"min": 0.47, "max": 0.52, "color": Colors.green, "label": "Ideal"},
            {"min": 0.53, "max": 0.57, "color": Colors.orange, "label": "High"},
            {
              "min": 0.58,
              "max": 0.62,
              "color": Color(0xFFF08080),
              "label": "Very High"
            },
            {
              "min": 0.63,
              "max": 2.0,
              "color": Colors.red,
              "label": "Extremely High"
            },
          ],
          "36-45": [
            {
              "min": 0.0,
              "max": 0.34,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.35, "max": 0.42, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.43,
              "max": 0.47,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {"min": 0.48, "max": 0.53, "color": Colors.green, "label": "Ideal"},
            {"min": 0.54, "max": 0.58, "color": Colors.orange, "label": "High"},
            {
              "min": 0.59,
              "max": 0.63,
              "color": Color(0xFFF08080),
              "label": "Very High"
            },
            {
              "min": 0.64,
              "max": 2.0,
              "color": Colors.red,
              "label": "Extremely High"
            },
          ],
          "46-55": [
            {
              "min": 0.0,
              "max": 0.34,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.35, "max": 0.42, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.43,
              "max": 0.47,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {"min": 0.48, "max": 0.53, "color": Colors.green, "label": "Ideal"},
            {"min": 0.54, "max": 0.58, "color": Colors.orange, "label": "High"},
            {
              "min": 0.59,
              "max": 0.63,
              "color": Color(0xFFF08080),
              "label": "Very High"
            },
            {
              "min": 0.64,
              "max": 2.0,
              "color": Colors.red,
              "label": "Extremely High"
            },
          ],
          "56-65": [
            {
              "min": 0.0,
              "max": 0.35,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.36, "max": 0.43, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.44,
              "max": 0.48,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {"min": 0.49, "max": 0.54, "color": Colors.green, "label": "Ideal"},
            {"min": 0.55, "max": 0.59, "color": Colors.orange, "label": "High"},
            {
              "min": 0.60,
              "max": 0.64,
              "color": Color(0xFFF08080),
              "label": "Very High"
            },
            {
              "min": 0.65,
              "max": 2.0,
              "color": Colors.red,
              "label": "Extremely High"
            },
          ],
          "65+": [
            {
              "min": 0.0,
              "max": 0.36,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.37, "max": 0.44, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.45,
              "max": 0.49,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {"min": 0.50, "max": 0.55, "color": Colors.green, "label": "Ideal"},
            {"min": 0.56, "max": 0.60, "color": Colors.orange, "label": "High"},
            {
              "min": 0.61,
              "max": 0.65,
              "color": Color(0xFFF08080),
              "label": "Very High"
            },
            {
              "min": 0.66,
              "max": 2.0,
              "color": Colors.red,
              "label": "Extremely High"
            },
          ],
        },
      },
      "waist_to_hip_ratio": {
        "male": {
          "18-25": [
            {
              "min": 0.0,
              "max": 0.85,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.86,
              "max": 0.94,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.95, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "26-35": [
            {
              "min": 0.0,
              "max": 0.86,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.87,
              "max": 0.96,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.97, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "36-45": [
            {
              "min": 0.0,
              "max": 0.88,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.89,
              "max": 0.98,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.99, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "46-55": [
            {
              "min": 0.0,
              "max": 0.90,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.91,
              "max": 1.00,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 1.01, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "56-65": [
            {
              "min": 0.0,
              "max": 0.92,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.93,
              "max": 1.02,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 1.03, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "65+": [
            {
              "min": 0.0,
              "max": 0.94,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.95,
              "max": 1.04,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 1.05, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
        },
        "female": {
          "18-25": [
            {
              "min": 0.0,
              "max": 0.75,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.76,
              "max": 0.82,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.83, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "26-35": [
            {
              "min": 0.0,
              "max": 0.76,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.77,
              "max": 0.84,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.85, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "36-45": [
            {
              "min": 0.0,
              "max": 0.78,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.79,
              "max": 0.86,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.87, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "46-55": [
            {
              "min": 0.0,
              "max": 0.80,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.81,
              "max": 0.88,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.89, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "56-65": [
            {
              "min": 0.0,
              "max": 0.82,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.83,
              "max": 0.90,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.91, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "65+": [
            {
              "min": 0.0,
              "max": 0.84,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.85,
              "max": 0.92,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.93, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
        },
      },
    }; //Map string

    // ✅ Select Classification Ranges Based on Gender & Age
    List<Map<String, dynamic>> selectedRanges;
    if (classificationRanges[metric]!.containsKey(gender)) {
      if (classificationRanges[metric]![gender]!.containsKey(ageGroup)) {
        selectedRanges = classificationRanges[metric]![gender]![ageGroup]!;
      } else {
        selectedRanges = classificationRanges[metric]![gender]![
            "18-25"]!; // Default to lowest age range
      }
    } else {
      if (classificationRanges[metric]!["default"]!.containsKey(ageGroup)) {
        selectedRanges = classificationRanges[metric]!["default"]![ageGroup]!;
      } else {
        selectedRanges = classificationRanges[metric]!["default"]![
            "18-25"]!; // Default fallback
      }
    }

    // ✅ Assign Colors to Data Points
    final List<ChartData> chartData = List.generate(xData.length, (index) {
      DateTime date = DateTime.parse(xData[index]);
      double value = yData[index];

      // Assign colors based on metric classification
      Color pointColor = Colors.grey;
      for (var range in selectedRanges) {
        if (value >= range["min"] && value < range["max"]) {
          pointColor = range["color"];
          break;
        }
      }

      return ChartData(date, value, pointColor);
    });

    // ✅ Generate Background Bands
    List<PlotBand> plotBands = selectedRanges.map((range) {
      return PlotBand(
        start: range["min"],
        end: range["max"],
        color: range["color"].withOpacity(0.60), // ✅ Light background colors
        borderWidth: 0,
      );
    }).toList();

    // ✅ Trackball for Data Interaction
    final TrackballBehavior trackballBehavior = TrackballBehavior(
      enable: true,
      tooltipAlignment: ChartAlignment.near,
      activationMode: ActivationMode.singleTap, // Tap to activate trackball
      tooltipDisplayMode: TrackballDisplayMode.nearestPoint, // Show all points
      shouldAlwaysShow: true,
      tooltipSettings: InteractiveTooltip(
        enable: true,
        format: 'Date: point.x\nValue: point.y', // ✅ Show Date & Value
      ),
    );

    // ✅ Enable Zooming & Panning
    final ZoomPanBehavior zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true, // ✅ Pinch to Zoom
      enablePanning: true, // ✅ Drag to Pan
      enableDoubleTapZooming: true, // ✅ Double Tap to Zoom
      zoomMode: ZoomMode.x, // ✅ Zoom only in X-axis
    );

    return Column(
      children: [
        // ✅ Chart Widget
        Expanded(
          child: SfCartesianChart(
            zoomPanBehavior: zoomPanBehavior, // ✅ Zoom & Pan enabled
            trackballBehavior: trackballBehavior, // ✅ Trackball enabled
            primaryXAxis: DateTimeAxis(
              dateFormat: DateFormat.MMMd(),
              intervalType: DateTimeIntervalType.days,
              majorGridLines: const MajorGridLines(width: 0),
              interval: 7,
            ),
            primaryYAxis: NumericAxis(
              plotBands: plotBands, // ✅ Background Colors Applied
            ),
            series: <CartesianSeries>[
              // ✅ Line Series (Fixed Color)
              SplineSeries<ChartData, DateTime>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                color: Colors.blueAccent.withOpacity(0.75),
                width: 1,
                splineType: SplineType.natural,
                enableTooltip: false,
              ),
              // ✅ Scatter Series (Smaller Markers)
              ScatterSeries<ChartData, DateTime>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                pointColorMapper: (ChartData data, _) => data.color,
                markerSettings: MarkerSettings(
                  isVisible: true,
                  shape: DataMarkerType.circle,
                  borderWidth: 1.5,
                  borderColor: Colors.blueAccent,
                  width: 7, // ✅ Smaller Size
                  height: 7,
                ),
                enableTooltip: true,
              ),
            ],
          ),
        ),

        // ✅ Custom Legend (at the Bottom)
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Wrap(
            spacing: 12,
            alignment: WrapAlignment.center,
            children: selectedRanges
                .map((range) => LegendItem(range["label"], range["color"]))
                .map((item) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: item.color,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(item.label, style: TextStyle(fontSize: 12)),
                      ],
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

// ✅ Define the ChartData class
class ChartData {
  final DateTime x;
  final double y;
  final Color color;

  ChartData(this.x, this.y, this.color);
}

// ✅ Define the LegendItem class
class LegendItem {
  final String label;
  final Color color;

  LegendItem(this.label, this.color);
}

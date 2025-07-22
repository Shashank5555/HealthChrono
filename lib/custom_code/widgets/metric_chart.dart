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
  final String gender;
  final int age;

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
              "max": 0.849,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.85,
              "max": 0.899,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.90, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "26-35": [
            {
              "min": 0.0,
              "max": 0.859,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.86,
              "max": 0.909,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.91, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "36-45": [
            {
              "min": 0.0,
              "max": 0.879,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.88,
              "max": 0.929,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.93, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "46-55": [
            {
              "min": 0.0,
              "max": 0.899,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.90,
              "max": 0.949,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.95, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "56-65": [
            {
              "min": 0.0,
              "max": 0.919,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.92,
              "max": 0.969,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.97, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "65+": [
            {
              "min": 0.0,
              "max": 0.939,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.94,
              "max": 0.999,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 1.00, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
        },
        "female": {
          "18-25": [
            {
              "min": 0.0,
              "max": 0.749,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.75,
              "max": 0.819,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.82, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "26-35": [
            {
              "min": 0.0,
              "max": 0.769,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.77,
              "max": 0.839,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.84, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "36-45": [
            {
              "min": 0.0,
              "max": 0.789,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.79,
              "max": 0.859,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.86, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "46-55": [
            {
              "min": 0.0,
              "max": 0.809,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.81,
              "max": 0.879,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.88, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "56-65": [
            {
              "min": 0.0,
              "max": 0.829,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.83,
              "max": 0.899,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.90, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
          "65+": [
            {
              "min": 0.0,
              "max": 0.849,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 0.85,
              "max": 0.919,
              "color": Colors.yellow,
              "label": "Borderline"
            },
            {"min": 0.92, "max": 2.0, "color": Colors.red, "label": "Risky"},
          ],
        },
      },
      "weight": {
        "male": {
          "18-25": [
            {
              "min": 60,
              "max": 129.999,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 130,
              "max": 174.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 175,
              "max": 199.999,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 200,
              "max": 229.999,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 230,
              "max": 400,
              "color": Colors.red,
              "label": "Severely Obese"
            },
          ],
          "26-35": [
            {
              "min": 60,
              "max": 134.999,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 135,
              "max": 179.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 180,
              "max": 209.999,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 210,
              "max": 239.999,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 240,
              "max": 400,
              "color": Colors.red,
              "label": "Severely Obese"
            },
          ],
          "36-45": [
            {
              "min": 60,
              "max": 139.999,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 140,
              "max": 184.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 185,
              "max": 214.999,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 215,
              "max": 244.999,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 245,
              "max": 400,
              "color": Colors.red,
              "label": "Severely Obese"
            },
          ],
          "46-55": [
            {
              "min": 60,
              "max": 144.999,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 145,
              "max": 189.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 190,
              "max": 219.999,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 220,
              "max": 249.999,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 250,
              "max": 400,
              "color": Colors.red,
              "label": "Severely Obese"
            },
          ],
          "56-65": [
            {
              "min": 60,
              "max": 149.999,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 150,
              "max": 194.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 195,
              "max": 224.999,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 225,
              "max": 254.999,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 255,
              "max": 400,
              "color": Colors.red,
              "label": "Severely Obese"
            },
          ],
          "65+": [
            {
              "min": 60,
              "max": 154.999,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 155,
              "max": 199.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 200,
              "max": 229.999,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 230,
              "max": 259.999,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 260,
              "max": 400,
              "color": Colors.red,
              "label": "Severely Obese"
            },
          ]
        },
        "female": {
          "18-25": [
            {
              "min": 60,
              "max": 109.999,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 110,
              "max": 159.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 160,
              "max": 184.999,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 185,
              "max": 209.999,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 210,
              "max": 350,
              "color": Colors.red,
              "label": "Severely Obese"
            },
          ],
          "26-35": [
            {
              "min": 115,
              "max": 164.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 165,
              "max": 189.999,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 190,
              "max": 214.999,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 215,
              "max": 350,
              "color": Colors.red,
              "label": "Severely Obese"
            },
          ],
          "36-45": [
            {
              "min": 120,
              "max": 169.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 170,
              "max": 194.999,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 195,
              "max": 219.999,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 220,
              "max": 350,
              "color": Colors.red,
              "label": "Severely Obese"
            },
          ],
          "46-55": [
            {
              "min": 125,
              "max": 174.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 175,
              "max": 199.999,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 200,
              "max": 224.999,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 225,
              "max": 350,
              "color": Colors.red,
              "label": "Severely Obese"
            },
          ],
          "56-65": [
            {
              "min": 130,
              "max": 179.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 180,
              "max": 204.999,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 205,
              "max": 229.999,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 230,
              "max": 350,
              "color": Colors.red,
              "label": "Severely Obese"
            },
          ],
          "65+": [
            {
              "min": 135,
              "max": 184.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 185,
              "max": 209.999,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 210,
              "max": 234.999,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 235,
              "max": 350,
              "color": Colors.red,
              "label": "Severely Obese"
            },
          ],
        },
      },
      "bmi": {
        "male": {
          "18-25": [
            {
              "min": 0.0,
              "max": 18.499,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 18.5,
              "max": 24.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 25.0,
              "max": 29.999,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 30.0,
              "max": 34.999,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 35.0,
              "max": 39.999,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 205.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "26-35": [
            {
              "min": 0.0,
              "max": 18.999,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 19.0,
              "max": 25.499,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 25.5,
              "max": 30.499,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 30.5,
              "max": 35.499,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 35.5,
              "max": 39.999,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 205.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "36-45": [
            {
              "min": 0.0,
              "max": 19.499,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 19.5,
              "max": 26.099,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 26.1,
              "max": 30.999,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 31.0,
              "max": 35.999,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 36.0,
              "max": 39.999,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 205.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "46-55": [
            {
              "min": 0.0,
              "max": 19.999,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 20.0,
              "max": 26.599,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 26.6,
              "max": 31.599,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 31.6,
              "max": 36.599,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 36.6,
              "max": 39.999,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 205.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "56-65": [
            {
              "min": 0.0,
              "max": 20.499,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 20.5,
              "max": 27.099,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 27.1,
              "max": 32.099,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 32.1,
              "max": 37.099,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 37.1,
              "max": 39.999,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 205.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "65+": [
            {
              "min": 0.0,
              "max": 20.999,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 21.0,
              "max": 27.599,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 27.6,
              "max": 32.599,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 32.6,
              "max": 37.599,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 37.6,
              "max": 39.999,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 205.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
        },
        "female": {
          "18-25": [
            {
              "min": 0.0,
              "max": 18.499,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 18.5,
              "max": 24.599,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 24.6,
              "max": 29.599,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 29.6,
              "max": 34.599,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 34.6,
              "max": 39.999,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 160.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "26-35": [
            {
              "min": 0.0,
              "max": 18.999,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 19.0,
              "max": 25.099,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 25.1,
              "max": 30.099,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 30.1,
              "max": 35.099,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 35.1,
              "max": 39.999,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 160.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
          "36-45": [
            {
              "min": 0.0,
              "max": 19.499,
              "color": Colors.grey,
              "label": "Underweight"
            },
            {
              "min": 19.5,
              "max": 25.599,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 25.6,
              "max": 30.599,
              "color": Colors.yellow,
              "label": "Overweight"
            },
            {
              "min": 30.6,
              "max": 35.599,
              "color": Colors.orange,
              "label": "Obese"
            },
            {
              "min": 35.6,
              "max": 39.999,
              "color": Colors.red,
              "label": "Severely Obese"
            },
            {
              "min": 40.0,
              "max": 160.0,
              "color": Colors.purple,
              "label": "Morbidly Obese"
            },
          ],
        },
      },
      "heart_rate": {
        "male": {
          "18-25": [
            {"min": 0, "max": 49.999, "color": Colors.grey, "label": "Low"},
            {
              "min": 50,
              "max": 55.999,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {
              "min": 56,
              "max": 61.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 62,
              "max": 70.999,
              "color": Colors.orange,
              "label": "Elevated"
            },
            {"min": 71, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "26-35": [
            {"min": 0, "max": 50.999, "color": Colors.grey, "label": "Low"},
            {
              "min": 51,
              "max": 56.999,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {
              "min": 57,
              "max": 62.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 63,
              "max": 72.999,
              "color": Colors.orange,
              "label": "Elevated"
            },
            {"min": 73, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "36-45": [
            {"min": 0, "max": 51.999, "color": Colors.grey, "label": "Low"},
            {
              "min": 52,
              "max": 57.999,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {
              "min": 58,
              "max": 63.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 64,
              "max": 74.999,
              "color": Colors.orange,
              "label": "Elevated"
            },
            {"min": 75, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "46-55": [
            {"min": 0, "max": 52.999, "color": Colors.grey, "label": "Low"},
            {
              "min": 53,
              "max": 58.999,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {
              "min": 59,
              "max": 64.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 65,
              "max": 76.999,
              "color": Colors.orange,
              "label": "Elevated"
            },
            {"min": 77, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "56-65": [
            {"min": 0, "max": 53.999, "color": Colors.grey, "label": "Low"},
            {
              "min": 54,
              "max": 59.999,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {
              "min": 60,
              "max": 65.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 66,
              "max": 78.999,
              "color": Colors.orange,
              "label": "Elevated"
            },
            {"min": 79, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "65+": [
            {"min": 0, "max": 54.999, "color": Colors.grey, "label": "Low"},
            {
              "min": 55,
              "max": 60.999,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {
              "min": 61,
              "max": 66.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 67,
              "max": 80.999,
              "color": Colors.orange,
              "label": "Elevated"
            },
            {"min": 81, "max": 200, "color": Colors.red, "label": "High"},
          ],
        },
        "female": {
          "18-25": [
            {"min": 0, "max": 53.999, "color": Colors.grey, "label": "Low"},
            {
              "min": 54,
              "max": 60.999,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {
              "min": 61,
              "max": 66.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 67,
              "max": 75.999,
              "color": Colors.orange,
              "label": "Elevated"
            },
            {"min": 76, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "26-35": [
            {"min": 0, "max": 54.999, "color": Colors.grey, "label": "Low"},
            {
              "min": 55,
              "max": 61.999,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {
              "min": 62,
              "max": 67.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 68,
              "max": 77.999,
              "color": Colors.orange,
              "label": "Elevated"
            },
            {"min": 78, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "36-45": [
            {"min": 0, "max": 55.999, "color": Colors.grey, "label": "Low"},
            {
              "min": 56,
              "max": 62.999,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {
              "min": 63,
              "max": 68.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 69,
              "max": 78.999,
              "color": Colors.orange,
              "label": "Elevated"
            },
            {"min": 79, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "46-55": [
            {"min": 0, "max": 56.999, "color": Colors.grey, "label": "Low"},
            {
              "min": 57,
              "max": 63.999,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {
              "min": 64,
              "max": 69.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 70,
              "max": 80.999,
              "color": Colors.orange,
              "label": "Elevated"
            },
            {"min": 81, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "56-65": [
            {"min": 0, "max": 57.999, "color": Colors.grey, "label": "Low"},
            {
              "min": 58,
              "max": 64.999,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {
              "min": 65,
              "max": 70.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 71,
              "max": 82.999,
              "color": Colors.orange,
              "label": "Elevated"
            },
            {"min": 83, "max": 200, "color": Colors.red, "label": "High"},
          ],
          "65+": [
            {"min": 0, "max": 58.999, "color": Colors.grey, "label": "Low"},
            {
              "min": 59,
              "max": 65.999,
              "color": Colors.yellow,
              "label": "Below Normal"
            },
            {
              "min": 66,
              "max": 71.999,
              "color": Colors.green,
              "label": "Healthy"
            },
            {
              "min": 72,
              "max": 85.999,
              "color": Colors.orange,
              "label": "Elevated"
            },
            {"min": 86, "max": 200, "color": Colors.red, "label": "High"},
          ],
        },
      },
      "systolic_bp": {
        "male": {
          "18-25": [
            {
              "min": 0,
              "max": 119.999,
              "color": Colors.green,
              "label": "Normal"
            },
            {
              "min": 120,
              "max": 129.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 130,
              "max": 139.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 140,
              "max": 179.999,
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
            {
              "min": 0,
              "max": 120.999,
              "color": Colors.green,
              "label": "Normal"
            },
            {
              "min": 121,
              "max": 129.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 130,
              "max": 139.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 140,
              "max": 179.999,
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
            {
              "min": 0,
              "max": 122.999,
              "color": Colors.green,
              "label": "Normal"
            },
            {
              "min": 123,
              "max": 129.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 130,
              "max": 139.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 140,
              "max": 179.999,
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
            {
              "min": 0,
              "max": 124.999,
              "color": Colors.green,
              "label": "Normal"
            },
            {
              "min": 125,
              "max": 129.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 130,
              "max": 139.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 140,
              "max": 179.999,
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
            {
              "min": 0,
              "max": 126.999,
              "color": Colors.green,
              "label": "Normal"
            },
            {
              "min": 127,
              "max": 134.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 135,
              "max": 144.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 145,
              "max": 179.999,
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
            {
              "min": 0,
              "max": 128.999,
              "color": Colors.green,
              "label": "Normal"
            },
            {
              "min": 129,
              "max": 135.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 136,
              "max": 145.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 146,
              "max": 179.999,
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
            {
              "min": 0,
              "max": 118.999,
              "color": Colors.green,
              "label": "Normal"
            },
            {
              "min": 119,
              "max": 127.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 128,
              "max": 137.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 138,
              "max": 179.999,
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
            {
              "min": 0,
              "max": 119.999,
              "color": Colors.green,
              "label": "Normal"
            },
            {
              "min": 120,
              "max": 128.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 129,
              "max": 138.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 139,
              "max": 179.999,
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
            {
              "min": 0,
              "max": 121.999,
              "color": Colors.green,
              "label": "Normal"
            },
            {
              "min": 122,
              "max": 129.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 130,
              "max": 139.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 140,
              "max": 179.999,
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
            {
              "min": 0,
              "max": 123.999,
              "color": Colors.green,
              "label": "Normal"
            },
            {
              "min": 124,
              "max": 130.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 131,
              "max": 140.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 141,
              "max": 179.999,
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
            {
              "min": 0,
              "max": 125.999,
              "color": Colors.green,
              "label": "Normal"
            },
            {
              "min": 126,
              "max": 132.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 133,
              "max": 142.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 143,
              "max": 179.999,
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
            {
              "min": 0,
              "max": 127.999,
              "color": Colors.green,
              "label": "Normal"
            },
            {
              "min": 128,
              "max": 133.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 134,
              "max": 143.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 144,
              "max": 179.999,
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
            {"min": 0, "max": 79.999, "color": Colors.green, "label": "Normal"},
            {
              "min": 80,
              "max": 89.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 90,
              "max": 98.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 99,
              "max": 118.999,
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
            {"min": 0, "max": 80.999, "color": Colors.green, "label": "Normal"},
            {
              "min": 81,
              "max": 90.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 91,
              "max": 100.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 101,
              "max": 120.999,
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
            {"min": 0, "max": 82.999, "color": Colors.green, "label": "Normal"},
            {
              "min": 83,
              "max": 92.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 93,
              "max": 102.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 103,
              "max": 122.999,
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
            {"min": 0, "max": 84.999, "color": Colors.green, "label": "Normal"},
            {
              "min": 85,
              "max": 94.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 95,
              "max": 104.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 105,
              "max": 124.999,
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
            {"min": 0, "max": 86.999, "color": Colors.green, "label": "Normal"},
            {
              "min": 87,
              "max": 96.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 97,
              "max": 106.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 107,
              "max": 126.999,
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
            {"min": 0, "max": 88.999, "color": Colors.green, "label": "Normal"},
            {
              "min": 89,
              "max": 98.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 99,
              "max": 108.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 109,
              "max": 128.999,
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
            {"min": 0, "max": 78.999, "color": Colors.green, "label": "Normal"},
            {
              "min": 79,
              "max": 88.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 89,
              "max": 98.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 99,
              "max": 118.999,
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
            {"min": 0, "max": 80.999, "color": Colors.green, "label": "Normal"},
            {
              "min": 81,
              "max": 90.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 91,
              "max": 100.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 101,
              "max": 120.999,
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
            {"min": 0, "max": 82.999, "color": Colors.green, "label": "Normal"},
            {
              "min": 83,
              "max": 92.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 93,
              "max": 102.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 103,
              "max": 122.999,
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
            {"min": 0, "max": 84.999, "color": Colors.green, "label": "Normal"},
            {
              "min": 85,
              "max": 94.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 95,
              "max": 104.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 105,
              "max": 124.999,
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
            {"min": 0, "max": 86.999, "color": Colors.green, "label": "Normal"},
            {
              "min": 87,
              "max": 96.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 97,
              "max": 106.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 107,
              "max": 126.999,
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
            {"min": 0, "max": 88.999, "color": Colors.green, "label": "Normal"},
            {
              "min": 89,
              "max": 98.999,
              "color": Colors.yellow,
              "label": "Elevated"
            },
            {
              "min": 99,
              "max": 108.999,
              "color": Colors.orange,
              "label": "Stage 1 Hypertension"
            },
            {
              "min": 109,
              "max": 128.999,
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
              "max": 0.349,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.35, "max": 0.429, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.43,
              "max": 0.469,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {
              "min": 0.47,
              "max": 0.529,
              "color": Colors.green,
              "label": "Ideal"
            },
            {
              "min": 0.53,
              "max": 0.579,
              "color": Colors.orange,
              "label": "High"
            },
            {
              "min": 0.58,
              "max": 0.629,
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
              "max": 0.359,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.36, "max": 0.439, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.44,
              "max": 0.479,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {
              "min": 0.48,
              "max": 0.539,
              "color": Colors.green,
              "label": "Ideal"
            },
            {
              "min": 0.54,
              "max": 0.589,
              "color": Colors.orange,
              "label": "High"
            },
            {
              "min": 0.59,
              "max": 0.639,
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
              "max": 0.369,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.37, "max": 0.449, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.45,
              "max": 0.489,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {
              "min": 0.49,
              "max": 0.549,
              "color": Colors.green,
              "label": "Ideal"
            },
            {
              "min": 0.55,
              "max": 0.599,
              "color": Colors.orange,
              "label": "High"
            },
            {
              "min": 0.60,
              "max": 0.649,
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
              "max": 0.379,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.38, "max": 0.459, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.46,
              "max": 0.499,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {
              "min": 0.50,
              "max": 0.559,
              "color": Colors.green,
              "label": "Ideal"
            },
            {
              "min": 0.56,
              "max": 0.609,
              "color": Colors.orange,
              "label": "High"
            },
            {
              "min": 0.61,
              "max": 0.659,
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
          "56-65": [
            {
              "min": 0.0,
              "max": 0.389,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.39, "max": 0.469, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.47,
              "max": 0.509,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {
              "min": 0.51,
              "max": 0.569,
              "color": Colors.green,
              "label": "Ideal"
            },
            {
              "min": 0.57,
              "max": 0.619,
              "color": Colors.orange,
              "label": "High"
            },
            {
              "min": 0.62,
              "max": 0.669,
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
          "65+": [
            {
              "min": 0.0,
              "max": 0.399,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.40, "max": 0.479, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.48,
              "max": 0.519,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {
              "min": 0.52,
              "max": 0.579,
              "color": Colors.green,
              "label": "Ideal"
            },
            {
              "min": 0.58,
              "max": 0.629,
              "color": Colors.orange,
              "label": "High"
            },
            {
              "min": 0.63,
              "max": 0.679,
              "color": Color(0xFFF08080),
              "label": "Very High"
            },
            {
              "min": 0.68,
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
              "max": 0.329,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.33, "max": 0.409, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.41,
              "max": 0.459,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {
              "min": 0.46,
              "max": 0.519,
              "color": Colors.green,
              "label": "Ideal"
            },
            {
              "min": 0.52,
              "max": 0.569,
              "color": Colors.orange,
              "label": "High"
            },
            {
              "min": 0.57,
              "max": 0.619,
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
              "max": 0.319,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.34, "max": 0.419, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.42,
              "max": 0.469,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {
              "min": 0.47,
              "max": 0.529,
              "color": Colors.green,
              "label": "Ideal"
            },
            {
              "min": 0.53,
              "max": 0.579,
              "color": Colors.orange,
              "label": "High"
            },
            {
              "min": 0.58,
              "max": 0.629,
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
              "max": 0.349,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.35, "max": 0.429, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.43,
              "max": 0.479,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {
              "min": 0.48,
              "max": 0.539,
              "color": Colors.green,
              "label": "Ideal"
            },
            {
              "min": 0.54,
              "max": 0.589,
              "color": Colors.orange,
              "label": "High"
            },
            {
              "min": 0.59,
              "max": 0.639,
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
              "max": 0.359,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.36, "max": 0.439, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.44,
              "max": 0.489,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {
              "min": 0.49,
              "max": 0.549,
              "color": Colors.green,
              "label": "Ideal"
            },
            {
              "min": 0.55,
              "max": 0.599,
              "color": Colors.orange,
              "label": "High"
            },
            {
              "min": 0.60,
              "max": 0.649,
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
              "max": 0.369,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.37, "max": 0.449, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.45,
              "max": 0.499,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {
              "min": 0.50,
              "max": 0.559,
              "color": Colors.green,
              "label": "Ideal"
            },
            {
              "min": 0.56,
              "max": 0.609,
              "color": Colors.orange,
              "label": "High"
            },
            {
              "min": 0.61,
              "max": 0.659,
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
              "max": 0.379,
              "color": Colors.grey,
              "label": "Very Low"
            },
            {"min": 0.38, "max": 0.459, "color": Colors.yellow, "label": "Low"},
            {
              "min": 0.46,
              "max": 0.509,
              "color": Colors.lightGreen,
              "label": "Normal"
            },
            {
              "min": 0.51,
              "max": 0.569,
              "color": Colors.green,
              "label": "Ideal"
            },
            {
              "min": 0.57,
              "max": 0.619,
              "color": Colors.orange,
              "label": "High"
            },
            {
              "min": 0.62,
              "max": 0.669,
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
      },
    }; //Map String

    // ✅ Select Classification Ranges Based on Gender & Age
    // List<Map<String, dynamic>> selectedRanges;
    // if (classificationRanges[metric]!.containsKey(gender)) {
    //   if (classificationRanges[metric]![gender]!.containsKey(ageGroup)) {
    //     selectedRanges = classificationRanges[metric]![gender]![ageGroup]!;
    //   } else {
    //     selectedRanges = classificationRanges[metric]![gender]![
    //         "18-25"]!; // Default to lowest age range
    //   }
    // } else {
    //   if (classificationRanges[metric]!["default"]!.containsKey(ageGroup)) {
    //     selectedRanges = classificationRanges[metric]!["default"]![ageGroup]!;
    //   } else {
    //     selectedRanges = classificationRanges[metric]!["default"]![
    //         "18-25"]!; // Default fallback
    //   }
    // }

    List<Map<String, dynamic>> selectedRanges = classificationRanges[metric]
            ?[gender]?[ageGroup] ??
        classificationRanges[metric]?[gender]?["18-25"] ??
        [];

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
        color: range["color"].withOpacity(0.60),
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
              minimum: xData.length == 1
                  ? DateTime.parse(xData.first)
                      .subtract(const Duration(days: 1))
                  : null,
              maximum: xData.length == 1
                  ? DateTime.parse(xData.first).add(const Duration(days: 1))
                  : null,
              edgeLabelPlacement: EdgeLabelPlacement
                  .shift, // Prevents labels from being cut off
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
                width: 1.5,
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
                        Text(item.label, style: TextStyle(fontSize: 13)),
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

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

import 'package:syncfusion_flutter_gauges/gauges.dart';

class DiastolicBloodPressureGauge extends StatelessWidget {
  final double bp;
  final String gender;
  final int age;
  final double? width;
  final double? height;

  const DiastolicBloodPressureGauge({
    super.key,
    this.width,
    this.height,
    required this.bp,
    required this.gender,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> ranges = getBloodPressureRanges(gender, age);

    return SizedBox(
      width: width ?? 250,
      height: height ?? 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                startAngle: 180,
                endAngle: 0,
                minimum: 10,
                maximum: 200,
                showLabels: false,
                showTicks: false,
                radiusFactor: 1.0,
                axisLineStyle: const AxisLineStyle(
                  thickness: 35,
                  color: Colors.transparent,
                ),
                ranges: ranges.map((range) {
                  return _buildRange(
                    (range["min"] as num).toDouble(),
                    (range["max"] as num).toDouble(),
                    range["color"],
                  );
                }).toList(),
                pointers: <GaugePointer>[
                  NeedlePointer(
                    value: bp,
                    needleColor: Colors.black,
                    needleLength: 0.85,
                    needleStartWidth: 0.25,
                    needleEndWidth: 5,
                    knobStyle: const KnobStyle(
                      color: Colors.black,
                      borderColor: Colors.white,
                      borderWidth: 0.05,
                      knobRadius: 0.07,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 60,
            left: 10,
            right: 10,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 4,
              children: _buildLegendItems(ranges),
            ),
          ),
        ],
      ),
    );
  }

  // Create Classification Ranges
  GaugeRange _buildRange(double start, double end, Color color) {
    return GaugeRange(
      startValue: start,
      endValue: end,
      color: color,
      startWidth: 40,
      endWidth: 40,
      rangeOffset: 0,
    );
  }

  // Dynamically Built Legend Items
  List<Widget> _buildLegendItems(List<Map<String, dynamic>> ranges) {
    return ranges.map((range) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: range["color"],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1),
            ),
          ),
          const SizedBox(width: 5),
          Text(range["label"], style: const TextStyle(fontSize: 13)),
        ],
      );
    }).toList();
  }

  // Function to Fetch Heart Rate Ranges Based on Age & Gender
  List<Map<String, dynamic>> getBloodPressureRanges(String gender, int age) {
    Map<String, Map<String, List<Map<String, dynamic>>>> BloodPressureRanges = {
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
    };

    // Select the correct category based on age
    String ageCategory = getAgeCategory(age);

    // Return the corresponding heart rate ranges
    return BloodPressureRanges[gender.toLowerCase()]?[ageCategory] ?? [];
  }

  // Function to Determine Age Category
  String getAgeCategory(int age) {
    if (age >= 18 && age <= 25) return "18-25";
    if (age >= 26 && age <= 35) return "26-35";
    if (age >= 36 && age <= 45) return "36-45";
    if (age >= 46 && age <= 55) return "46-55";
    if (age >= 56 && age <= 65) return "56-65";
    return "65+";
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

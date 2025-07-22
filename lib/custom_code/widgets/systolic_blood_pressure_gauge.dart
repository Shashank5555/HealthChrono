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

class SystolicBloodPressureGauge extends StatelessWidget {
  final double bp;
  final String gender;
  final int age;
  final double? width;
  final double? height;

  const SystolicBloodPressureGauge({
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
                minimum: 20,
                maximum: 250,
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
          {"min": 0, "max": 119.999, "color": Colors.green, "label": "Normal"},
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
          {"min": 0, "max": 120.999, "color": Colors.green, "label": "Normal"},
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
          {"min": 0, "max": 122.999, "color": Colors.green, "label": "Normal"},
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
          {"min": 0, "max": 124.999, "color": Colors.green, "label": "Normal"},
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
          {"min": 0, "max": 126.999, "color": Colors.green, "label": "Normal"},
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
          {"min": 0, "max": 128.999, "color": Colors.green, "label": "Normal"},
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
          {"min": 0, "max": 118.999, "color": Colors.green, "label": "Normal"},
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
          {"min": 0, "max": 119.999, "color": Colors.green, "label": "Normal"},
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
          {"min": 0, "max": 121.999, "color": Colors.green, "label": "Normal"},
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
          {"min": 0, "max": 123.999, "color": Colors.green, "label": "Normal"},
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
          {"min": 0, "max": 125.999, "color": Colors.green, "label": "Normal"},
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
          {"min": 0, "max": 127.999, "color": Colors.green, "label": "Normal"},
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

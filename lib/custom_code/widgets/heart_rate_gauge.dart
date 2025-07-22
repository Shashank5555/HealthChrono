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

class HeartRateGauge extends StatelessWidget {
  final double heartRate;
  final String gender;
  final int age;
  final double? width;
  final double? height;

  const HeartRateGauge({
    super.key,
    this.width,
    this.height,
    required this.heartRate,
    required this.gender,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> ranges = getHeartRateRanges(gender, age);

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
                minimum: 40,
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
                    value: heartRate,
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
  List<Map<String, dynamic>> getHeartRateRanges(String gender, int age) {
    Map<String, Map<String, List<Map<String, dynamic>>>> heartRateRanges = {
      "male": {
        "18-25": [
          {"min": 0, "max": 49.999, "color": Colors.grey, "label": "Low"},
          {
            "min": 50,
            "max": 55.999,
            "color": Colors.yellow,
            "label": "Below Normal"
          },
          {"min": 56, "max": 61.999, "color": Colors.green, "label": "Healthy"},
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
          {"min": 57, "max": 62.999, "color": Colors.green, "label": "Healthy"},
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
          {"min": 58, "max": 63.999, "color": Colors.green, "label": "Healthy"},
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
          {"min": 59, "max": 64.999, "color": Colors.green, "label": "Healthy"},
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
          {"min": 60, "max": 65.999, "color": Colors.green, "label": "Healthy"},
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
          {"min": 61, "max": 66.999, "color": Colors.green, "label": "Healthy"},
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
          {"min": 61, "max": 66.999, "color": Colors.green, "label": "Healthy"},
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
          {"min": 62, "max": 67.999, "color": Colors.green, "label": "Healthy"},
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
          {"min": 63, "max": 68.999, "color": Colors.green, "label": "Healthy"},
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
          {"min": 64, "max": 69.999, "color": Colors.green, "label": "Healthy"},
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
          {"min": 65, "max": 70.999, "color": Colors.green, "label": "Healthy"},
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
          {"min": 66, "max": 71.999, "color": Colors.green, "label": "Healthy"},
          {
            "min": 72,
            "max": 85.999,
            "color": Colors.orange,
            "label": "Elevated"
          },
          {"min": 86, "max": 200, "color": Colors.red, "label": "High"},
        ],
      },
    };

    // Select the correct category based on age
    String ageCategory = getAgeCategory(age);

    // Return the corresponding heart rate ranges
    return heartRateRanges[gender.toLowerCase()]?[ageCategory] ?? [];
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

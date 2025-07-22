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

class WaistToHeightGauge extends StatelessWidget {
  final double wth;
  final String gender;
  final int age;
  final double? width;
  final double? height;

  const WaistToHeightGauge({
    super.key,
    this.width,
    this.height,
    required this.wth,
    required this.gender,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> ranges = getWTHRanges(gender, age);

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
                minimum: 0,
                maximum: 2,
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
                    value: wth,
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
  List<Map<String, dynamic>> getWTHRanges(String gender, int age) {
    Map<String, Map<String, List<Map<String, dynamic>>>> WTHRanges = {
      "male": {
        "18-25": [
          {"min": 0.0, "max": 0.349, "color": Colors.grey, "label": "Very Low"},
          {"min": 0.35, "max": 0.429, "color": Colors.yellow, "label": "Low"},
          {
            "min": 0.43,
            "max": 0.469,
            "color": Colors.lightGreen,
            "label": "Normal"
          },
          {"min": 0.47, "max": 0.529, "color": Colors.green, "label": "Ideal"},
          {"min": 0.53, "max": 0.579, "color": Colors.orange, "label": "High"},
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
          {"min": 0.0, "max": 0.359, "color": Colors.grey, "label": "Very Low"},
          {"min": 0.36, "max": 0.439, "color": Colors.yellow, "label": "Low"},
          {
            "min": 0.44,
            "max": 0.479,
            "color": Colors.lightGreen,
            "label": "Normal"
          },
          {"min": 0.48, "max": 0.539, "color": Colors.green, "label": "Ideal"},
          {"min": 0.54, "max": 0.589, "color": Colors.orange, "label": "High"},
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
          {"min": 0.0, "max": 0.369, "color": Colors.grey, "label": "Very Low"},
          {"min": 0.37, "max": 0.449, "color": Colors.yellow, "label": "Low"},
          {
            "min": 0.45,
            "max": 0.489,
            "color": Colors.lightGreen,
            "label": "Normal"
          },
          {"min": 0.49, "max": 0.549, "color": Colors.green, "label": "Ideal"},
          {"min": 0.55, "max": 0.599, "color": Colors.orange, "label": "High"},
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
          {"min": 0.0, "max": 0.379, "color": Colors.grey, "label": "Very Low"},
          {"min": 0.38, "max": 0.459, "color": Colors.yellow, "label": "Low"},
          {
            "min": 0.46,
            "max": 0.499,
            "color": Colors.lightGreen,
            "label": "Normal"
          },
          {"min": 0.50, "max": 0.559, "color": Colors.green, "label": "Ideal"},
          {"min": 0.56, "max": 0.609, "color": Colors.orange, "label": "High"},
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
          {"min": 0.0, "max": 0.389, "color": Colors.grey, "label": "Very Low"},
          {"min": 0.39, "max": 0.469, "color": Colors.yellow, "label": "Low"},
          {
            "min": 0.47,
            "max": 0.509,
            "color": Colors.lightGreen,
            "label": "Normal"
          },
          {"min": 0.51, "max": 0.569, "color": Colors.green, "label": "Ideal"},
          {"min": 0.57, "max": 0.619, "color": Colors.orange, "label": "High"},
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
          {"min": 0.0, "max": 0.399, "color": Colors.grey, "label": "Very Low"},
          {"min": 0.40, "max": 0.479, "color": Colors.yellow, "label": "Low"},
          {
            "min": 0.48,
            "max": 0.519,
            "color": Colors.lightGreen,
            "label": "Normal"
          },
          {"min": 0.52, "max": 0.579, "color": Colors.green, "label": "Ideal"},
          {"min": 0.58, "max": 0.629, "color": Colors.orange, "label": "High"},
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
          {"min": 0.0, "max": 0.329, "color": Colors.grey, "label": "Very Low"},
          {"min": 0.33, "max": 0.409, "color": Colors.yellow, "label": "Low"},
          {
            "min": 0.41,
            "max": 0.459,
            "color": Colors.lightGreen,
            "label": "Normal"
          },
          {"min": 0.46, "max": 0.519, "color": Colors.green, "label": "Ideal"},
          {"min": 0.52, "max": 0.569, "color": Colors.orange, "label": "High"},
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
          {"min": 0.0, "max": 0.319, "color": Colors.grey, "label": "Very Low"},
          {"min": 0.34, "max": 0.419, "color": Colors.yellow, "label": "Low"},
          {
            "min": 0.42,
            "max": 0.469,
            "color": Colors.lightGreen,
            "label": "Normal"
          },
          {"min": 0.47, "max": 0.529, "color": Colors.green, "label": "Ideal"},
          {"min": 0.53, "max": 0.579, "color": Colors.orange, "label": "High"},
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
          {"min": 0.0, "max": 0.349, "color": Colors.grey, "label": "Very Low"},
          {"min": 0.35, "max": 0.429, "color": Colors.yellow, "label": "Low"},
          {
            "min": 0.43,
            "max": 0.479,
            "color": Colors.lightGreen,
            "label": "Normal"
          },
          {"min": 0.48, "max": 0.539, "color": Colors.green, "label": "Ideal"},
          {"min": 0.54, "max": 0.589, "color": Colors.orange, "label": "High"},
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
          {"min": 0.0, "max": 0.359, "color": Colors.grey, "label": "Very Low"},
          {"min": 0.36, "max": 0.439, "color": Colors.yellow, "label": "Low"},
          {
            "min": 0.44,
            "max": 0.489,
            "color": Colors.lightGreen,
            "label": "Normal"
          },
          {"min": 0.49, "max": 0.549, "color": Colors.green, "label": "Ideal"},
          {"min": 0.55, "max": 0.599, "color": Colors.orange, "label": "High"},
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
          {"min": 0.0, "max": 0.369, "color": Colors.grey, "label": "Very Low"},
          {"min": 0.37, "max": 0.449, "color": Colors.yellow, "label": "Low"},
          {
            "min": 0.45,
            "max": 0.499,
            "color": Colors.lightGreen,
            "label": "Normal"
          },
          {"min": 0.50, "max": 0.559, "color": Colors.green, "label": "Ideal"},
          {"min": 0.56, "max": 0.609, "color": Colors.orange, "label": "High"},
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
          {"min": 0.0, "max": 0.379, "color": Colors.grey, "label": "Very Low"},
          {"min": 0.38, "max": 0.459, "color": Colors.yellow, "label": "Low"},
          {
            "min": 0.46,
            "max": 0.509,
            "color": Colors.lightGreen,
            "label": "Normal"
          },
          {"min": 0.51, "max": 0.569, "color": Colors.green, "label": "Ideal"},
          {"min": 0.57, "max": 0.619, "color": Colors.orange, "label": "High"},
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
    };

    // Select the correct category based on age
    String ageCategory = getAgeCategory(age);

    // Return the corresponding heart rate ranges
    return WTHRanges[gender.toLowerCase()]?[ageCategory] ?? [];
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

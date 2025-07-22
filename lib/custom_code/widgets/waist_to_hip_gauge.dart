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

class WaistToHipGauge extends StatelessWidget {
  final double wth;
  final String gender;
  final int age;
  final double? width;
  final double? height;

  const WaistToHipGauge({
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
          {"min": 0.0, "max": 0.849, "color": Colors.green, "label": "Healthy"},
          {
            "min": 0.85,
            "max": 0.899,
            "color": Colors.yellow,
            "label": "Borderline"
          },
          {"min": 0.90, "max": 2.0, "color": Colors.red, "label": "Risky"},
        ],
        "26-35": [
          {"min": 0.0, "max": 0.859, "color": Colors.green, "label": "Healthy"},
          {
            "min": 0.86,
            "max": 0.909,
            "color": Colors.yellow,
            "label": "Borderline"
          },
          {"min": 0.91, "max": 2.0, "color": Colors.red, "label": "Risky"},
        ],
        "36-45": [
          {"min": 0.0, "max": 0.879, "color": Colors.green, "label": "Healthy"},
          {
            "min": 0.88,
            "max": 0.929,
            "color": Colors.yellow,
            "label": "Borderline"
          },
          {"min": 0.93, "max": 2.0, "color": Colors.red, "label": "Risky"},
        ],
        "46-55": [
          {"min": 0.0, "max": 0.899, "color": Colors.green, "label": "Healthy"},
          {
            "min": 0.90,
            "max": 0.949,
            "color": Colors.yellow,
            "label": "Borderline"
          },
          {"min": 0.95, "max": 2.0, "color": Colors.red, "label": "Risky"},
        ],
        "56-65": [
          {"min": 0.0, "max": 0.919, "color": Colors.green, "label": "Healthy"},
          {
            "min": 0.92,
            "max": 0.969,
            "color": Colors.yellow,
            "label": "Borderline"
          },
          {"min": 0.97, "max": 2.0, "color": Colors.red, "label": "Risky"},
        ],
        "65+": [
          {"min": 0.0, "max": 0.939, "color": Colors.green, "label": "Healthy"},
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
          {"min": 0.0, "max": 0.749, "color": Colors.green, "label": "Healthy"},
          {
            "min": 0.75,
            "max": 0.819,
            "color": Colors.yellow,
            "label": "Borderline"
          },
          {"min": 0.82, "max": 2.0, "color": Colors.red, "label": "Risky"},
        ],
        "26-35": [
          {"min": 0.0, "max": 0.769, "color": Colors.green, "label": "Healthy"},
          {
            "min": 0.77,
            "max": 0.839,
            "color": Colors.yellow,
            "label": "Borderline"
          },
          {"min": 0.84, "max": 2.0, "color": Colors.red, "label": "Risky"},
        ],
        "36-45": [
          {"min": 0.0, "max": 0.789, "color": Colors.green, "label": "Healthy"},
          {
            "min": 0.79,
            "max": 0.859,
            "color": Colors.yellow,
            "label": "Borderline"
          },
          {"min": 0.86, "max": 2.0, "color": Colors.red, "label": "Risky"},
        ],
        "46-55": [
          {"min": 0.0, "max": 0.809, "color": Colors.green, "label": "Healthy"},
          {
            "min": 0.81,
            "max": 0.879,
            "color": Colors.yellow,
            "label": "Borderline"
          },
          {"min": 0.88, "max": 2.0, "color": Colors.red, "label": "Risky"},
        ],
        "56-65": [
          {"min": 0.0, "max": 0.829, "color": Colors.green, "label": "Healthy"},
          {
            "min": 0.83,
            "max": 0.899,
            "color": Colors.yellow,
            "label": "Borderline"
          },
          {"min": 0.90, "max": 2.0, "color": Colors.red, "label": "Risky"},
        ],
        "65+": [
          {"min": 0.0, "max": 0.849, "color": Colors.green, "label": "Healthy"},
          {
            "min": 0.85,
            "max": 0.919,
            "color": Colors.yellow,
            "label": "Borderline"
          },
          {"min": 0.92, "max": 2.0, "color": Colors.red, "label": "Risky"},
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

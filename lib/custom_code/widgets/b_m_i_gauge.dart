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

class BMIGauge extends StatelessWidget {
  final double bmi;
  final String gender;
  final int age;
  final double? width;
  final double? height;

  const BMIGauge({
    super.key,
    this.width,
    this.height,
    required this.bmi,
    required this.gender,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> ranges = getBMIRanges(gender, age);

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
                maximum: 205,
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
                    value: bmi,
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
  List<Map<String, dynamic>> getBMIRanges(String gender, int age) {
    Map<String, Map<String, List<Map<String, dynamic>>>> BMIRanges = {
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
    };

    // Select the correct category based on age
    String ageCategory = getAgeCategory(age);

    // Return the corresponding heart rate ranges
    return BMIRanges[gender.toLowerCase()]?[ageCategory] ?? [];
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

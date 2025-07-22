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
  });

  final double? width;
  final double? height;
  final List<String> xData;
  final List<double> yData;
  final String metric;

  @override
  Widget build(BuildContext context) {
    if (xData.length != yData.length) {
      return const Center(
        child: Text("Error: xData and yData lengths do not match!",
            style: TextStyle(color: Colors.red)),
      );
    }

    // ✅ Define Classification Ranges (All 6 Metrics)
    Map<String, List<Map<String, dynamic>>> classificationRanges = {
      "waist_to_hip_ratio": [
        {"min": 0.0, "max": 0.9, "color": Colors.green, "label": "Healthy"},
        {"min": 0.9, "max": 1.0, "color": Colors.yellow, "label": "Borderline"},
        {"min": 1.0, "max": 2.0, "color": Colors.red, "label": "Risky"},
      ],
      "waist_to_height_ratio": [
        {"min": 0.0, "max": 0.35, "color": Colors.grey, "label": "Very Low"},
        {"min": 0.35, "max": 0.42, "color": Colors.yellow, "label": "Low"},
        {
          "min": 0.42,
          "max": 0.46,
          "color": Colors.lightGreen,
          "label": "Normal"
        },
        {"min": 0.46, "max": 0.5, "color": Colors.green, "label": "Ideal"},
        {"min": 0.5, "max": 0.54, "color": Colors.orange, "label": "High"},
        {
          "min": 0.54,
          "max": 0.58,
          "color": Color(0xFFF08080),
          "label": "Very High"
        },
        {
          "min": 0.58,
          "max": 2.0,
          "color": Colors.red,
          "label": "Extremely High"
        },
      ],
      "bmi": [
        {"min": 0.0, "max": 18.5, "color": Colors.grey, "label": "Underweight"},
        {"min": 18.5, "max": 24.9, "color": Colors.green, "label": "Healthy"},
        {
          "min": 25.0,
          "max": 29.9,
          "color": Colors.lightGreen,
          "label": "Overweight"
        },
        {"min": 30.0, "max": 34.9, "color": Colors.orange, "label": "Obese"},
        {
          "min": 35.0,
          "max": 39.9,
          "color": Color(0xFFF08080),
          "label": "Severe Obesity"
        },
        {
          "min": 40.0,
          "max": 99999.0,
          "color": Colors.red,
          "label": "Extreme Obesity"
        },
      ],
      "systolic_bp": [
        {"min": 0, "max": 120, "color": Colors.green, "label": "Normal"},
        {"min": 120, "max": 130, "color": Colors.yellow, "label": "Elevated"},
        {
          "min": 130,
          "max": 140,
          "color": Colors.orange,
          "label": "High BP (Stage 1)"
        },
        {
          "min": 140,
          "max": 180,
          "color": Color(0xFFF08080),
          "label": "High BP (Stage 2)"
        },
        {
          "min": 180,
          "max": 200,
          "color": Colors.red,
          "label": "Hypertensive Crisis"
        },
      ],
      "diastolic_bp": [
        {"min": 0, "max": 80, "color": Colors.green, "label": "Normal"},
        {"min": 80, "max": 90, "color": Colors.yellow, "label": "Elevated"},
        {
          "min": 90,
          "max": 120,
          "color": Colors.orange,
          "label": "High BP (Stage 1)"
        },
        {
          "min": 120,
          "max": 140,
          "color": Color(0xFFF08080),
          "label": "High BP (Stage 2)"
        },
        {"min": 140, "max": 200, "color": Colors.red, "label": "Critical"},
      ],
      "heart_rate": [
        {"min": 0, "max": 60, "color": Colors.grey, "label": "Low"},
        {"min": 60, "max": 80, "color": Colors.green, "label": "Normal"},
        {"min": 80, "max": 100, "color": Colors.yellow, "label": "Elevated"},
        {"min": 100, "max": 150, "color": Colors.orange, "label": "High"},
        {
          "min": 150,
          "max": 200,
          "color": Colors.red,
          "label": "Dangerously High"
        },
      ],
    };

    final TooltipBehavior tooltipBehavior = TooltipBehavior(
      enable: true,
      header: 'Details',
      format: 'Date: point.x\nValue: point.y', // ✅ Show Date & Value
      canShowMarker: true,
      activationMode: ActivationMode.singleTap, // ✅ Show tooltip on tap
    );

    // ✅ Assign Colors to Data Points
    final List<ChartData> chartData = List.generate(xData.length, (index) {
      DateTime date = DateTime.parse(xData[index]);
      double value = yData[index];

      // Assign colors based on metric classification
      Color pointColor = Colors.grey;
      List<Map<String, dynamic>> ranges = classificationRanges[metric] ?? [];
      for (var range in ranges) {
        if (value >= range["min"] && value < range["max"]) {
          pointColor = range["color"];
          break;
        }
      }

      return ChartData(date, value, pointColor);
    });

    // ✅ Generate Background Bands
    List<PlotBand> plotBands = classificationRanges[metric]!.map((range) {
      return PlotBand(
        start: range["min"],
        end: range["max"],
        color: range["color"].withOpacity(0.75), // ✅ Light background colors
        borderWidth: 0,
      );
    }).toList();

    return Column(
      children: [
        // ✅ Chart Widget
        Expanded(
          child: SfCartesianChart(
            tooltipBehavior: tooltipBehavior,
            primaryXAxis: DateTimeAxis(
              dateFormat: DateFormat.MMMd(),
              intervalType: DateTimeIntervalType.days,
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
                color: Colors.blueAccent,
                width: 2.0,
                splineType: SplineType.natural,
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
                  borderColor: Colors.grey,
                  width: 9, // ✅ Smaller Size
                  height: 9,
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
            children: classificationRanges[metric]!
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

// ✅ Fix: Add the missing ChartData class
class ChartData {
  final DateTime x;
  final double y;
  final Color color;

  ChartData(this.x, this.y, this.color);
}

// ✅ Helper Class for Custom Legend
class LegendItem {
  final String label;
  final Color color;

  LegendItem(this.label, this.color);
}

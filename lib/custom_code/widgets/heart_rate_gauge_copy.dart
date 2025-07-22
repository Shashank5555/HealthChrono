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
  final double? width;
  final double? height;

  const HeartRateGauge({
    super.key,
    this.width,
    this.height,
    required this.heartRate,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: width ?? constraints.maxWidth,
          height: height ?? 220,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // ✅ Radial Gauge (No Labels Inside)
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 0,
                    minimum: 40,
                    maximum: 200,
                    showLabels: false,
                    showTicks: false,
                    radiusFactor: 1.0, // 🔧 Adjusted to fit properly
                    axisLineStyle: const AxisLineStyle(
                      thickness: 35,
                      color: Colors.transparent,
                    ),
                    ranges: <GaugeRange>[
                      _buildRange(40, 60, Colors.green.shade700),
                      _buildRange(60, 80, Colors.lightGreen.shade500),
                      _buildRange(80, 100, Colors.yellow.shade400),
                      _buildRange(100, 120, Colors.amber.shade500),
                      _buildRange(120, 140, Colors.red.shade600),
                      _buildRange(140, 200, Colors.red.shade900),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: heartRate,
                        needleColor: Colors.black,
                        needleLength: 0.65, // 🔧 Adjusted to fit inside better
                        needleStartWidth: 0.5,
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

              // ✅ Legend (Now Fully Responsive)
              Positioned(
                bottom: 60, // 🔧 Adjusted for better spacing
                left: 10,
                right: 10,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 4,
                      children: _buildLegendItems(),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ✅ Creates Classification Ranges
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

  // ✅ Dynamically Built Legend Items
  List<Widget> _buildLegendItems() {
    List<Map<String, dynamic>> ranges = [
      {"label": "Excellent", "color": Colors.green.shade700},
      {"label": "Good", "color": Colors.lightGreen.shade500},
      {"label": "Above Avg", "color": Colors.yellow.shade400},
      {"label": "Average", "color": Colors.amber.shade500},
      {"label": "Below Avg", "color": Colors.red.shade600},
      {"label": "Poor", "color": Colors.red.shade900},
    ];

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
}

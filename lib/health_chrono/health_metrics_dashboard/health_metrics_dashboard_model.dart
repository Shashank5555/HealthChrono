import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/index.dart';
import 'dart:async';
import 'health_metrics_dashboard_widget.dart' show HealthMetricsDashboardWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HealthMetricsDashboardModel
    extends FlutterFlowModel<HealthMetricsDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // Model for NoDataAvailable component.
  late NoDataAvailableModel noDataAvailableModel;

  @override
  void initState(BuildContext context) {
    noDataAvailableModel = createModel(context, () => NoDataAvailableModel());
  }

  @override
  void dispose() {
    noDataAvailableModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

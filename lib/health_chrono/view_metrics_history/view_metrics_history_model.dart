import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/index.dart';
import 'dart:async';
import 'view_metrics_history_widget.dart' show ViewMetricsHistoryWidget;
import 'package:flutter/material.dart';

class ViewMetricsHistoryModel
    extends FlutterFlowModel<ViewMetricsHistoryWidget> {
  ///  Local state fields for this page.

  bool showNoDataAvailable = false;

  bool draggedDown = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (list_metrics_metrics__get)] action in ViewMetricsHistory widget.
  ApiCallResponse? metricDetailsByDate;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (list_metrics_metrics__get)] action in Calendar widget.
  ApiCallResponse? metricsDetailsbyDateResponse;
  // Stores action output result for [Backend Call - API (delete_metric_metrics__metric_id__delete)] action in IconButton widget.
  ApiCallResponse? deleteMetricsResponse;
  // Model for NoDataAvailable component.
  late NoDataAvailableModel noDataAvailableModel;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
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

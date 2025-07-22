import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import 'dart:async';
import 'health_metrics_graphs_choice_chips_widget.dart'
    show HealthMetricsGraphsChoiceChipsWidget;
import 'package:flutter/material.dart';

class HealthMetricsGraphsChoiceChipsModel
    extends FlutterFlowModel<HealthMetricsGraphsChoiceChipsWidget> {
  ///  Local state fields for this page.

  String? startDate = '';

  String? endDate = '';

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked1;
  DateTime? datePicked2;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
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

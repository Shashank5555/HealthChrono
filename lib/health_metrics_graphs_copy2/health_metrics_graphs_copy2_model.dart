import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/index.dart';
import 'dart:async';
import 'health_metrics_graphs_copy2_widget.dart'
    show HealthMetricsGraphsCopy2Widget;
import 'package:flutter/material.dart';

class HealthMetricsGraphsCopy2Model
    extends FlutterFlowModel<HealthMetricsGraphsCopy2Widget> {
  ///  Local state fields for this page.

  String? startDate = '';

  String? endDate = '';

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked1;
  DateTime? datePicked2;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  Completer<ApiCallResponse>? apiRequestCompleter3;
  // Stores action output result for [Backend Call - API (Generate PDF Report)] action in Button widget.
  ApiCallResponse? generateReport;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for NoDataAvailable component.
  late NoDataAvailableModel noDataAvailableModel1;
  // Model for NoDataAvailable component.
  late NoDataAvailableModel noDataAvailableModel2;
  // Model for NoDataAvailable component.
  late NoDataAvailableModel noDataAvailableModel3;

  @override
  void initState(BuildContext context) {
    noDataAvailableModel1 = createModel(context, () => NoDataAvailableModel());
    noDataAvailableModel2 = createModel(context, () => NoDataAvailableModel());
    noDataAvailableModel3 = createModel(context, () => NoDataAvailableModel());
  }

  @override
  void dispose() {
    noDataAvailableModel1.dispose();
    noDataAvailableModel2.dispose();
    noDataAvailableModel3.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/index.dart';
import 'dart:async';
import 'health_metrics_graphs_widget.dart' show HealthMetricsGraphsWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HealthMetricsGraphsModel
    extends FlutterFlowModel<HealthMetricsGraphsWidget> {
  ///  Local state fields for this page.

  String? startDate = '';

  String? endDate = '';

  bool isGenerateClicked = false;

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked1;
  DateTime? datePicked2;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (generate_pdf_report_pdf_generate_pdf_report_get)] action in Button widget.
  ApiCallResponse? generateReport;
  // Stores action output result for [Backend Call - API (generate_pdf_report_pdf_generate_pdf_report_get)] action in Button widget.
  ApiCallResponse? generateReportWeb;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
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

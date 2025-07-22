import '/flutter_flow/flutter_flow_util.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/index.dart';
import 'view_metrics_widget.dart' show ViewMetricsWidget;
import 'package:flutter/material.dart';

class ViewMetricsModel extends FlutterFlowModel<ViewMetricsWidget> {
  ///  State fields for stateful widgets in this page.

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
}

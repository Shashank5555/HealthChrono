import '/flutter_flow/flutter_flow_util.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/index.dart';
import 'client_details_at_practitioner_side_widget.dart'
    show ClientDetailsAtPractitionerSideWidget;
import 'package:flutter/material.dart';

class ClientDetailsAtPractitionerSideModel
    extends FlutterFlowModel<ClientDetailsAtPractitionerSideWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NoDataAvailable component.
  late NoDataAvailableModel noDataAvailableModel1;
  // Model for NoDataAvailable component.
  late NoDataAvailableModel noDataAvailableModel2;

  @override
  void initState(BuildContext context) {
    noDataAvailableModel1 = createModel(context, () => NoDataAvailableModel());
    noDataAvailableModel2 = createModel(context, () => NoDataAvailableModel());
  }

  @override
  void dispose() {
    noDataAvailableModel1.dispose();
    noDataAvailableModel2.dispose();
  }
}

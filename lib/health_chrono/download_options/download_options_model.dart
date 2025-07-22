import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'download_options_widget.dart' show DownloadOptionsWidget;
import 'package:flutter/material.dart';

class DownloadOptionsModel extends FlutterFlowModel<DownloadOptionsWidget> {
  ///  Local state fields for this component.

  bool showSuccessMsg = false;

  bool showErrorMsg = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (export_metrics_report_metrics_export_post)] action in reportToEmail widget.
  ApiCallResponse? sendEmailtoYourselfClient;
  // Stores action output result for [Backend Call - API (export_metrics_report_metrics_export_post)] action in Button_send widget.
  ApiCallResponse? sendEmailToPractitionerFromClient;
  // Stores action output result for [Backend Call - API (export_metrics_report_metrics_export_post)] action in Button widget.
  ApiCallResponse? downloadClientAPIResponse;
  // Stores action output result for [Backend Call - API (export_metrics_report_metrics_export_post)] action in Button widget.
  ApiCallResponse? downloadClientAPIWebResponse;
  // Stores action output result for [Backend Call - API (export_metrics_report_metrics_export_post)] action in reportToClientEmail widget.
  ApiCallResponse? sendToClientFromPractitioner;
  // Stores action output result for [Backend Call - API (export_metrics_report_metrics_export_post)] action in reportToEmailPractitioner widget.
  ApiCallResponse? sendToYourselfPractitioner;
  // Stores action output result for [Backend Call - API (export_metrics_report_metrics_export_post)] action in Button widget.
  ApiCallResponse? downloadPractitionerAPIResponse;
  // Stores action output result for [Backend Call - API (export_metrics_report_metrics_export_post)] action in Button widget.
  ApiCallResponse? downloadPractitionerAPIWebResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

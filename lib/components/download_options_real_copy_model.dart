import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'download_options_real_copy_widget.dart'
    show DownloadOptionsRealCopyWidget;
import 'package:flutter/material.dart';

class DownloadOptionsRealCopyModel
    extends FlutterFlowModel<DownloadOptionsRealCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Export Metrics)] action in reportToEmail widget.
  ApiCallResponse? sendEmailtoYourselfClient;
  // State field(s) for reportToPractitionerEmail widget.
  bool? reportToPractitionerEmailValue;
  // State field(s) for email_DO widget.
  FocusNode? emailDOFocusNode;
  TextEditingController? emailDOTextController;
  String? Function(BuildContext, String?)? emailDOTextControllerValidator;
  // Stores action output result for [Backend Call - API (Export Metrics)] action in Button_send widget.
  ApiCallResponse? sendEmailToPractitionerFromClient;
  // Stores action output result for [Backend Call - API (List Metircs)] action in Button widget.
  ApiCallResponse? downloadClientAPIResponse;
  // Stores action output result for [Backend Call - API (Export Metrics)] action in reportToClientEmail widget.
  ApiCallResponse? sendToClientFromPractitioner;
  // Stores action output result for [Backend Call - API (Export Metrics)] action in reportToEmailPractitioner widget.
  ApiCallResponse? sendToYourselfPractitioner;
  // Stores action output result for [Backend Call - API (List Metircs)] action in Button widget.
  ApiCallResponse? downloadPractitionerAPIResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailDOFocusNode?.dispose();
    emailDOTextController?.dispose();
  }
}

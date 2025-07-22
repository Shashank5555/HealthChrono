import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'download_options_copy_widget.dart' show DownloadOptionsCopyWidget;
import 'package:flutter/material.dart';

class DownloadOptionsCopyModel
    extends FlutterFlowModel<DownloadOptionsCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for reportToEmail widget.
  bool? reportToEmailValue;
  // Stores action output result for [Backend Call - API (Export Metrics)] action in reportToEmail widget.
  ApiCallResponse? apiResultlm8;
  // State field(s) for reportToPractitionerEmail widget.
  bool? reportToPractitionerEmailValue;
  // State field(s) for email_DO widget.
  FocusNode? emailDOFocusNode;
  TextEditingController? emailDOTextController;
  String? Function(BuildContext, String?)? emailDOTextControllerValidator;
  // Stores action output result for [Backend Call - API (Export Metrics)] action in Button_send widget.
  ApiCallResponse? apiResultsop;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for reportToClientEmail widget.
  bool? reportToClientEmailValue;
  // Stores action output result for [Backend Call - API (Export Metrics)] action in reportToClientEmail widget.
  ApiCallResponse? apiResult4vu;
  // State field(s) for reportToEmailPractitioner widget.
  bool? reportToEmailPractitionerValue;
  // Stores action output result for [Backend Call - API (Export Metrics)] action in reportToEmailPractitioner widget.
  ApiCallResponse? apiResultyes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailDOFocusNode?.dispose();
    emailDOTextController?.dispose();
  }
}

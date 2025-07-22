import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_cilent_details_widget.dart' show SearchCilentDetailsWidget;
import 'package:flutter/material.dart';

class SearchCilentDetailsModel
    extends FlutterFlowModel<SearchCilentDetailsWidget> {
  ///  Local state fields for this component.

  bool showSuccessMsg = false;

  bool showErrorMsg = false;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for email_PD widget.
  FocusNode? emailPDFocusNode;
  TextEditingController? emailPDTextController;
  String? Function(BuildContext, String?)? emailPDTextControllerValidator;
  String? _emailPDTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '81aa3rjq' /* Email Address is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'aimzzfq3' /* Enter a valid email address... */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (Search linked clients for practitioner)] action in EmailSearch_PD widget.
  ApiCallResponse? apiResultos7;
  // State field(s) for phone_PD widget.
  FocusNode? phonePDFocusNode;
  TextEditingController? phonePDTextController;
  String? Function(BuildContext, String?)? phonePDTextControllerValidator;
  String? _phonePDTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '72k4i9uj' /* Field is required... */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Search linked clients for practitioner)] action in PhoneSearch_PD widget.
  ApiCallResponse? apiResultos8;

  @override
  void initState(BuildContext context) {
    emailPDTextControllerValidator = _emailPDTextControllerValidator;
    phonePDTextControllerValidator = _phonePDTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailPDFocusNode?.dispose();
    emailPDTextController?.dispose();

    phonePDFocusNode?.dispose();
    phonePDTextController?.dispose();
  }
}

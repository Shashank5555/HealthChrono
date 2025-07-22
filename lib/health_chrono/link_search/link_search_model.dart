import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'link_search_widget.dart' show LinkSearchWidget;
import 'package:flutter/material.dart';

class LinkSearchModel extends FlutterFlowModel<LinkSearchWidget> {
  ///  Local state fields for this component.

  bool showSuccessMsg = false;

  bool showErrorMsg = false;

  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for email_LS widget.
  FocusNode? emailLSFocusNode;
  TextEditingController? emailLSTextController;
  String? Function(BuildContext, String?)? emailLSTextControllerValidator;
  String? _emailLSTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9dz86vgo' /* Email Address is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'f7tejv7m' /* Enter a valid email address... */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (request_link_links_request_post)] action in EmailSearch_LS widget.
  ApiCallResponse? apiResultos7;
  // State field(s) for phone_LS widget.
  FocusNode? phoneLSFocusNode;
  TextEditingController? phoneLSTextController;
  String? Function(BuildContext, String?)? phoneLSTextControllerValidator;
  String? _phoneLSTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9vlvr5w5' /* Field is required... */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (request_link_links_request_post)] action in PhoneSearch_LS widget.
  ApiCallResponse? apiResultos8;

  @override
  void initState(BuildContext context) {
    emailLSTextControllerValidator = _emailLSTextControllerValidator;
    phoneLSTextControllerValidator = _phoneLSTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailLSFocusNode?.dispose();
    emailLSTextController?.dispose();

    phoneLSFocusNode?.dispose();
    phoneLSTextController?.dispose();
  }
}

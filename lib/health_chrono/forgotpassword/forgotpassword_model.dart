import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgotpassword_widget.dart' show ForgotpasswordWidget;
import 'package:flutter/material.dart';

class ForgotpasswordModel extends FlutterFlowModel<ForgotpasswordWidget> {
  ///  Local state fields for this page.

  bool isEmailSelected = false;

  bool isPhoneSelected = false;

  String? email = '';

  String? method = '';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email_FP widget.
  FocusNode? emailFPFocusNode;
  TextEditingController? emailFPTextController;
  String? Function(BuildContext, String?)? emailFPTextControllerValidator;
  String? _emailFPTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'n2g7wnfa' /* Field is required... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '75iu604s' /* Enter a valid email address... */,
      );
    }
    return null;
  }

  // State field(s) for phone_FP widget.
  FocusNode? phoneFPFocusNode;
  TextEditingController? phoneFPTextController;
  String? Function(BuildContext, String?)? phoneFPTextControllerValidator;
  // Stores action output result for [Backend Call - API (password_reset_request_password_reset_request_post)] action in Button_emailFP widget.
  ApiCallResponse? aPIForgotPasswordEmail;
  // Stores action output result for [Backend Call - API (password_reset_request_password_reset_request_post)] action in Button_contactFP widget.
  ApiCallResponse? aPIForgotPasswordPhone;

  @override
  void initState(BuildContext context) {
    emailFPTextControllerValidator = _emailFPTextControllerValidator;
  }

  @override
  void dispose() {
    emailFPFocusNode?.dispose();
    emailFPTextController?.dispose();

    phoneFPFocusNode?.dispose();
    phoneFPTextController?.dispose();
  }
}

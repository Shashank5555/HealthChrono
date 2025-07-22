import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'deactivate_widget.dart' show DeactivateWidget;
import 'package:flutter/material.dart';

class DeactivateModel extends FlutterFlowModel<DeactivateWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for full_name widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6f94sqgk' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for email_OTP widget.
  FocusNode? emailOTPFocusNode;
  TextEditingController? emailOTPTextController;
  String? Function(BuildContext, String?)? emailOTPTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g8f2j4my' /* Field is required */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*(),.?:{}|<>])[A-Za-z\\d!@#\$%^&*(),.?:{}|<>]{1,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'e01f5knv' /* Password should contain:
- At ... */
        ,
      );
    }
    return null;
  }

  // State field(s) for phone_OTP widget.
  FocusNode? phoneOTPFocusNode;
  TextEditingController? phoneOTPTextController;
  String? Function(BuildContext, String?)? phoneOTPTextControllerValidator;
  String? _phoneOTPTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vlfg7ndi' /* Field is required */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*(),.?:{}|<>])[A-Za-z\\d!@#\$%^&*(),.?:{}|<>]{1,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'xgayslvk' /* Password should contain:
- At ... */
        ,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (deactivate_confirm_me_deactivate_confirm_post)] action in Button widget.
  ApiCallResponse? deactivateAccountResponse;

  @override
  void initState(BuildContext context) {
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
    phoneOTPTextControllerValidator = _phoneOTPTextControllerValidator;
  }

  @override
  void dispose() {
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    emailOTPFocusNode?.dispose();
    emailOTPTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    phoneOTPFocusNode?.dispose();
    phoneOTPTextController?.dispose();
  }
}

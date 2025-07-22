import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reset_password_widget.dart' show ResetPasswordWidget;
import 'package:flutter/material.dart';

class ResetPasswordModel extends FlutterFlowModel<ResetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for resetOTP_CP widget.
  FocusNode? resetOTPCPFocusNode;
  TextEditingController? resetOTPCPTextController;
  String? Function(BuildContext, String?)? resetOTPCPTextControllerValidator;
  String? _resetOTPCPTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qdjawcsz' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for newPassword_CP widget.
  FocusNode? newPasswordCPFocusNode;
  TextEditingController? newPasswordCPTextController;
  late bool newPasswordCPVisibility;
  String? Function(BuildContext, String?)? newPasswordCPTextControllerValidator;
  String? _newPasswordCPTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'w841ph8e' /* Field is required */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*(),.?:{}|<>])[A-Za-z\\d!@#\$%^&*(),.?:{}|<>]{1,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'yillaf0m' /* Password should contain:
- At ... */
        ,
      );
    }
    return null;
  }

  // State field(s) for confirmNewPassword_CP widget.
  FocusNode? confirmNewPasswordCPFocusNode;
  TextEditingController? confirmNewPasswordCPTextController;
  late bool confirmNewPasswordCPVisibility;
  String? Function(BuildContext, String?)?
      confirmNewPasswordCPTextControllerValidator;
  String? _confirmNewPasswordCPTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'y80jpqdv' /* Field is required */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*(),.?:{}|<>])[A-Za-z\\d!@#\$%^&*(),.?:{}|<>]{1,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'kfldn6ec' /* Password should contain:
- At ... */
        ,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (password_reset_confirm_password_reset_confirm_post)] action in Button_email widget.
  ApiCallResponse? resetAuthEmail;
  // Stores action output result for [Backend Call - API (password_reset_confirm_password_reset_confirm_post)] action in Button_phone widget.
  ApiCallResponse? resetAuthPhone;

  @override
  void initState(BuildContext context) {
    resetOTPCPTextControllerValidator = _resetOTPCPTextControllerValidator;
    newPasswordCPVisibility = false;
    newPasswordCPTextControllerValidator =
        _newPasswordCPTextControllerValidator;
    confirmNewPasswordCPVisibility = false;
    confirmNewPasswordCPTextControllerValidator =
        _confirmNewPasswordCPTextControllerValidator;
  }

  @override
  void dispose() {
    resetOTPCPFocusNode?.dispose();
    resetOTPCPTextController?.dispose();

    newPasswordCPFocusNode?.dispose();
    newPasswordCPTextController?.dispose();

    confirmNewPasswordCPFocusNode?.dispose();
    confirmNewPasswordCPTextController?.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_admin_widget.dart' show LoginAdminWidget;
import 'package:flutter/material.dart';

class LoginAdminModel extends FlutterFlowModel<LoginAdminWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email_clientLogin widget.
  FocusNode? emailClientLoginFocusNode;
  TextEditingController? emailClientLoginTextController;
  String? Function(BuildContext, String?)?
      emailClientLoginTextControllerValidator;
  String? _emailClientLoginTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'b3re7u9q' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ie8xv9bt' /* Enter a valid email address */,
      );
    }
    return null;
  }

  // State field(s) for password_clientLogin widget.
  FocusNode? passwordClientLoginFocusNode;
  TextEditingController? passwordClientLoginTextController;
  late bool passwordClientLoginVisibility;
  String? Function(BuildContext, String?)?
      passwordClientLoginTextControllerValidator;
  String? _passwordClientLoginTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qjvl83pg' /* Field is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'd90kwdkt' /* Minimum 8 characters required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailClientLoginTextControllerValidator =
        _emailClientLoginTextControllerValidator;
    passwordClientLoginVisibility = false;
    passwordClientLoginTextControllerValidator =
        _passwordClientLoginTextControllerValidator;
  }

  @override
  void dispose() {
    emailClientLoginFocusNode?.dispose();
    emailClientLoginTextController?.dispose();

    passwordClientLoginFocusNode?.dispose();
    passwordClientLoginTextController?.dispose();
  }
}

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for email_clientLogin widget.
  FocusNode? emailClientLoginFocusNode;
  TextEditingController? emailClientLoginTextController;
  String? Function(BuildContext, String?)?
      emailClientLoginTextControllerValidator;
  String? _emailClientLoginTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7aqhfx10' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '2uqpq1wf' /* Enter a valid email address */,
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
        'kyx6jxqp' /* Field is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'pql5sdzi' /* Minimum 8 characters required */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*(),.?:{}|<>])[A-Za-z\\d!@#\$%^&*(),.?:{}|<>]{1,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'i7xh7lkm' /* Password should contain:
- At ... */
        ,
      );
    }
    return null;
  }

  // State field(s) for Checkbox_client widget.
  bool? checkboxClientValue;
  // Stores action output result for [Backend Call - API (login_auth_login_post)] action in Button_client widget.
  ApiCallResponse? loginAPIClient;
  // State field(s) for email_practitionerLogin widget.
  FocusNode? emailPractitionerLoginFocusNode;
  TextEditingController? emailPractitionerLoginTextController;
  String? Function(BuildContext, String?)?
      emailPractitionerLoginTextControllerValidator;
  String? _emailPractitionerLoginTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ymw5dup3' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'kuiqf0ee' /* Enter a valid email address */,
      );
    }
    return null;
  }

  // State field(s) for password_practitionerLogin widget.
  FocusNode? passwordPractitionerLoginFocusNode;
  TextEditingController? passwordPractitionerLoginTextController;
  late bool passwordPractitionerLoginVisibility;
  String? Function(BuildContext, String?)?
      passwordPractitionerLoginTextControllerValidator;
  String? _passwordPractitionerLoginTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dxrl83g7' /* Field is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'qxr8dzyc' /* Minimum 8 characters required */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*(),.?:{}|<>])[A-Za-z\\d!@#\$%^&*(),.?:{}|<>]{1,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'u4267skp' /* Password should contain:
- At ... */
        ,
      );
    }
    return null;
  }

  // State field(s) for Checkbox_practitioner widget.
  bool? checkboxPractitionerValue;
  // Stores action output result for [Backend Call - API (login_auth_login_post)] action in Button_practitioner widget.
  ApiCallResponse? loginAPIPractitioner;

  @override
  void initState(BuildContext context) {
    emailClientLoginTextControllerValidator =
        _emailClientLoginTextControllerValidator;
    passwordClientLoginVisibility = false;
    passwordClientLoginTextControllerValidator =
        _passwordClientLoginTextControllerValidator;
    emailPractitionerLoginTextControllerValidator =
        _emailPractitionerLoginTextControllerValidator;
    passwordPractitionerLoginVisibility = false;
    passwordPractitionerLoginTextControllerValidator =
        _passwordPractitionerLoginTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailClientLoginFocusNode?.dispose();
    emailClientLoginTextController?.dispose();

    passwordClientLoginFocusNode?.dispose();
    passwordClientLoginTextController?.dispose();

    emailPractitionerLoginFocusNode?.dispose();
    emailPractitionerLoginTextController?.dispose();

    passwordPractitionerLoginFocusNode?.dispose();
    passwordPractitionerLoginTextController?.dispose();
  }
}

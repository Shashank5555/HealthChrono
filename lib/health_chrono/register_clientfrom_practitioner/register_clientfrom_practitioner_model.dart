import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'register_clientfrom_practitioner_widget.dart'
    show RegisterClientfromPractitionerWidget;
import 'package:flutter/material.dart';

class RegisterClientfromPractitionerModel
    extends FlutterFlowModel<RegisterClientfromPractitionerWidget> {
  ///  Local state fields for this page.

  bool showGenderTextError = false;

  bool showDOBTextError = false;

  bool showTimeZoneTextError = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fname_RCFP widget.
  FocusNode? fnameRCFPFocusNode;
  TextEditingController? fnameRCFPTextController;
  String? Function(BuildContext, String?)? fnameRCFPTextControllerValidator;
  String? _fnameRCFPTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jzswho3r' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for lname_RCFP widget.
  FocusNode? lnameRCFPFocusNode;
  TextEditingController? lnameRCFPTextController;
  String? Function(BuildContext, String?)? lnameRCFPTextControllerValidator;
  String? _lnameRCFPTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'y2sxs61j' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for gender_RCFP widget.
  String? genderRCFPValue;
  FormFieldController<String>? genderRCFPValueController;
  DateTime? datePicked;
  // State field(s) for timezone_practitionerRCFP widget.
  String? timezonePractitionerRCFPValue;
  FormFieldController<String>? timezonePractitionerRCFPValueController;
  // State field(s) for contact_RCFP widget.
  FocusNode? contactRCFPFocusNode;
  TextEditingController? contactRCFPTextController;
  String? Function(BuildContext, String?)? contactRCFPTextControllerValidator;
  String? _contactRCFPTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jliw8yrh' /* Field is required... */,
      );
    }

    return null;
  }

  // State field(s) for Email_RCFP widget.
  FocusNode? emailRCFPFocusNode;
  TextEditingController? emailRCFPTextController;
  String? Function(BuildContext, String?)? emailRCFPTextControllerValidator;
  String? _emailRCFPTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zhdgs8x6' /* Field is required... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'yq2dx774' /* Enter a valid email address... */,
      );
    }
    return null;
  }

  // State field(s) for password_RCFP widget.
  FocusNode? passwordRCFPFocusNode;
  TextEditingController? passwordRCFPTextController;
  late bool passwordRCFPVisibility;
  String? Function(BuildContext, String?)? passwordRCFPTextControllerValidator;
  String? _passwordRCFPTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6a9500z2' /* Field is required... */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*(),.?:{}|<>])[A-Za-z\\d!@#\$%^&*(),.?:{}|<>]{1,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'dj6ckizy' /* Password should contain:
- At ... */
        ,
      );
    }
    return null;
  }

  // State field(s) for confirmPassword_RCFP widget.
  FocusNode? confirmPasswordRCFPFocusNode;
  TextEditingController? confirmPasswordRCFPTextController;
  late bool confirmPasswordRCFPVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordRCFPTextControllerValidator;
  String? _confirmPasswordRCFPTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9w92gips' /* Field is required... */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*(),.?:{}|<>])[A-Za-z\\d!@#\$%^&*(),.?:{}|<>]{1,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ngqcwzfo' /* Password should contain:
- At ... */
        ,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (register_client_by_practitioner_practitioners_practitioner_clients_post)] action in Button_RCFP widget.
  ApiCallResponse? registerUserRCFP;

  @override
  void initState(BuildContext context) {
    fnameRCFPTextControllerValidator = _fnameRCFPTextControllerValidator;
    lnameRCFPTextControllerValidator = _lnameRCFPTextControllerValidator;
    contactRCFPTextControllerValidator = _contactRCFPTextControllerValidator;
    emailRCFPTextControllerValidator = _emailRCFPTextControllerValidator;
    passwordRCFPVisibility = false;
    passwordRCFPTextControllerValidator = _passwordRCFPTextControllerValidator;
    confirmPasswordRCFPVisibility = false;
    confirmPasswordRCFPTextControllerValidator =
        _confirmPasswordRCFPTextControllerValidator;
  }

  @override
  void dispose() {
    fnameRCFPFocusNode?.dispose();
    fnameRCFPTextController?.dispose();

    lnameRCFPFocusNode?.dispose();
    lnameRCFPTextController?.dispose();

    contactRCFPFocusNode?.dispose();
    contactRCFPTextController?.dispose();

    emailRCFPFocusNode?.dispose();
    emailRCFPTextController?.dispose();

    passwordRCFPFocusNode?.dispose();
    passwordRCFPTextController?.dispose();

    confirmPasswordRCFPFocusNode?.dispose();
    confirmPasswordRCFPTextController?.dispose();
  }
}

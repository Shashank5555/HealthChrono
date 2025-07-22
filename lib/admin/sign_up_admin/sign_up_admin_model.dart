import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sign_up_admin_widget.dart' show SignUpAdminWidget;
import 'package:flutter/material.dart';

class SignUpAdminModel extends FlutterFlowModel<SignUpAdminWidget> {
  ///  Local state fields for this page.

  String? passwordCA;

  String? confirmPasswordCA;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fname_adminCA widget.
  FocusNode? fnameAdminCAFocusNode;
  TextEditingController? fnameAdminCATextController;
  String? Function(BuildContext, String?)? fnameAdminCATextControllerValidator;
  String? _fnameAdminCATextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g0obj0x1' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for lname_adminCA widget.
  FocusNode? lnameAdminCAFocusNode;
  TextEditingController? lnameAdminCATextController;
  String? Function(BuildContext, String?)? lnameAdminCATextControllerValidator;
  String? _lnameAdminCATextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'w0cxkzw1' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for gender_adminCA widget.
  String? genderAdminCAValue;
  FormFieldController<String>? genderAdminCAValueController;
  DateTime? datePicked;
  // State field(s) for password_adminCA widget.
  FocusNode? passwordAdminCAFocusNode;
  TextEditingController? passwordAdminCATextController;
  late bool passwordAdminCAVisibility;
  String? Function(BuildContext, String?)?
      passwordAdminCATextControllerValidator;
  String? _passwordAdminCATextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'i6y40lke' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for confirmPassword_adminCA widget.
  FocusNode? confirmPasswordAdminCAFocusNode;
  TextEditingController? confirmPasswordAdminCATextController;
  late bool confirmPasswordAdminCAVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordAdminCATextControllerValidator;
  String? _confirmPasswordAdminCATextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e4l8h3g3' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    fnameAdminCATextControllerValidator = _fnameAdminCATextControllerValidator;
    lnameAdminCATextControllerValidator = _lnameAdminCATextControllerValidator;
    passwordAdminCAVisibility = false;
    passwordAdminCATextControllerValidator =
        _passwordAdminCATextControllerValidator;
    confirmPasswordAdminCAVisibility = false;
    confirmPasswordAdminCATextControllerValidator =
        _confirmPasswordAdminCATextControllerValidator;
  }

  @override
  void dispose() {
    fnameAdminCAFocusNode?.dispose();
    fnameAdminCATextController?.dispose();

    lnameAdminCAFocusNode?.dispose();
    lnameAdminCATextController?.dispose();

    passwordAdminCAFocusNode?.dispose();
    passwordAdminCATextController?.dispose();

    confirmPasswordAdminCAFocusNode?.dispose();
    confirmPasswordAdminCATextController?.dispose();
  }
}

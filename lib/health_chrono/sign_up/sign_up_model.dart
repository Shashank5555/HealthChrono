import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  Local state fields for this page.

  String? passwordCA;

  String? confirmPasswordCA;

  bool showGenderTextError = false;

  bool showDOBTextError = false;

  bool? showTimeZoneTextError = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for fname_clientCA widget.
  FocusNode? fnameClientCAFocusNode;
  TextEditingController? fnameClientCATextController;
  String? Function(BuildContext, String?)? fnameClientCATextControllerValidator;
  String? _fnameClientCATextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'n4ylfa22' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for lname_clientCA widget.
  FocusNode? lnameClientCAFocusNode;
  TextEditingController? lnameClientCATextController;
  String? Function(BuildContext, String?)? lnameClientCATextControllerValidator;
  String? _lnameClientCATextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jvczpd1g' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for gender_clientCA widget.
  String? genderClientCAValue;
  FormFieldController<String>? genderClientCAValueController;
  DateTime? datePicked1;
  // State field(s) for timezone_clientCA widget.
  String? timezoneClientCAValue;
  FormFieldController<String>? timezoneClientCAValueController;
  // State field(s) for password_clientCA widget.
  FocusNode? passwordClientCAFocusNode;
  TextEditingController? passwordClientCATextController;
  late bool passwordClientCAVisibility;
  String? Function(BuildContext, String?)?
      passwordClientCATextControllerValidator;
  String? _passwordClientCATextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'i4n4yp92' /* Field is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'qkbilrxu' /* At least 8 characters are requ... */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*(),.?:{}|<>])[A-Za-z\\d!@#\$%^&*(),.?:{}|<>]{1,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ipe4gbg6' /* Password should contain:
- At ... */
        ,
      );
    }
    return null;
  }

  // State field(s) for confirmPassword_clientCA widget.
  FocusNode? confirmPasswordClientCAFocusNode;
  TextEditingController? confirmPasswordClientCATextController;
  late bool confirmPasswordClientCAVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordClientCATextControllerValidator;
  String? _confirmPasswordClientCATextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'y7qli3jx' /* Field is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        '5zbvdpyf' /* At least 8 characters are requ... */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*(),.?:{}|<>])[A-Za-z\\d!@#\$%^&*(),.?:{}|<>]{1,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'rjeiegz8' /* Password should contain:
- At ... */
        ,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (register_with_token_register_post)] action in Button_clientCA widget.
  ApiCallResponse? registerClient;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for fname_practitionerCA widget.
  FocusNode? fnamePractitionerCAFocusNode;
  TextEditingController? fnamePractitionerCATextController;
  String? Function(BuildContext, String?)?
      fnamePractitionerCATextControllerValidator;
  String? _fnamePractitionerCATextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nqx42xrx' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for lname_practitionerCA widget.
  FocusNode? lnamePractitionerCAFocusNode;
  TextEditingController? lnamePractitionerCATextController;
  String? Function(BuildContext, String?)?
      lnamePractitionerCATextControllerValidator;
  String? _lnamePractitionerCATextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nf7k2hp7' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for gender_practitionerCA widget.
  String? genderPractitionerCAValue;
  FormFieldController<String>? genderPractitionerCAValueController;
  DateTime? datePicked2;
  // State field(s) for timezone_practitionerCA widget.
  String? timezonePractitionerCAValue;
  FormFieldController<String>? timezonePractitionerCAValueController;
  // State field(s) for password_practitionerCA widget.
  FocusNode? passwordPractitionerCAFocusNode;
  TextEditingController? passwordPractitionerCATextController;
  late bool passwordPractitionerCAVisibility;
  String? Function(BuildContext, String?)?
      passwordPractitionerCATextControllerValidator;
  String? _passwordPractitionerCATextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'okdef7mq' /* Field is required... */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'mpqylcnw' /* At least 8 characters are requ... */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*(),.?:{}|<>])[A-Za-z\\d!@#\$%^&*(),.?:{}|<>]{1,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'z8bz2u7s' /* Password should contain:
- At ... */
        ,
      );
    }
    return null;
  }

  // State field(s) for confirmPassword_practitionerCA widget.
  FocusNode? confirmPasswordPractitionerCAFocusNode;
  TextEditingController? confirmPasswordPractitionerCATextController;
  late bool confirmPasswordPractitionerCAVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordPractitionerCATextControllerValidator;
  String? _confirmPasswordPractitionerCATextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'o427pwtc' /* Field is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'uiq025z8' /* At least 8 characters are requ... */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*(),.?:{}|<>])[A-Za-z\\d!@#\$%^&*(),.?:{}|<>]{1,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '5qryoada' /* Password should contain:
- At ... */
        ,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (register_with_token_register_post)] action in Button_practitionerCA widget.
  ApiCallResponse? registerPractitioner;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue1;
  FormFieldController<List<String>>? dropDownValueController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController15;
  String? Function(BuildContext, String?)? textController15Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController16;
  String? Function(BuildContext, String?)? textController16Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController3;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController4;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;

  @override
  void initState(BuildContext context) {
    fnameClientCATextControllerValidator =
        _fnameClientCATextControllerValidator;
    lnameClientCATextControllerValidator =
        _lnameClientCATextControllerValidator;
    passwordClientCAVisibility = false;
    passwordClientCATextControllerValidator =
        _passwordClientCATextControllerValidator;
    confirmPasswordClientCAVisibility = false;
    confirmPasswordClientCATextControllerValidator =
        _confirmPasswordClientCATextControllerValidator;
    fnamePractitionerCATextControllerValidator =
        _fnamePractitionerCATextControllerValidator;
    lnamePractitionerCATextControllerValidator =
        _lnamePractitionerCATextControllerValidator;
    passwordPractitionerCAVisibility = false;
    passwordPractitionerCATextControllerValidator =
        _passwordPractitionerCATextControllerValidator;
    confirmPasswordPractitionerCAVisibility = false;
    confirmPasswordPractitionerCATextControllerValidator =
        _confirmPasswordPractitionerCATextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    fnameClientCAFocusNode?.dispose();
    fnameClientCATextController?.dispose();

    lnameClientCAFocusNode?.dispose();
    lnameClientCATextController?.dispose();

    passwordClientCAFocusNode?.dispose();
    passwordClientCATextController?.dispose();

    confirmPasswordClientCAFocusNode?.dispose();
    confirmPasswordClientCATextController?.dispose();

    fnamePractitionerCAFocusNode?.dispose();
    fnamePractitionerCATextController?.dispose();

    lnamePractitionerCAFocusNode?.dispose();
    lnamePractitionerCATextController?.dispose();

    passwordPractitionerCAFocusNode?.dispose();
    passwordPractitionerCATextController?.dispose();

    confirmPasswordPractitionerCAFocusNode?.dispose();
    confirmPasswordPractitionerCATextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController9?.dispose();

    textFieldFocusNode2?.dispose();
    textController10?.dispose();

    textFieldFocusNode3?.dispose();
    textController11?.dispose();

    textFieldFocusNode4?.dispose();
    textController12?.dispose();

    textFieldFocusNode5?.dispose();
    textController13?.dispose();

    textFieldFocusNode6?.dispose();
    textController14?.dispose();

    textFieldFocusNode7?.dispose();
    textController15?.dispose();

    textFieldFocusNode8?.dispose();
    textController16?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
  String? get radioButtonValue3 => radioButtonValueController3?.value;
  String? get radioButtonValue4 => radioButtonValueController4?.value;
}

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'healthmetricsform_final_widget.dart' show HealthmetricsformFinalWidget;
import 'package:flutter/material.dart';

class HealthmetricsformFinalModel
    extends FlutterFlowModel<HealthmetricsformFinalWidget> {
  ///  Local state fields for this page.

  bool showErrorText = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for height_feet_HM widget.
  FocusNode? heightFeetHMFocusNode;
  TextEditingController? heightFeetHMTextController;
  String? Function(BuildContext, String?)? heightFeetHMTextControllerValidator;
  String? _heightFeetHMTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3rbl8uzz' /* Field is required... */,
      );
    }

    return null;
  }

  // State field(s) for height_inches_HM widget.
  FocusNode? heightInchesHMFocusNode;
  TextEditingController? heightInchesHMTextController;
  String? Function(BuildContext, String?)?
      heightInchesHMTextControllerValidator;
  // State field(s) for weight_HM widget.
  FocusNode? weightHMFocusNode;
  TextEditingController? weightHMTextController;
  String? Function(BuildContext, String?)? weightHMTextControllerValidator;
  String? _weightHMTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'a9usa5af' /* Field is required... */,
      );
    }

    if (!RegExp(
            '^(?:66(?:\\.\\d{1,2})?|(?:[6-9][0-9]|[1-5][0-9]{2}|6[0-5][0-9]|660)(?:\\.\\d{1,2})?)\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'k0qx867o' /* Weight should be between 60 to... */,
      );
    }
    return null;
  }

  // State field(s) for waist_HM widget.
  FocusNode? waistHMFocusNode;
  TextEditingController? waistHMTextController;
  String? Function(BuildContext, String?)? waistHMTextControllerValidator;
  String? _waistHMTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3imix8z5' /* Field is required... */,
      );
    }

    if (!RegExp(
            '^(?:15(?:\\.\\d{1,2})?|[1-7][5-9](?:\\.\\d{1,2})?|[2-7][0-9](?:\\.\\d{1,2})?|80(?:\\.0{1,2})?)\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'mg37zoib' /* Waist size should be between 1... */,
      );
    }
    return null;
  }

  // State field(s) for hip_HM widget.
  FocusNode? hipHMFocusNode;
  TextEditingController? hipHMTextController;
  String? Function(BuildContext, String?)? hipHMTextControllerValidator;
  String? _hipHMTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jmxzrl3n' /* Field is required... */,
      );
    }

    if (!RegExp('^(?:20(?:\\.\\d{1,2})?|(?:[2-7]\\d|80)(?:\\.\\d{1,2})?)\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'w1lc2zlp' /* Hip size should be between 20 ... */,
      );
    }
    return null;
  }

  // State field(s) for ChoiceChips_HM widget.
  FormFieldController<List<String>>? choiceChipsHMValueController;
  String? get choiceChipsHMValue =>
      choiceChipsHMValueController?.value?.firstOrNull;
  set choiceChipsHMValue(String? val) =>
      choiceChipsHMValueController?.value = val != null ? [val] : [];
  // State field(s) for heartbeat_HM widget.
  FocusNode? heartbeatHMFocusNode;
  TextEditingController? heartbeatHMTextController;
  String? Function(BuildContext, String?)? heartbeatHMTextControllerValidator;
  String? _heartbeatHMTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'aaumds9a' /* Field is required... */,
      );
    }

    if (!RegExp('^(?:30|[3-9]\\d|1\\d{2}|2[0-4]\\d|250)\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'fffkuehy' /* Heart rate should be between 3... */,
      );
    }
    return null;
  }

  // State field(s) for bloodOxygenLevels_HM widget.
  FocusNode? bloodOxygenLevelsHMFocusNode;
  TextEditingController? bloodOxygenLevelsHMTextController;
  String? Function(BuildContext, String?)?
      bloodOxygenLevelsHMTextControllerValidator;
  // State field(s) for systolic_BP widget.
  FocusNode? systolicBPFocusNode;
  TextEditingController? systolicBPTextController;
  String? Function(BuildContext, String?)? systolicBPTextControllerValidator;
  String? _systolicBPTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bggbco57' /* Field is required */,
      );
    }

    if (!RegExp('^(?:50|[5-9]\\d|1\\d{2}|2\\d{2}|300)\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'z3z3qiyo' /* Systolic BP: 50 - 300 */,
      );
    }
    return null;
  }

  // State field(s) for diastolic_BP widget.
  FocusNode? diastolicBPFocusNode;
  TextEditingController? diastolicBPTextController;
  String? Function(BuildContext, String?)? diastolicBPTextControllerValidator;
  String? _diastolicBPTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3rf8ro0n' /* Field is required */,
      );
    }

    if (!RegExp('^(?:30|[3-9]\\d|1\\d{2}|200)\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'rrb0rga6' /* Diastolic BP: 30 - 200 */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (Add Metrics)] action in Button widget.
  ApiCallResponse? addMetricsClientResponse;
  // Stores action output result for [Backend Call - API (Add Metrics)] action in Button widget.
  ApiCallResponse? addMetricsPractitionerResponse;

  @override
  void initState(BuildContext context) {
    heightFeetHMTextControllerValidator = _heightFeetHMTextControllerValidator;
    weightHMTextControllerValidator = _weightHMTextControllerValidator;
    waistHMTextControllerValidator = _waistHMTextControllerValidator;
    hipHMTextControllerValidator = _hipHMTextControllerValidator;
    heartbeatHMTextControllerValidator = _heartbeatHMTextControllerValidator;
    systolicBPTextControllerValidator = _systolicBPTextControllerValidator;
    diastolicBPTextControllerValidator = _diastolicBPTextControllerValidator;
  }

  @override
  void dispose() {
    heightFeetHMFocusNode?.dispose();
    heightFeetHMTextController?.dispose();

    heightInchesHMFocusNode?.dispose();
    heightInchesHMTextController?.dispose();

    weightHMFocusNode?.dispose();
    weightHMTextController?.dispose();

    waistHMFocusNode?.dispose();
    waistHMTextController?.dispose();

    hipHMFocusNode?.dispose();
    hipHMTextController?.dispose();

    heartbeatHMFocusNode?.dispose();
    heartbeatHMTextController?.dispose();

    bloodOxygenLevelsHMFocusNode?.dispose();
    bloodOxygenLevelsHMTextController?.dispose();

    systolicBPFocusNode?.dispose();
    systolicBPTextController?.dispose();

    diastolicBPFocusNode?.dispose();
    diastolicBPTextController?.dispose();
  }
}

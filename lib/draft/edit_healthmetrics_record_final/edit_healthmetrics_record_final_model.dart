import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_healthmetrics_record_final_widget.dart'
    show EditHealthmetricsRecordFinalWidget;
import 'package:flutter/material.dart';

class EditHealthmetricsRecordFinalModel
    extends FlutterFlowModel<EditHealthmetricsRecordFinalWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for height_feet_HM widget.
  FocusNode? heightFeetHMFocusNode;
  TextEditingController? heightFeetHMTextController;
  String? Function(BuildContext, String?)? heightFeetHMTextControllerValidator;
  String? _heightFeetHMTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fjongii0' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for height_inches_HM widget.
  FocusNode? heightInchesHMFocusNode;
  TextEditingController? heightInchesHMTextController;
  String? Function(BuildContext, String?)?
      heightInchesHMTextControllerValidator;
  String? _heightInchesHMTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ny5e098t' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for weight_HM widget.
  FocusNode? weightHMFocusNode;
  TextEditingController? weightHMTextController;
  String? Function(BuildContext, String?)? weightHMTextControllerValidator;
  String? _weightHMTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p6k3irbe' /* Field is required */,
      );
    }

    if (!RegExp(
            '^(?:66(?:\\.\\d{1,2})?|(?:[6-9][0-9]|[1-5][0-9]{2}|6[0-5][0-9]|660)(?:\\.\\d{1,2})?)\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'woqouuu5' /* Weight should be between 60 an... */,
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
        'fsrhj9ik' /* Field is required */,
      );
    }

    if (!RegExp(
            '^(?:15(?:\\.\\d{1,2})?|[1-7][5-9](?:\\.\\d{1,2})?|[2-7][0-9](?:\\.\\d{1,2})?|80(?:\\.0{1,2})?)\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'q201qirr' /* Waist should be between 15 to ... */,
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
        'lu1rjnp8' /* Field is required */,
      );
    }

    if (!RegExp('^(?:20(?:\\.\\d{1,2})?|(?:[2-7]\\d|80)(?:\\.\\d{1,2})?)\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '3d0w0xie' /* Hip should be between 20 to 80... */,
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
        'qtxfjxmu' /* Field is required */,
      );
    }

    if (!RegExp('^(?:30|[3-9]\\d|1\\d{2}|2[0-4]\\d|250)\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'rgo0rkic' /* Heart Rate should be between 3... */,
      );
    }
    return null;
  }

  // State field(s) for BloodOxygenLevels_HM widget.
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
        'flepk4mq' /* Field is required */,
      );
    }

    if (!RegExp('^(?:50|[5-9]\\d|1\\d{2}|2\\d{2}|300)\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'xmd18oqt' /* Systolic BP: 50 to 300 */,
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
        'acwmlmxa' /* Field is required */,
      );
    }

    if (!RegExp('^(?:30|[3-9]\\d|1\\d{2}|200)\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'wjof4fep' /* Diastolic BP: 30 to 200 */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (Edit Metrics)] action in Button widget.
  ApiCallResponse? editMetricsResponse;

  @override
  void initState(BuildContext context) {
    heightFeetHMTextControllerValidator = _heightFeetHMTextControllerValidator;
    heightInchesHMTextControllerValidator =
        _heightInchesHMTextControllerValidator;
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

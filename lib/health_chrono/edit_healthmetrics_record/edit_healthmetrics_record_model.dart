import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_healthmetrics_record_widget.dart'
    show EditHealthmetricsRecordWidget;
import 'package:flutter/material.dart';

class EditHealthmetricsRecordModel
    extends FlutterFlowModel<EditHealthmetricsRecordWidget> {
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
        'oi6w2dr8' /* Field is required */,
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
        'd3igl5ib' /* Field is required */,
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
        's768smrm' /* Field is required */,
      );
    }

    if (!RegExp(
            '^(?:66(?:\\.\\d{1,2})?|(?:[6-9][0-9]|[1-5][0-9]{2}|6[0-5][0-9]|660)(?:\\.\\d{1,2})?)\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'enturtou' /* Weight should be between 60 an... */,
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
        'rt4zic9f' /* Field is required */,
      );
    }

    if (!RegExp(
            '^(?:15(?:\\.\\d{1,2})?|[1-7][5-9](?:\\.\\d{1,2})?|[2-7][0-9](?:\\.\\d{1,2})?|80(?:\\.0{1,2})?)\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ciwldetm' /* Waist should be between 15 to ... */,
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
        'ta6ic2kw' /* Field is required */,
      );
    }

    if (!RegExp('^(?:20(?:\\.\\d{1,2})?|(?:[2-7]\\d|80)(?:\\.\\d{1,2})?)\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'bsfuly1w' /* Hip should be between 20 to 80... */,
      );
    }
    return null;
  }

  // State field(s) for chest_HM widget.
  FocusNode? chestHMFocusNode;
  TextEditingController? chestHMTextController;
  String? Function(BuildContext, String?)? chestHMTextControllerValidator;
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
        '1aht0atp' /* Field is required */,
      );
    }

    if (!RegExp('^(?:30|[3-9]\\d|1\\d{2}|2[0-4]\\d|250)\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'xrnavzew' /* Heart Rate should be between 3... */,
      );
    }
    return null;
  }

  // State field(s) for systolic_BP widget.
  FocusNode? systolicBPFocusNode;
  TextEditingController? systolicBPTextController;
  String? Function(BuildContext, String?)? systolicBPTextControllerValidator;
  String? _systolicBPTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xezc4uwq' /* Field is required */,
      );
    }

    if (!RegExp('^(?:50|[5-9]\\d|1\\d{2}|2\\d{2}|300)\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'jr20xb81' /* Systolic BP: 50 - 300 */,
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
        '5maku4uv' /* Field is required */,
      );
    }

    if (!RegExp('^(?:30|[3-9]\\d|1\\d{2}|200)\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'zc74v8bc' /* Diastolic BP: 30 - 200 */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (patch_metric_metrics__metric_id__patch)] action in Button widget.
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

    chestHMFocusNode?.dispose();
    chestHMTextController?.dispose();

    heartbeatHMFocusNode?.dispose();
    heartbeatHMTextController?.dispose();

    systolicBPFocusNode?.dispose();
    systolicBPTextController?.dispose();

    diastolicBPFocusNode?.dispose();
    diastolicBPTextController?.dispose();
  }
}

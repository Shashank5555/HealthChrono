import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'remindersand_notifications_screen_widget.dart'
    show RemindersandNotificationsScreenWidget;
import 'package:flutter/material.dart';

class RemindersandNotificationsScreenModel
    extends FlutterFlowModel<RemindersandNotificationsScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

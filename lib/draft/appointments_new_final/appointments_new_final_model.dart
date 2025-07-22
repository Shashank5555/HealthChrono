import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'appointments_new_final_widget.dart' show AppointmentsNewFinalWidget;
import 'package:flutter/material.dart';

class AppointmentsNewFinalModel
    extends FlutterFlowModel<AppointmentsNewFinalWidget> {
  ///  Local state fields for this page.

  List<String> status = ['confirmed'];
  void addToStatus(String item) => status.add(item);
  void removeFromStatus(String item) => status.remove(item);
  void removeAtIndexFromStatus(int index) => status.removeAt(index);
  void insertAtIndexInStatus(int index, String item) =>
      status.insert(index, item);
  void updateStatusAtIndex(int index, Function(String) updateFn) =>
      status[index] = updateFn(status[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - API (Cancel an appointment slot)] action in Button widget.
  ApiCallResponse? cancelAppointment;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}

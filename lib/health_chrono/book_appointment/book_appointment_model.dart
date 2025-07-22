import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'book_appointment_widget.dart' show BookAppointmentWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class BookAppointmentModel extends FlutterFlowModel<BookAppointmentWidget> {
  ///  Local state fields for this page.

  String? practitionerID;

  String? startDate;

  String? endDate;

  int? isTappedIndex;

  List<String> yss = ['yss'];
  void addToYss(String item) => yss.add(item);
  void removeFromYss(String item) => yss.remove(item);
  void removeAtIndexFromYss(int index) => yss.removeAt(index);
  void insertAtIndexInYss(int index, String item) => yss.insert(index, item);
  void updateYssAtIndex(int index, Function(String) updateFn) =>
      yss[index] = updateFn(yss[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (get_my_profile_practitioners_me_get)] action in BookAppointment widget.
  ApiCallResponse? pracIDResponse;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Backend Call - API (Create a new appointment slot)] action in Button widget.
  ApiCallResponse? createAppointment;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

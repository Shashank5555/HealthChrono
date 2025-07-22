import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'practitioner_links_widget.dart' show PractitionerLinksWidget;
import 'package:flutter/material.dart';

class PractitionerLinksModel extends FlutterFlowModel<PractitionerLinksWidget> {
  ///  Local state fields for this page.

  List<String> requestedBy = ['client'];
  void addToRequestedBy(String item) => requestedBy.add(item);
  void removeFromRequestedBy(String item) => requestedBy.remove(item);
  void removeAtIndexFromRequestedBy(int index) => requestedBy.removeAt(index);
  void insertAtIndexInRequestedBy(int index, String item) =>
      requestedBy.insert(index, item);
  void updateRequestedByAtIndex(int index, Function(String) updateFn) =>
      requestedBy[index] = updateFn(requestedBy[index]);

  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter1;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - API (accept_link_links__link_id__accept_post)] action in Button widget.
  ApiCallResponse? pendingLink;
  // Stores action output result for [Backend Call - API (reject_link_links__link_id__reject_post)] action in Button widget.
  ApiCallResponse? pendingLinkReject;
  // Stores action output result for [Backend Call - API (delete_link_links__link_id__delete)] action in IconButton widget.
  ApiCallResponse? deleteLink;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }

  /// Additional helper methods.
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
}

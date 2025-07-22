import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/health_chrono/navigation_bar/navigation_bar_widget.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'practitioner_profile_screen_widget.dart'
    show PractitionerProfileScreenWidget;
import 'package:flutter/material.dart';

class PractitionerProfileScreenModel
    extends FlutterFlowModel<PractitionerProfileScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  bool isDataUploading_profilePicture = false;
  FFUploadedFile uploadedLocalFile_profilePicture =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload_profile_picture_practitioners_me_profile_picture_put)] action in Icon widget.
  ApiCallResponse? uploadProfilePicture;
  // Stores action output result for [Backend Call - API (logout_auth_logout_post)] action in Button widget.
  ApiCallResponse? logoutAPIResponse;
  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    navigationBarModel.dispose();
  }
}

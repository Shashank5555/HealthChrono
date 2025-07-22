import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'user_profile_screen_widget.dart' show UserProfileScreenWidget;
import 'package:flutter/material.dart';

class UserProfileScreenModel extends FlutterFlowModel<UserProfileScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  bool isDataUploading_profilePictureUser = false;
  FFUploadedFile uploadedLocalFile_profilePictureUser =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload_profile_picture_clients_me_profile_picture_put)] action in Icon widget.
  ApiCallResponse? uploadProfilePicture;
  // Stores action output result for [Backend Call - API (logout_auth_logout_post)] action in Button widget.
  ApiCallResponse? logoutAPIResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

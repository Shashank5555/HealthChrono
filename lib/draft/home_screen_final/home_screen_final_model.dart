import '/flutter_flow/flutter_flow_util.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/index.dart';
import 'home_screen_final_widget.dart' show HomeScreenFinalWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreenFinalModel extends FlutterFlowModel<HomeScreenFinalWidget> {
  ///  State fields for stateful widgets in this page.

  bool biometricClient = false;
  // Model for NoDataAvailable component.
  late NoDataAvailableModel noDataAvailableModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {
    noDataAvailableModel = createModel(context, () => NoDataAvailableModel());
  }

  @override
  void dispose() {
    noDataAvailableModel.dispose();
  }
}

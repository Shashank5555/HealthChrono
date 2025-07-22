import '/flutter_flow/flutter_flow_util.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/index.dart';
import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreenModel extends FlutterFlowModel<HomeScreenWidget> {
  ///  Local state fields for this page.

  int? step;

  ///  State fields for stateful widgets in this page.

  bool biometricClient = false;
  // Model for NoDataAvailable component.
  late NoDataAvailableModel noDataAvailableModel;
  // Stores action output result for [Custom Action - getDailyStepCount] action in Button widget.
  int? steps;
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

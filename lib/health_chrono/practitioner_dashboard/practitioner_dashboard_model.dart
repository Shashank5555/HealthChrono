import '/flutter_flow/flutter_flow_util.dart';
import '/health_chrono/navigation_bar/navigation_bar_widget.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'practitioner_dashboard_widget.dart' show PractitionerDashboardWidget;
import 'package:flutter/material.dart';

class PractitionerDashboardModel
    extends FlutterFlowModel<PractitionerDashboardWidget> {
  ///  Local state fields for this page.

  bool isSearchClicked = false;

  ///  State fields for stateful widgets in this page.

  // Model for NoDataAvailable component.
  late NoDataAvailableModel noDataAvailableModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    noDataAvailableModel = createModel(context, () => NoDataAvailableModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    noDataAvailableModel.dispose();
    navigationBarModel.dispose();
  }
}

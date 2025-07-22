import '/flutter_flow/flutter_flow_util.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/index.dart';
import 'client_health_dashboard_at_p_s_widget.dart'
    show ClientHealthDashboardAtPSWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ClientHealthDashboardAtPSModel
    extends FlutterFlowModel<ClientHealthDashboardAtPSWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // Model for NoDataAvailable component.
  late NoDataAvailableModel noDataAvailableModel;

  @override
  void initState(BuildContext context) {
    noDataAvailableModel = createModel(context, () => NoDataAvailableModel());
  }

  @override
  void dispose() {
    noDataAvailableModel.dispose();
  }
}

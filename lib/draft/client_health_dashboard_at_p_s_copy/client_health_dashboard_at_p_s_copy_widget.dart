import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'client_health_dashboard_at_p_s_copy_model.dart';
export 'client_health_dashboard_at_p_s_copy_model.dart';

class ClientHealthDashboardAtPSCopyWidget extends StatefulWidget {
  const ClientHealthDashboardAtPSCopyWidget({
    super.key,
    required this.email,
    required this.userID,
    required this.gender,
    required this.age,
  });

  final String? email;
  final String? userID;
  final String? gender;
  final int? age;

  static String routeName = 'ClientHealthDashboardAtPSCopy';
  static String routePath = '/clientHealthDashboardAtPSCopy';

  @override
  State<ClientHealthDashboardAtPSCopyWidget> createState() =>
      _ClientHealthDashboardAtPSCopyWidgetState();
}

class _ClientHealthDashboardAtPSCopyWidgetState
    extends State<ClientHealthDashboardAtPSCopyWidget> {
  late ClientHealthDashboardAtPSCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientHealthDashboardAtPSCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (getCurrentTimestamp >= currentAuthTokenExpiration!) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Session timed out...',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
            duration: Duration(milliseconds: 3500),
            backgroundColor: FlutterFlowTheme.of(context).primary,
          ),
        );
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        context.goNamedAuth(LoginWidget.routeName, context.mounted);
      } else {
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            context.pushNamed(
                              ClientDetailsAtPractitionerSideWidget.routeName,
                              queryParameters: {
                                'email': serializeParam(
                                  widget.email,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                        ),
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'sk8hyngu' /* Health Dashboard */,
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displaySmallFamily,
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .displaySmallIsCustom,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'hw7ey3zd' /* Your daily health metrics at a... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              color: FlutterFlowTheme.of(context).info,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyLargeIsCustom,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(height: 0.0)),
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: () {
                    if (MediaQuery.sizeOf(context).width < 800.0) {
                      return 600.0;
                    } else if (MediaQuery.sizeOf(context).width < 1000.0) {
                      return 700.0;
                    } else if (MediaQuery.sizeOf(context).width < 1200.0) {
                      return 800.0;
                    } else {
                      return 900.0;
                    }
                  }(),
                ),
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(32.0, 24.0, 32.0, 24.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: FFAppState().metricsDetails(
                      uniqueQueryKey: valueOrDefault<String>(
                        widget.email,
                        'None',
                      ),
                      requestFn: () =>
                          HealthChronoAPIsGroup.getMetricsDetailsCall.call(
                        accessToken: currentAuthenticationToken,
                        email: widget.email,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: SpinKitCircle(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 40.0,
                            ),
                          ),
                        );
                      }
                      final listViewGetMetricsDetailsResponse = snapshot.data!;

                      return ListView(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          if (listViewGetMetricsDetailsResponse.succeeded)
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FutureBuilder<ApiCallResponse>(
                                future: HealthChronoAPIsGroup
                                    .displayGaugeChartsCall
                                    .call(
                                  accessToken: currentAuthenticationToken,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: SpinKitCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewDisplayGaugeChartsResponse =
                                      snapshot.data!;

                                  return ListView(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 600.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 24.0, 24.0, 24.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '9h30b5as' /* Heart Rate */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmallIsCustom,
                                                              ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                HealthChronoAPIsGroup
                                                                    .getMetricsDetailsCall
                                                                    .heartRate(
                                                                      listViewGetMetricsDetailsResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.toString(),
                                                                '72',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displaySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .displaySmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .displaySmallIsCustom,
                                                                  ),
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'pr4k3xop' /* BPM */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyLargeIsCustom,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ],
                                                    ),
                                                    Icon(
                                                      Icons.favorite,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 32.0,
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 285.0,
                                                    child: custom_widgets
                                                        .HeartRateGauge(
                                                      width: double.infinity,
                                                      height: 285.0,
                                                      heartRate: valueOrDefault<
                                                          double>(
                                                        HealthChronoAPIsGroup
                                                            .getMetricsDetailsCall
                                                            .heartRate(
                                                              listViewGetMetricsDetailsResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toDouble(),
                                                        60.0,
                                                      ),
                                                      gender: widget.gender!,
                                                      age: widget.age!,
                                                    ),
                                                  ),
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                HealthChronoAPIsGroup
                                                                    .displayGaugeChartsCall
                                                                    .heartRate(
                                                                  listViewDisplayGaugeChartsResponse
                                                                      .jsonBody,
                                                                )!,
                                                                fit: BoxFit
                                                                    .contain,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.jpg',
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: HealthChronoAPIsGroup
                                                                  .displayGaugeChartsCall
                                                                  .heartRate(
                                                                listViewDisplayGaugeChartsResponse
                                                                    .jsonBody,
                                                              )!,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: HealthChronoAPIsGroup
                                                            .displayGaugeChartsCall
                                                            .heartRate(
                                                          listViewDisplayGaugeChartsResponse
                                                              .jsonBody,
                                                        )!,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: Image.network(
                                                          HealthChronoAPIsGroup
                                                              .displayGaugeChartsCall
                                                              .heartRate(
                                                            listViewDisplayGaugeChartsResponse
                                                                .jsonBody,
                                                          )!,
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.contain,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.jpg',
                                                            width:
                                                                double.infinity,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      HealthMetricsGraphsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'metricName':
                                                            serializeParam(
                                                          'Heart Rate',
                                                          ParamType.String,
                                                        ),
                                                        'userID':
                                                            serializeParam(
                                                          widget.userID,
                                                          ParamType.String,
                                                        ),
                                                        'email': serializeParam(
                                                          widget.email,
                                                          ParamType.String,
                                                        ),
                                                        'gender':
                                                            serializeParam(
                                                          widget.gender,
                                                          ParamType.String,
                                                        ),
                                                        'age': serializeParam(
                                                          widget.age,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'a8gmoc1a' /* View Details */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 600.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 24.0, 24.0, 24.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'tzed1ijz' /* Blood Pressure */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmallIsCustom,
                                                              ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              '${HealthChronoAPIsGroup.getMetricsDetailsCall.systolicBP(
                                                                    listViewGetMetricsDetailsResponse
                                                                        .jsonBody,
                                                                  )?.toString()}/${HealthChronoAPIsGroup.getMetricsDetailsCall.diastolicBP(
                                                                    listViewGetMetricsDetailsResponse
                                                                        .jsonBody,
                                                                  )?.toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displaySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .displaySmallFamily,
                                                                    color: Color(
                                                                        0xFF4B39EF),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .displaySmallIsCustom,
                                                                  ),
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '42m4pwxy' /* mmHg */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyLargeIsCustom,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ],
                                                    ),
                                                    Icon(
                                                      Icons.monitor_heart,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 32.0,
                                                    ),
                                                  ],
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                HealthChronoAPIsGroup
                                                                    .displayGaugeChartsCall
                                                                    .bloodPressure(
                                                                  listViewDisplayGaugeChartsResponse
                                                                      .jsonBody,
                                                                )!,
                                                                fit: BoxFit
                                                                    .contain,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.jpg',
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: HealthChronoAPIsGroup
                                                                  .displayGaugeChartsCall
                                                                  .bloodPressure(
                                                                listViewDisplayGaugeChartsResponse
                                                                    .jsonBody,
                                                              )!,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: HealthChronoAPIsGroup
                                                            .displayGaugeChartsCall
                                                            .bloodPressure(
                                                          listViewDisplayGaugeChartsResponse
                                                              .jsonBody,
                                                        )!,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: Image.network(
                                                          HealthChronoAPIsGroup
                                                              .displayGaugeChartsCall
                                                              .bloodPressure(
                                                            listViewDisplayGaugeChartsResponse
                                                                .jsonBody,
                                                          )!,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.jpg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 320.0,
                                                  child: CarouselSlider(
                                                    items: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'y6w3zu4g' /* Systolic Blood Pressure */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 285.0,
                                                              child: custom_widgets
                                                                  .SystolicBloodPressureGauge(
                                                                width: double
                                                                    .infinity,
                                                                height: 285.0,
                                                                bp: HealthChronoAPIsGroup
                                                                    .getMetricsDetailsCall
                                                                    .systolicBP(
                                                                      listViewGetMetricsDetailsResponse
                                                                          .jsonBody,
                                                                    )!
                                                                    .toDouble(),
                                                                gender: widget
                                                                    .gender!,
                                                                age: widget
                                                                    .age!,
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 15.0)),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '14sgdz9n' /* Diastolic Blood Pressure */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 285.0,
                                                              child: custom_widgets
                                                                  .DiastolicBloodPressureGauge(
                                                                width: double
                                                                    .infinity,
                                                                height: 285.0,
                                                                bp: HealthChronoAPIsGroup
                                                                    .getMetricsDetailsCall
                                                                    .diastolicBP(
                                                                      listViewGetMetricsDetailsResponse
                                                                          .jsonBody,
                                                                    )!
                                                                    .toDouble(),
                                                                gender: widget
                                                                    .gender!,
                                                                age: widget
                                                                    .age!,
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 15.0)),
                                                        ),
                                                      ),
                                                    ],
                                                    carouselController: _model
                                                            .carouselController ??=
                                                        CarouselSliderController(),
                                                    options: CarouselOptions(
                                                      initialPage: 0,
                                                      viewportFraction: 1.0,
                                                      disableCenter: true,
                                                      enlargeCenterPage: true,
                                                      enlargeFactor: 0.25,
                                                      enableInfiniteScroll:
                                                          true,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      autoPlay: true,
                                                      autoPlayAnimationDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  2500),
                                                      autoPlayInterval:
                                                          Duration(
                                                              milliseconds:
                                                                  (2500 +
                                                                      10000)),
                                                      autoPlayCurve:
                                                          Curves.linear,
                                                      pauseAutoPlayInFiniteScroll:
                                                          true,
                                                      onPageChanged: (index,
                                                              _) =>
                                                          _model.carouselCurrentIndex =
                                                              index,
                                                    ),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      HealthMetricsGraphsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'metricName':
                                                            serializeParam(
                                                          'Blood Pressure',
                                                          ParamType.String,
                                                        ),
                                                        'userID':
                                                            serializeParam(
                                                          widget.userID,
                                                          ParamType.String,
                                                        ),
                                                        'email': serializeParam(
                                                          widget.email,
                                                          ParamType.String,
                                                        ),
                                                        'gender':
                                                            serializeParam(
                                                          widget.gender,
                                                          ParamType.String,
                                                        ),
                                                        'age': serializeParam(
                                                          widget.age,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '5szjvhnc' /* View Details */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          constraints: BoxConstraints(
                                            maxWidth: 600.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 24.0, 24.0, 24.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'akvhzecq' /* Base Metabolic Index */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmallIsCustom,
                                                              ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                HealthChronoAPIsGroup
                                                                    .getMetricsDetailsCall
                                                                    .bmi(
                                                                      listViewGetMetricsDetailsResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.toString(),
                                                                '25',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displaySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .displaySmallFamily,
                                                                    color: Color(
                                                                        0xFFE0A200),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .displaySmallIsCustom,
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                HealthChronoAPIsGroup
                                                                    .getMetricsDetailsCall
                                                                    .bmiClassification(
                                                                  listViewGetMetricsDetailsResponse
                                                                      .jsonBody,
                                                                ),
                                                                'Good',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyLargeIsCustom,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ],
                                                    ),
                                                    Icon(
                                                      Icons.directions_walk,
                                                      color: Color(0xFFE0A200),
                                                      size: 32.0,
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 285.0,
                                                    child:
                                                        custom_widgets.BMIGauge(
                                                      width: double.infinity,
                                                      height: 285.0,
                                                      bmi: HealthChronoAPIsGroup
                                                          .getMetricsDetailsCall
                                                          .bmi(
                                                        listViewGetMetricsDetailsResponse
                                                            .jsonBody,
                                                      )!,
                                                      gender: widget.gender!,
                                                      age: widget.age!,
                                                    ),
                                                  ),
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                HealthChronoAPIsGroup
                                                                    .displayGaugeChartsCall
                                                                    .bmi(
                                                                  listViewDisplayGaugeChartsResponse
                                                                      .jsonBody,
                                                                )!,
                                                                fit: BoxFit
                                                                    .contain,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.jpg',
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: HealthChronoAPIsGroup
                                                                  .displayGaugeChartsCall
                                                                  .bmi(
                                                                listViewDisplayGaugeChartsResponse
                                                                    .jsonBody,
                                                              )!,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: HealthChronoAPIsGroup
                                                            .displayGaugeChartsCall
                                                            .bmi(
                                                          listViewDisplayGaugeChartsResponse
                                                              .jsonBody,
                                                        )!,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: Image.network(
                                                          HealthChronoAPIsGroup
                                                              .displayGaugeChartsCall
                                                              .bmi(
                                                            listViewDisplayGaugeChartsResponse
                                                                .jsonBody,
                                                          )!,
                                                          fit: BoxFit.contain,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.jpg',
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      HealthMetricsGraphsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'metricName':
                                                            serializeParam(
                                                          'BMI',
                                                          ParamType.String,
                                                        ),
                                                        'userID':
                                                            serializeParam(
                                                          widget.userID,
                                                          ParamType.String,
                                                        ),
                                                        'email': serializeParam(
                                                          widget.email,
                                                          ParamType.String,
                                                        ),
                                                        'gender':
                                                            serializeParam(
                                                          widget.gender,
                                                          ParamType.String,
                                                        ),
                                                        'age': serializeParam(
                                                          widget.age,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ku3hozu9' /* View Details */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFE0A200),
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 600.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 24.0, 24.0, 24.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'jz2xn0ld' /* Waist to Hip Ratio */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .headlineSmallIsCustom,
                                                                  ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    HealthChronoAPIsGroup
                                                                        .getMetricsDetailsCall
                                                                        .waistToHipRatio(
                                                                          listViewGetMetricsDetailsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toString(),
                                                                    '0.5',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).displaySmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).displaySmallIsCustom,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    HealthChronoAPIsGroup
                                                                        .getMetricsDetailsCall
                                                                        .waistToHipEstimation(
                                                                      listViewGetMetricsDetailsResponse
                                                                          .jsonBody,
                                                                    ),
                                                                    'Good',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Icon(
                                                        Icons
                                                            .integration_instructions,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 32.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 285.0,
                                                    child: custom_widgets
                                                        .WaistToHipGauge(
                                                      width: double.infinity,
                                                      height: 285.0,
                                                      wth: HealthChronoAPIsGroup
                                                          .getMetricsDetailsCall
                                                          .waistToHipRatio(
                                                        listViewGetMetricsDetailsResponse
                                                            .jsonBody,
                                                      )!,
                                                      gender: widget.gender!,
                                                      age: widget.age!,
                                                    ),
                                                  ),
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                HealthChronoAPIsGroup
                                                                    .displayGaugeChartsCall
                                                                    .waistToHip(
                                                                  listViewDisplayGaugeChartsResponse
                                                                      .jsonBody,
                                                                )!,
                                                                fit: BoxFit
                                                                    .contain,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.jpg',
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: HealthChronoAPIsGroup
                                                                  .displayGaugeChartsCall
                                                                  .waistToHip(
                                                                listViewDisplayGaugeChartsResponse
                                                                    .jsonBody,
                                                              )!,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: HealthChronoAPIsGroup
                                                            .displayGaugeChartsCall
                                                            .waistToHip(
                                                          listViewDisplayGaugeChartsResponse
                                                              .jsonBody,
                                                        )!,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: Image.network(
                                                          HealthChronoAPIsGroup
                                                              .displayGaugeChartsCall
                                                              .waistToHip(
                                                            listViewDisplayGaugeChartsResponse
                                                                .jsonBody,
                                                          )!,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.jpg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      HealthMetricsGraphsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'metricName':
                                                            serializeParam(
                                                          'Waist to Hip Ratio',
                                                          ParamType.String,
                                                        ),
                                                        'userID':
                                                            serializeParam(
                                                          widget.userID,
                                                          ParamType.String,
                                                        ),
                                                        'email': serializeParam(
                                                          widget.email,
                                                          ParamType.String,
                                                        ),
                                                        'gender':
                                                            serializeParam(
                                                          widget.gender,
                                                          ParamType.String,
                                                        ),
                                                        'age': serializeParam(
                                                          widget.age,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'q1eyhfbk' /* View Details */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 600.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 24.0, 24.0, 24.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '3va48c2t' /* Waist to Height Ratio */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .headlineSmallIsCustom,
                                                                  ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    HealthChronoAPIsGroup
                                                                        .getMetricsDetailsCall
                                                                        .waistToHeightRatio(
                                                                          listViewGetMetricsDetailsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toString(),
                                                                    '0.5',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).displaySmallFamily,
                                                                        color: Color(
                                                                            0xFF7E57C2),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).displaySmallIsCustom,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    HealthChronoAPIsGroup
                                                                        .getMetricsDetailsCall
                                                                        .waistToHeightEstimation(
                                                                      listViewGetMetricsDetailsResponse
                                                                          .jsonBody,
                                                                    ),
                                                                    'Good',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Icon(
                                                        Icons
                                                            .integration_instructions,
                                                        color:
                                                            Color(0xFF7E57C2),
                                                        size: 32.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 285.0,
                                                    child: custom_widgets
                                                        .WaistToHeightGauge(
                                                      width: double.infinity,
                                                      height: 285.0,
                                                      wth: HealthChronoAPIsGroup
                                                          .getMetricsDetailsCall
                                                          .waistToHeightRatio(
                                                        listViewGetMetricsDetailsResponse
                                                            .jsonBody,
                                                      )!,
                                                      gender: widget.gender!,
                                                      age: widget.age!,
                                                    ),
                                                  ),
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                HealthChronoAPIsGroup
                                                                    .displayGaugeChartsCall
                                                                    .waistToHeight(
                                                                  listViewDisplayGaugeChartsResponse
                                                                      .jsonBody,
                                                                )!,
                                                                fit: BoxFit
                                                                    .contain,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.jpg',
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: HealthChronoAPIsGroup
                                                                  .displayGaugeChartsCall
                                                                  .waistToHeight(
                                                                listViewDisplayGaugeChartsResponse
                                                                    .jsonBody,
                                                              )!,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: HealthChronoAPIsGroup
                                                            .displayGaugeChartsCall
                                                            .waistToHeight(
                                                          listViewDisplayGaugeChartsResponse
                                                              .jsonBody,
                                                        )!,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: Image.network(
                                                          HealthChronoAPIsGroup
                                                              .displayGaugeChartsCall
                                                              .waistToHeight(
                                                            listViewDisplayGaugeChartsResponse
                                                                .jsonBody,
                                                          )!,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.jpg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      HealthMetricsGraphsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'metricName':
                                                            serializeParam(
                                                          'Waist to Height Ratio',
                                                          ParamType.String,
                                                        ),
                                                        'userID':
                                                            serializeParam(
                                                          widget.userID,
                                                          ParamType.String,
                                                        ),
                                                        'email': serializeParam(
                                                          widget.email,
                                                          ParamType.String,
                                                        ),
                                                        'gender':
                                                            serializeParam(
                                                          widget.gender,
                                                          ParamType.String,
                                                        ),
                                                        'age': serializeParam(
                                                          widget.age,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'f32nk7sr' /* View Details */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFF7E57C2),
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 23.0)),
                                  );
                                },
                              ),
                            ),
                          if (!listViewGetMetricsDetailsResponse.succeeded)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                height: 300.0,
                                constraints: BoxConstraints(
                                  maxWidth: 600.0,
                                ),
                                decoration: BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.noDataAvailableModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NoDataAvailableWidget(),
                                ),
                              ),
                            ),
                        ].divide(SizedBox(height: 24.0)),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

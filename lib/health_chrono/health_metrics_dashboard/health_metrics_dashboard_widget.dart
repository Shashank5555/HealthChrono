import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'health_metrics_dashboard_model.dart';
export 'health_metrics_dashboard_model.dart';

class HealthMetricsDashboardWidget extends StatefulWidget {
  const HealthMetricsDashboardWidget({
    super.key,
    bool? fromViewMetrics,
  }) : this.fromViewMetrics = fromViewMetrics ?? false;

  final bool fromViewMetrics;

  static String routeName = 'HealthMetricsDashboard';
  static String routePath = '/healthMetricsDashboard';

  @override
  State<HealthMetricsDashboardWidget> createState() =>
      _HealthMetricsDashboardWidgetState();
}

class _HealthMetricsDashboardWidgetState
    extends State<HealthMetricsDashboardWidget> {
  late HealthMetricsDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthMetricsDashboardModel());

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
        safeSetState(() => _model.apiRequestCompleter = null);
        await _model.waitForApiRequestCompleted();
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            context.pushNamed(HealthMetricsDashboardLiveWidget.routeName);
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          label: Text(
            FFLocalizations.of(context).getText(
              'fsgy0rqo' /* Live Data */,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                  color: FlutterFlowTheme.of(context).alternate,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
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
                            if (widget.fromViewMetrics) {
                              context.pushNamed(ViewMetricsWidget.routeName);
                            } else {
                              context.pushNamed(HomeScreenWidget.routeName);
                            }
                          },
                        ),
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '2t20ahzz' /* Health Dashboard */,
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
                          EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'jcwfuloi' /* Your daily health metrics at a... */,
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
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: FutureBuilder<ApiCallResponse>(
          future: NewAPIsGroup.getMyProfileClientsMeGetCall.call(
            xAccessToken: currentAuthenticationToken,
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
            final listViewGetMyProfileClientsMeGetResponse = snapshot.data!;

            return ListView(
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
                      padding: EdgeInsetsDirectional.fromSTEB(
                          32.0, 24.0, 32.0, 24.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: NewAPIsGroup.listMetricsMetricsGetCall.call(
                          metricId: '0',
                          xAccessToken: currentAuthenticationToken,
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
                          final listViewListMetricsMetricsGetResponse =
                              snapshot.data!;

                          return ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              if (NewAPIsGroup.listMetricsMetricsGetCall.id(
                                        listViewListMetricsMetricsGetResponse
                                            .jsonBody,
                                      ) !=
                                      null &&
                                  (NewAPIsGroup.listMetricsMetricsGetCall.id(
                                    listViewListMetricsMetricsGetResponse
                                        .jsonBody,
                                  ))!
                                      .isNotEmpty)
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: (_model.apiRequestCompleter ??=
                                            Completer<ApiCallResponse>()
                                              ..complete(NewAPIsGroup
                                                  .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                  .call(
                                                xAccessToken:
                                                    currentAuthenticationToken,
                                              )))
                                        .future,
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40.0,
                                            height: 40.0,
                                            child: SpinKitCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 40.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse =
                                          snapshot.data!;

                                      return ListView(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          20.0,
                                        ),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 24.0, 24.0, 24.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                                'jynao036' /* Heart Rate */,
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
                                                                    NewAPIsGroup
                                                                        .listMetricsMetricsGetCall
                                                                        .heartRate(
                                                                          listViewListMetricsMetricsGetResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.firstOrNull
                                                                        ?.toString(),
                                                                    '72',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).displaySmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).displaySmallIsCustom,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'hc2zob7d' /* BPM */,
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
                                                        Icon(
                                                          Icons.favorite,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 32.0,
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 285.0,
                                                        child: custom_widgets
                                                            .HeartRateGauge(
                                                          width:
                                                              double.infinity,
                                                          height: 285.0,
                                                          heartRate:
                                                              valueOrDefault<
                                                                  double>(
                                                            NewAPIsGroup
                                                                .listMetricsMetricsGetCall
                                                                .heartRate(
                                                                  listViewListMetricsMetricsGetResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.firstOrNull
                                                                ?.toDouble(),
                                                            60.0,
                                                          ),
                                                          gender: NewAPIsGroup
                                                              .getMyProfileClientsMeGetCall
                                                              .gender(
                                                            listViewGetMyProfileClientsMeGetResponse
                                                                .jsonBody,
                                                          )!,
                                                          age: functions
                                                              .calculateAgeFromDate(
                                                                  NewAPIsGroup
                                                                      .getMyProfileClientsMeGetCall
                                                                      .dob(
                                                            listViewGetMyProfileClientsMeGetResponse
                                                                .jsonBody,
                                                          )!),
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    NewAPIsGroup
                                                                        .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                        .heartRate(
                                                                      guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                          .jsonBody,
                                                                    )!,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.jpg',
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag: NewAPIsGroup
                                                                      .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                      .heartRate(
                                                                    guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                        .jsonBody,
                                                                  )!,
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: NewAPIsGroup
                                                                .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                .heartRate(
                                                              guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                  .jsonBody,
                                                            )!,
                                                            transitionOnUserGestures:
                                                                true,
                                                            child:
                                                                Image.network(
                                                              NewAPIsGroup
                                                                  .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                  .heartRate(
                                                                guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
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
                                                            'gender':
                                                                serializeParam(
                                                              NewAPIsGroup
                                                                  .getMyProfileClientsMeGetCall
                                                                  .gender(
                                                                listViewGetMyProfileClientsMeGetResponse
                                                                    .jsonBody,
                                                              ),
                                                              ParamType.String,
                                                            ),
                                                            'age':
                                                                serializeParam(
                                                              functions.calculateAgeFromDate(
                                                                  NewAPIsGroup
                                                                      .getMyProfileClientsMeGetCall
                                                                      .dob(
                                                                listViewGetMyProfileClientsMeGetResponse
                                                                    .jsonBody,
                                                              )!),
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'pli2uc44' /* View Details */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 16.0)),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 24.0, 24.0, 24.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                                'mkmqzmdf' /* Blood Pressure */,
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
                                                                  '${NewAPIsGroup.listMetricsMetricsGetCall.systolicBP(
                                                                        listViewListMetricsMetricsGetResponse
                                                                            .jsonBody,
                                                                      )?.firstOrNull?.toString()}/${NewAPIsGroup.listMetricsMetricsGetCall.diastolicBP(
                                                                        listViewListMetricsMetricsGetResponse
                                                                            .jsonBody,
                                                                      )?.firstOrNull?.toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).displaySmallFamily,
                                                                        color: Color(
                                                                            0xFF4B39EF),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).displaySmallIsCustom,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ueklmba0' /* mmHg */,
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
                                                        Icon(
                                                          Icons.monitor_heart,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 32.0,
                                                        ),
                                                      ],
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '5boynfmw' /* Systolic Blood Pressure */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
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
                                                                    height:
                                                                        285.0,
                                                                    bp: NewAPIsGroup
                                                                        .listMetricsMetricsGetCall
                                                                        .systolicBP(
                                                                          listViewListMetricsMetricsGetResponse
                                                                              .jsonBody,
                                                                        )!
                                                                        .firstOrNull!
                                                                        .toDouble(),
                                                                    gender: NewAPIsGroup
                                                                        .getMyProfileClientsMeGetCall
                                                                        .gender(
                                                                      listViewGetMyProfileClientsMeGetResponse
                                                                          .jsonBody,
                                                                    )!,
                                                                    age: functions.calculateAgeFromDate(
                                                                        NewAPIsGroup
                                                                            .getMyProfileClientsMeGetCall
                                                                            .dob(
                                                                      listViewGetMyProfileClientsMeGetResponse
                                                                          .jsonBody,
                                                                    )!),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      15.0)),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'hjtfrv1p' /* Diastolic Blood Pressure */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
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
                                                                    height:
                                                                        285.0,
                                                                    bp: NewAPIsGroup
                                                                        .listMetricsMetricsGetCall
                                                                        .diastolicBP(
                                                                          listViewListMetricsMetricsGetResponse
                                                                              .jsonBody,
                                                                        )!
                                                                        .firstOrNull!
                                                                        .toDouble(),
                                                                    gender: NewAPIsGroup
                                                                        .getMyProfileClientsMeGetCall
                                                                        .gender(
                                                                      listViewGetMyProfileClientsMeGetResponse
                                                                          .jsonBody,
                                                                    )!,
                                                                    age: functions.calculateAgeFromDate(
                                                                        NewAPIsGroup
                                                                            .getMyProfileClientsMeGetCall
                                                                            .dob(
                                                                      listViewGetMyProfileClientsMeGetResponse
                                                                          .jsonBody,
                                                                    )!),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      15.0)),
                                                            ),
                                                          ),
                                                        ],
                                                        carouselController: _model
                                                                .carouselController ??=
                                                            CarouselSliderController(),
                                                        options:
                                                            CarouselOptions(
                                                          initialPage: 0,
                                                          viewportFraction: 1.0,
                                                          disableCenter: true,
                                                          enlargeCenterPage:
                                                              true,
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
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                      tabletLandscape: false,
                                                      desktop: false,
                                                    ))
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    NewAPIsGroup
                                                                        .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                        .systolicBP(
                                                                      guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                          .jsonBody,
                                                                    )!,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.jpg',
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag: NewAPIsGroup
                                                                      .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                      .systolicBP(
                                                                    guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                        .jsonBody,
                                                                  )!,
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: NewAPIsGroup
                                                                .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                .systolicBP(
                                                              guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                  .jsonBody,
                                                            )!,
                                                            transitionOnUserGestures:
                                                                true,
                                                            child:
                                                                Image.network(
                                                              NewAPIsGroup
                                                                  .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                  .systolicBP(
                                                                guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                    .jsonBody,
                                                              )!,
                                                              fit: BoxFit.cover,
                                                              errorBuilder: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  Image.asset(
                                                                'assets/images/error_image.jpg',
                                                                fit: BoxFit
                                                                    .cover,
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
                                                              'Blood Pressure',
                                                              ParamType.String,
                                                            ),
                                                            'gender':
                                                                serializeParam(
                                                              NewAPIsGroup
                                                                  .getMyProfileClientsMeGetCall
                                                                  .gender(
                                                                listViewGetMyProfileClientsMeGetResponse
                                                                    .jsonBody,
                                                              ),
                                                              ParamType.String,
                                                            ),
                                                            'age':
                                                                serializeParam(
                                                              functions.calculateAgeFromDate(
                                                                  NewAPIsGroup
                                                                      .getMyProfileClientsMeGetCall
                                                                      .dob(
                                                                listViewGetMyProfileClientsMeGetResponse
                                                                    .jsonBody,
                                                              )!),
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '4yeayjhs' /* View Details */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 16.0)),
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
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              constraints: BoxConstraints(
                                                maxWidth: 600.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 24.0, 24.0, 24.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                                'xqecvd5u' /* Base Metabolic Index */,
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
                                                                    NewAPIsGroup
                                                                        .listMetricsMetricsGetCall
                                                                        .bmi(
                                                                          listViewListMetricsMetricsGetResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.firstOrNull
                                                                        ?.toString(),
                                                                    '25',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).displaySmallFamily,
                                                                        color: Color(
                                                                            0xFFE0A200),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).displaySmallIsCustom,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    NewAPIsGroup
                                                                        .listMetricsMetricsGetCall
                                                                        .bmiClassification(
                                                                          listViewListMetricsMetricsGetResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.firstOrNull,
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
                                                        Icon(
                                                          Icons.directions_walk,
                                                          color:
                                                              Color(0xFFE0A200),
                                                          size: 32.0,
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 285.0,
                                                        child: custom_widgets
                                                            .BMIGauge(
                                                          width:
                                                              double.infinity,
                                                          height: 285.0,
                                                          bmi: NewAPIsGroup
                                                              .listMetricsMetricsGetCall
                                                              .bmi(
                                                                listViewListMetricsMetricsGetResponse
                                                                    .jsonBody,
                                                              )!
                                                              .firstOrNull!,
                                                          gender: NewAPIsGroup
                                                              .getMyProfileClientsMeGetCall
                                                              .gender(
                                                            listViewGetMyProfileClientsMeGetResponse
                                                                .jsonBody,
                                                          )!,
                                                          age: functions
                                                              .calculateAgeFromDate(
                                                                  NewAPIsGroup
                                                                      .getMyProfileClientsMeGetCall
                                                                      .dob(
                                                            listViewGetMyProfileClientsMeGetResponse
                                                                .jsonBody,
                                                          )!),
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    NewAPIsGroup
                                                                        .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                        .bmi(
                                                                      guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                          .jsonBody,
                                                                    )!,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.jpg',
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag: NewAPIsGroup
                                                                      .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                      .bmi(
                                                                    guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                        .jsonBody,
                                                                  )!,
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: NewAPIsGroup
                                                                .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                .bmi(
                                                              guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                  .jsonBody,
                                                            )!,
                                                            transitionOnUserGestures:
                                                                true,
                                                            child:
                                                                Image.network(
                                                              NewAPIsGroup
                                                                  .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                  .bmi(
                                                                guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
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
                                                            'gender':
                                                                serializeParam(
                                                              NewAPIsGroup
                                                                  .getMyProfileClientsMeGetCall
                                                                  .gender(
                                                                listViewGetMyProfileClientsMeGetResponse
                                                                    .jsonBody,
                                                              ),
                                                              ParamType.String,
                                                            ),
                                                            'age':
                                                                serializeParam(
                                                              functions.calculateAgeFromDate(
                                                                  NewAPIsGroup
                                                                      .getMyProfileClientsMeGetCall
                                                                      .dob(
                                                                listViewGetMyProfileClientsMeGetResponse
                                                                    .jsonBody,
                                                              )!),
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'zex3my2o' /* View Details */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFE0A200),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 16.0)),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 24.0, 24.0, 24.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'vagkbzl9' /* Waist to Hip Ratio */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).headlineSmallIsCustom,
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
                                                                        NewAPIsGroup
                                                                            .listMetricsMetricsGetCall
                                                                            .waistToHipRatio(
                                                                              listViewListMetricsMetricsGetResponse.jsonBody,
                                                                            )
                                                                            ?.firstOrNull
                                                                            ?.toString(),
                                                                        '0.5',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).displaySmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).displaySmallIsCustom,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        NewAPIsGroup
                                                                            .listMetricsMetricsGetCall
                                                                            .waistToHipEstimation(
                                                                              listViewListMetricsMetricsGetResponse.jsonBody,
                                                                            )
                                                                            ?.firstOrNull,
                                                                        'Good',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 32.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 285.0,
                                                        child: custom_widgets
                                                            .WaistToHipGauge(
                                                          width:
                                                              double.infinity,
                                                          height: 285.0,
                                                          wth: NewAPIsGroup
                                                              .listMetricsMetricsGetCall
                                                              .waistToHipRatio(
                                                                listViewListMetricsMetricsGetResponse
                                                                    .jsonBody,
                                                              )!
                                                              .firstOrNull!,
                                                          gender: NewAPIsGroup
                                                              .getMyProfileClientsMeGetCall
                                                              .gender(
                                                            listViewGetMyProfileClientsMeGetResponse
                                                                .jsonBody,
                                                          )!,
                                                          age: functions
                                                              .calculateAgeFromDate(
                                                                  NewAPIsGroup
                                                                      .getMyProfileClientsMeGetCall
                                                                      .dob(
                                                            listViewGetMyProfileClientsMeGetResponse
                                                                .jsonBody,
                                                          )!),
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    NewAPIsGroup
                                                                        .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                        .waistToHip(
                                                                      guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                          .jsonBody,
                                                                    )!,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.jpg',
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag: NewAPIsGroup
                                                                      .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                      .waistToHip(
                                                                    guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                        .jsonBody,
                                                                  )!,
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: NewAPIsGroup
                                                                .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                .waistToHip(
                                                              guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                  .jsonBody,
                                                            )!,
                                                            transitionOnUserGestures:
                                                                true,
                                                            child:
                                                                Image.network(
                                                              NewAPIsGroup
                                                                  .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                  .waistToHip(
                                                                guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                    .jsonBody,
                                                              )!,
                                                              fit: BoxFit.cover,
                                                              errorBuilder: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  Image.asset(
                                                                'assets/images/error_image.jpg',
                                                                fit: BoxFit
                                                                    .cover,
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
                                                            'gender':
                                                                serializeParam(
                                                              NewAPIsGroup
                                                                  .getMyProfileClientsMeGetCall
                                                                  .gender(
                                                                listViewGetMyProfileClientsMeGetResponse
                                                                    .jsonBody,
                                                              ),
                                                              ParamType.String,
                                                            ),
                                                            'age':
                                                                serializeParam(
                                                              functions.calculateAgeFromDate(
                                                                  NewAPIsGroup
                                                                      .getMyProfileClientsMeGetCall
                                                                      .dob(
                                                                listViewGetMyProfileClientsMeGetResponse
                                                                    .jsonBody,
                                                              )!),
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'orsivn4b' /* View Details */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 16.0)),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 24.0, 24.0, 24.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '52b3z19k' /* Waist to Height Ratio */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).headlineSmallIsCustom,
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
                                                                        NewAPIsGroup
                                                                            .listMetricsMetricsGetCall
                                                                            .waistToHeightRatio(
                                                                              listViewListMetricsMetricsGetResponse.jsonBody,
                                                                            )
                                                                            ?.firstOrNull
                                                                            ?.toString(),
                                                                        '0.5',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).displaySmallFamily,
                                                                            color:
                                                                                Color(0xFF7E57C2),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).displaySmallIsCustom,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        NewAPIsGroup
                                                                            .listMetricsMetricsGetCall
                                                                            .waistToHeightEstimation(
                                                                              listViewListMetricsMetricsGetResponse.jsonBody,
                                                                            )
                                                                            ?.firstOrNull,
                                                                        'Good',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
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
                                                            color: Color(
                                                                0xFF7E57C2),
                                                            size: 32.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 285.0,
                                                        child: custom_widgets
                                                            .WaistToHeightGauge(
                                                          width:
                                                              double.infinity,
                                                          height: 285.0,
                                                          wth: NewAPIsGroup
                                                              .listMetricsMetricsGetCall
                                                              .waistToHeightRatio(
                                                                listViewListMetricsMetricsGetResponse
                                                                    .jsonBody,
                                                              )!
                                                              .firstOrNull!,
                                                          gender: NewAPIsGroup
                                                              .getMyProfileClientsMeGetCall
                                                              .gender(
                                                            listViewGetMyProfileClientsMeGetResponse
                                                                .jsonBody,
                                                          )!,
                                                          age: functions
                                                              .calculateAgeFromDate(
                                                                  NewAPIsGroup
                                                                      .getMyProfileClientsMeGetCall
                                                                      .dob(
                                                            listViewGetMyProfileClientsMeGetResponse
                                                                .jsonBody,
                                                          )!),
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    NewAPIsGroup
                                                                        .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                        .waistToHeight(
                                                                      guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                          .jsonBody,
                                                                    )!,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.jpg',
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag: NewAPIsGroup
                                                                      .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                      .waistToHeight(
                                                                    guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                        .jsonBody,
                                                                  )!,
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: NewAPIsGroup
                                                                .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                .waistToHeight(
                                                              guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                  .jsonBody,
                                                            )!,
                                                            transitionOnUserGestures:
                                                                true,
                                                            child:
                                                                Image.network(
                                                              NewAPIsGroup
                                                                  .getAllGaugeChartsGaugeMetricsGaugeChartsGetCall
                                                                  .waistToHeight(
                                                                guageChartsGetAllGaugeChartsGaugeMetricsGaugeChartsGetResponse
                                                                    .jsonBody,
                                                              )!,
                                                              fit: BoxFit.cover,
                                                              errorBuilder: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  Image.asset(
                                                                'assets/images/error_image.jpg',
                                                                fit: BoxFit
                                                                    .cover,
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
                                                            'gender':
                                                                serializeParam(
                                                              NewAPIsGroup
                                                                  .getMyProfileClientsMeGetCall
                                                                  .gender(
                                                                listViewGetMyProfileClientsMeGetResponse
                                                                    .jsonBody,
                                                              ),
                                                              ParamType.String,
                                                            ),
                                                            'age':
                                                                serializeParam(
                                                              functions.calculateAgeFromDate(
                                                                  NewAPIsGroup
                                                                      .getMyProfileClientsMeGetCall
                                                                      .dob(
                                                                listViewGetMyProfileClientsMeGetResponse
                                                                    .jsonBody,
                                                              )!),
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '6ic52eyp' /* View Details */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFF7E57C2),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 16.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 24.0)),
                                      );
                                    },
                                  ),
                                ),
                              if (!(NewAPIsGroup.listMetricsMetricsGetCall.id(
                                        listViewListMetricsMetricsGetResponse
                                            .jsonBody,
                                      ) !=
                                      null &&
                                  (NewAPIsGroup.listMetricsMetricsGetCall.id(
                                    listViewListMetricsMetricsGetResponse
                                        .jsonBody,
                                  ))!
                                      .isNotEmpty))
                                Container(
                                  height: 300.0,
                                  constraints: BoxConstraints(
                                    maxWidth: 600.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: wrapWithModel(
                                      model: _model.noDataAvailableModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: NoDataAvailableWidget(),
                                    ),
                                  ),
                                ),
                            ].divide(SizedBox(height: 15.0)),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

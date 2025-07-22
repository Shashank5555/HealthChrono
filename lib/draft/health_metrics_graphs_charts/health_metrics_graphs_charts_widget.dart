import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'health_metrics_graphs_charts_model.dart';
export 'health_metrics_graphs_charts_model.dart';

class HealthMetricsGraphsChartsWidget extends StatefulWidget {
  const HealthMetricsGraphsChartsWidget({
    super.key,
    required this.metricName,
    this.userID,
  });

  final String? metricName;
  final int? userID;

  static String routeName = 'HealthMetricsGraphsCharts';
  static String routePath = '/healthMetricsGraphsCharts';

  @override
  State<HealthMetricsGraphsChartsWidget> createState() =>
      _HealthMetricsGraphsChartsWidgetState();
}

class _HealthMetricsGraphsChartsWidgetState
    extends State<HealthMetricsGraphsChartsWidget> {
  late HealthMetricsGraphsChartsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthMetricsGraphsChartsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                            context.safePop();
                          },
                        ),
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '84i3kfe1' /* Health Trends */,
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
                          'l50uupya' /* Your health data trends at a g... */,
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 600.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '7no9x0y0' /* Date Range */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .headlineSmallIsCustom,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'xo4wl5uw' /* Start Date */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        final _datePicked1Date =
                                                            await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              getCurrentTimestamp,
                                                          firstDate:
                                                              DateTime(1900),
                                                          lastDate:
                                                              (getCurrentTimestamp ??
                                                                  DateTime(
                                                                      2050)),
                                                          builder:
                                                              (context, child) {
                                                            return wrapInMaterialDatePickerTheme(
                                                              context,
                                                              child!,
                                                              headerBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              headerForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              headerTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                        fontSize:
                                                                            32.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).headlineLargeIsCustom,
                                                                      ),
                                                              pickerBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              pickerForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              selectedDateTimeBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              selectedDateTimeForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              actionButtonForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              iconSize: 24.0,
                                                            );
                                                          },
                                                        );

                                                        if (_datePicked1Date !=
                                                            null) {
                                                          safeSetState(() {
                                                            _model.datePicked1 =
                                                                DateTime(
                                                              _datePicked1Date
                                                                  .year,
                                                              _datePicked1Date
                                                                  .month,
                                                              _datePicked1Date
                                                                  .day,
                                                            );
                                                          });
                                                        } else if (_model
                                                                .datePicked1 !=
                                                            null) {
                                                          safeSetState(() {
                                                            _model.datePicked1 =
                                                                getCurrentTimestamp;
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      12.0,
                                                                      4.0,
                                                                      12.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .datePicked1,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  'Choose Start Date',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'q0edx1fi' /* End Date */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        final _datePicked2Date =
                                                            await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              getCurrentTimestamp,
                                                          firstDate:
                                                              DateTime(1900),
                                                          lastDate:
                                                              getCurrentTimestamp,
                                                          builder:
                                                              (context, child) {
                                                            return wrapInMaterialDatePickerTheme(
                                                              context,
                                                              child!,
                                                              headerBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              headerForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              headerTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                        fontSize:
                                                                            32.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).headlineLargeIsCustom,
                                                                      ),
                                                              pickerBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              pickerForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              selectedDateTimeBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              selectedDateTimeForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              actionButtonForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              iconSize: 24.0,
                                                            );
                                                          },
                                                        );

                                                        if (_datePicked2Date !=
                                                            null) {
                                                          safeSetState(() {
                                                            _model.datePicked2 =
                                                                DateTime(
                                                              _datePicked2Date
                                                                  .year,
                                                              _datePicked2Date
                                                                  .month,
                                                              _datePicked2Date
                                                                  .day,
                                                            );
                                                          });
                                                        } else if (_model
                                                                .datePicked2 !=
                                                            null) {
                                                          safeSetState(() {
                                                            _model.datePicked2 =
                                                                getCurrentTimestamp;
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      12.0,
                                                                      6.0,
                                                                      12.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .datePicked2,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  'Choose End Date',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 6.0)),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          _model.startDate = dateTimeFormat(
                                            "yyyy-MM-dd",
                                            _model.datePicked1,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          );
                                          _model.endDate = dateTimeFormat(
                                            "yyyy-MM-dd",
                                            _model.datePicked2,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          );
                                          FFAppState().clearScatterPlotsCache();
                                          safeSetState(() => _model
                                              .apiRequestCompleter2 = null);
                                          await _model
                                              .waitForApiRequestCompleted2();
                                          safeSetState(() => _model
                                              .apiRequestCompleter1 = null);
                                          await _model
                                              .waitForApiRequestCompleted1();
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'o14he3sg' /* Generate */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 95.0,
                                          height: 35.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ),
                                    ].addToEnd(SizedBox(height: 15.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 5.0, 24.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            widget.metricName,
                                            'Metric Name',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmallIsCustom,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'j9rdauoo' /* Overview */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              () {
                                                if (_model.choiceChipsValue ==
                                                    'Today') {
                                                  return 'This Day';
                                                } else if (_model
                                                        .choiceChipsValue ==
                                                    'Week') {
                                                  return 'Last 7 Days';
                                                } else if (_model
                                                        .choiceChipsValue ==
                                                    'Month') {
                                                  return 'Last 30 Days';
                                                } else if (_model
                                                        .choiceChipsValue ==
                                                    'Year') {
                                                  return 'Last 365 Days';
                                                } else {
                                                  return 'Everything';
                                                }
                                              }(),
                                              'Year',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallIsCustom,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${_model.startDate} - ${_model.endDate}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FlutterFlowChoiceChips(
                                            options: [
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '68nb91by' /* Today */,
                                              )),
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '5bsfdxew' /* Week */,
                                              )),
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'ntd2e19a' /* Month */,
                                              )),
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '2iq1f8l6' /* Year */,
                                              )),
                                              ChipData(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'qxtc9rzz' /* All */,
                                              ))
                                            ],
                                            onChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.choiceChipsValue =
                                                      val?.firstOrNull);
                                              _model.startDate =
                                                  functions.getStartDate(
                                                      _model.choiceChipsValue!);
                                              _model.endDate =
                                                  functions.getEndDate();
                                              safeSetState(() => _model
                                                  .apiRequestCompleter2 = null);
                                              await _model
                                                  .waitForApiRequestCompleted2();
                                              safeSetState(() => _model
                                                  .apiRequestCompleter1 = null);
                                              await _model
                                                  .waitForApiRequestCompleted1();
                                            },
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              iconSize: 18.0,
                                              labelPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 2.0, 10.0, 2.0),
                                              elevation: 1.0,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallIsCustom,
                                                  ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              iconSize: 18.0,
                                              labelPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 2.0, 10.0, 2.0),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            chipSpacing: 10.0,
                                            rowSpacing: 8.0,
                                            multiselect: false,
                                            initialized:
                                                _model.choiceChipsValue != null,
                                            alignment: WrapAlignment.center,
                                            controller: _model
                                                    .choiceChipsValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              [
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ex6c9336' /* Month */,
                                                )
                                              ],
                                            ),
                                            wrapped: false,
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                if (false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 2.0, 10.0, 2.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: (_model.apiRequestCompleter1 ??=
                                                Completer<ApiCallResponse>()
                                                  ..complete(HealthChronoAPIsGroup
                                                      .displayScatterPlotsCall
                                                      .call(
                                                    token: FFAppState()
                                                        .loginAccessToken,
                                                    startDate: _model.startDate,
                                                    endDate: _model.endDate,
                                                    userId: widget.userID ==
                                                            null
                                                        ? valueOrDefault<int>(
                                                            null,
                                                            6,
                                                          )
                                                        : widget.userID,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 40.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewDateRangeDisplayScatterPlotsResponse =
                                              snapshot.data!;

                                          return ListView(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              if (listViewDateRangeDisplayScatterPlotsResponse
                                                  .succeeded)
                                                Container(
                                                  decoration: BoxDecoration(),
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
                                                              () {
                                                                if (widget
                                                                        .metricName ==
                                                                    'Heart Rate') {
                                                                  return HealthChronoAPIsGroup
                                                                      .displayScatterPlotsCall
                                                                      .heartRate(
                                                                    listViewDateRangeDisplayScatterPlotsResponse
                                                                        .jsonBody,
                                                                  )!;
                                                                } else if (widget
                                                                        .metricName ==
                                                                    'Blood Pressure') {
                                                                  return HealthChronoAPIsGroup
                                                                      .displayScatterPlotsCall
                                                                      .bp(
                                                                    listViewDateRangeDisplayScatterPlotsResponse
                                                                        .jsonBody,
                                                                  )!;
                                                                } else if (widget
                                                                        .metricName ==
                                                                    'BMI') {
                                                                  return HealthChronoAPIsGroup
                                                                      .displayScatterPlotsCall
                                                                      .bmi(
                                                                    listViewDateRangeDisplayScatterPlotsResponse
                                                                        .jsonBody,
                                                                  )!;
                                                                } else if (widget
                                                                        .metricName ==
                                                                    'Waist to Hip Ratio') {
                                                                  return HealthChronoAPIsGroup
                                                                      .displayScatterPlotsCall
                                                                      .waistToHip(
                                                                    listViewDateRangeDisplayScatterPlotsResponse
                                                                        .jsonBody,
                                                                  )!;
                                                                } else {
                                                                  return HealthChronoAPIsGroup
                                                                      .displayScatterPlotsCall
                                                                      .waistToHeight(
                                                                    listViewDateRangeDisplayScatterPlotsResponse
                                                                        .jsonBody,
                                                                  )!;
                                                                }
                                                              }(),
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
                                                            allowRotation: true,
                                                            useHeroAnimation:
                                                                false,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.network(
                                                        () {
                                                          if (widget
                                                                  .metricName ==
                                                              'Heart Rate') {
                                                            return HealthChronoAPIsGroup
                                                                .displayScatterPlotsCall
                                                                .heartRate(
                                                              listViewDateRangeDisplayScatterPlotsResponse
                                                                  .jsonBody,
                                                            )!;
                                                          } else if (widget
                                                                  .metricName ==
                                                              'Blood Pressure') {
                                                            return HealthChronoAPIsGroup
                                                                .displayScatterPlotsCall
                                                                .bp(
                                                              listViewDateRangeDisplayScatterPlotsResponse
                                                                  .jsonBody,
                                                            )!;
                                                          } else if (widget
                                                                  .metricName ==
                                                              'BMI') {
                                                            return HealthChronoAPIsGroup
                                                                .displayScatterPlotsCall
                                                                .bmi(
                                                              listViewDateRangeDisplayScatterPlotsResponse
                                                                  .jsonBody,
                                                            )!;
                                                          } else if (widget
                                                                  .metricName ==
                                                              'Waist to Hip Ratio') {
                                                            return HealthChronoAPIsGroup
                                                                .displayScatterPlotsCall
                                                                .waistToHip(
                                                              listViewDateRangeDisplayScatterPlotsResponse
                                                                  .jsonBody,
                                                            )!;
                                                          } else {
                                                            return HealthChronoAPIsGroup
                                                                .displayScatterPlotsCall
                                                                .waistToHeight(
                                                              listViewDateRangeDisplayScatterPlotsResponse
                                                                  .jsonBody,
                                                            )!;
                                                          }
                                                        }(),
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.jpg',
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (!listViewDateRangeDisplayScatterPlotsResponse
                                                  .succeeded)
                                                Container(
                                                  height: 300.0,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 600.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .noDataAvailableModel1,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        NoDataAvailableWidget(),
                                                  ),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 2.0, 10.0, 2.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: (_model.apiRequestCompleter2 ??=
                                              Completer<ApiCallResponse>()
                                                ..complete(GraphCall.call(
                                                  startDate: _model.startDate,
                                                  endDate: _model.endDate,
                                                  metricName: 'weight',
                                                  accessToken:
                                                      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJzYWlzaGFzaGFuazAwNUBnbWFpbC5jb20iLCJyb2xlIjoidXNlciIsImV4cCI6MTczODI2MzQ0OH0.SzRP-pG0flbK--mzyg5eDCKev8Js_gFgqTcckym-zbo',
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
                                        final listViewChartGraphResponse =
                                            snapshot.data!;

                                        return ListView(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            if (listViewChartGraphResponse
                                                .succeeded)
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Container(
                                                  height: 270.0,
                                                  child: FlutterFlowLineChart(
                                                    data: [
                                                      FFLineChartData(
                                                        xData: GraphCall.xAxis(
                                                          listViewChartGraphResponse
                                                              .jsonBody,
                                                        )!,
                                                        yData: GraphCall.yAxis(
                                                          listViewChartGraphResponse
                                                              .jsonBody,
                                                        )!,
                                                        settings:
                                                            LineChartBarData(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          barWidth: 2.0,
                                                          isCurved: true,
                                                          preventCurveOverShooting:
                                                              true,
                                                          belowBarData:
                                                              BarAreaData(
                                                            show: true,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                    chartStylingInfo:
                                                        ChartStylingInfo(
                                                      enableTooltip: true,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      showGrid: true,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      borderWidth: 1.0,
                                                    ),
                                                    axisBounds: AxisBounds(),
                                                    xAxisLabelInfo:
                                                        AxisLabelInfo(
                                                      title: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'tmcshe34' /* Date */,
                                                      ),
                                                      titleTextStyle: TextStyle(
                                                        fontSize: 14.0,
                                                      ),
                                                      showLabels: true,
                                                      labelInterval: 10.0,
                                                      reservedSize: 32.0,
                                                    ),
                                                    yAxisLabelInfo:
                                                        AxisLabelInfo(
                                                      title: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'bc8c8mnm' /* Value */,
                                                      ),
                                                      titleTextStyle: TextStyle(
                                                        fontSize: 14.0,
                                                      ),
                                                      showLabels: true,
                                                      labelInterval: 10.0,
                                                      labelFormatter:
                                                          LabelFormatter(
                                                        numberFormat: (val) =>
                                                            val.toString(),
                                                      ),
                                                      reservedSize: 40.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (!listViewChartGraphResponse
                                                .succeeded)
                                              Container(
                                                height: 300.0,
                                                constraints: BoxConstraints(
                                                  maxWidth: 600.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .noDataAvailableModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      NoDataAvailableWidget(),
                                                ),
                                              ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 16.0))
                                  .addToStart(SizedBox(height: 5.0))
                                  .addToEnd(SizedBox(height: 10.0)),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 15.0)),
                  ),
                ),
              ),
            ]
                .addToStart(SizedBox(height: 10.0))
                .addToEnd(SizedBox(height: 30.0)),
          ),
        ),
      ),
    );
  }
}

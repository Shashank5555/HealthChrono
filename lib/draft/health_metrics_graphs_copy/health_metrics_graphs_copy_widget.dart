import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'health_metrics_graphs_copy_model.dart';
export 'health_metrics_graphs_copy_model.dart';

class HealthMetricsGraphsCopyWidget extends StatefulWidget {
  const HealthMetricsGraphsCopyWidget({
    super.key,
    required this.metricName,
    this.userID,
  });

  final String? metricName;
  final int? userID;

  static String routeName = 'HealthMetricsGraphsCopy';
  static String routePath = '/healthMetricsGraphsCopy';

  @override
  State<HealthMetricsGraphsCopyWidget> createState() =>
      _HealthMetricsGraphsCopyWidgetState();
}

class _HealthMetricsGraphsCopyWidgetState
    extends State<HealthMetricsGraphsCopyWidget> {
  late HealthMetricsGraphsCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthMetricsGraphsCopyModel());

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
                              'coqygtir' /* Health Trends */,
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
                          'wtttq684' /* Your health data trends at a g... */,
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
              centerTitle: false,
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
                                        'xesgtfs3' /* Date Range */,
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
                                                          'ji69feln' /* Start Date */,
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
                                                          'bhgzftpf' /* End Date */,
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
                                          safeSetState(() {
                                            _model.choiceChipsValueController
                                                ?.reset();
                                          });
                                          safeSetState(() => _model
                                              .apiRequestCompleter1 = null);
                                          await _model
                                              .waitForApiRequestCompleted1();
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'cnnrh9uf' /* Generate */,
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
                            child: FutureBuilder<ApiCallResponse>(
                              future: HealthChronoAPIsGroup
                                  .displayScatterPlotsCall
                                  .call(
                                token: FFAppState().loginAccessToken,
                                startDate: _model.choiceChipsValue == null ||
                                        _model.choiceChipsValue == ''
                                    ? dateTimeFormat(
                                        "yyyy-MM-dd",
                                        _model.datePicked1,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )
                                    : functions
                                        .getStartDate(_model.choiceChipsValue!),
                                endDate: _model.choiceChipsValue == null ||
                                        _model.choiceChipsValue == ''
                                    ? dateTimeFormat(
                                        "yyyy-MM-dd",
                                        _model.datePicked2,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )
                                    : functions.getEndDate(),
                                userId: widget.userID == null
                                    ? null
                                    : widget.userID,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                final listViewDisplayScatterPlotsResponse =
                                    snapshot.data!;

                                return ListView(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    5.0,
                                    0,
                                    10.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmallIsCustom,
                                                      ),
                                            ),
                                            Text(
                                              () {
                                                if (_model.choiceChipsValue ==
                                                    'Today') {
                                                  return 'Today\'s Overview';
                                                } else if (_model
                                                        .choiceChipsValue ==
                                                    'Week') {
                                                  return 'Weekly Overview';
                                                } else if (_model
                                                        .choiceChipsValue ==
                                                    'Month') {
                                                  return 'Monthly Overview';
                                                } else if (_model
                                                        .choiceChipsValue ==
                                                    'Year') {
                                                  return 'Yearly Overview';
                                                } else {
                                                  return 'Overview';
                                                }
                                              }(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
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
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 2.0, 10.0, 2.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: (_model
                                                      .apiRequestCompleter1 ??=
                                                  Completer<ApiCallResponse>()
                                                    ..complete(HealthChronoAPIsGroup
                                                        .displayScatterPlotsCall
                                                        .call(
                                                      token: FFAppState()
                                                          .loginAccessToken,
                                                      startDate: dateTimeFormat(
                                                        "yyyy-MM-dd",
                                                        _model.datePicked1,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      endDate: dateTimeFormat(
                                                        "yyyy-MM-dd",
                                                        _model.datePicked2,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
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
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child:
                                                            FlutterFlowExpandedImageView(
                                                          image: Image.network(
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
                                                            fit: BoxFit.contain,
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
                                                      fit: BoxFit.fill,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.jpg',
                                                        width: double.infinity,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
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
                                                  ChipData(FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'n8xr0trb' /* Today */,
                                                  )),
                                                  ChipData(FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'w8x5rm49' /* Week */,
                                                  )),
                                                  ChipData(FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'f0doj2go' /* Month */,
                                                  )),
                                                  ChipData(FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'dkejec32' /* Year */,
                                                  )),
                                                  ChipData(FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'tsm3le0v' /* All */,
                                                  ))
                                                ],
                                                onChanged: (val) async {
                                                  safeSetState(() =>
                                                      _model.choiceChipsValue =
                                                          val?.firstOrNull);
                                                  _model.startDate = functions
                                                      .getStartDate(_model
                                                          .choiceChipsValue!);
                                                  _model.endDate =
                                                      functions.getEndDate();
                                                  safeSetState(() => _model
                                                          .apiRequestCompleter2 =
                                                      null);
                                                  await _model
                                                      .waitForApiRequestCompleted2();
                                                },
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
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
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 18.0,
                                                  labelPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(10.0, 2.0,
                                                              10.0, 2.0),
                                                  elevation: 1.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallIsCustom,
                                                          ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 18.0,
                                                  labelPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(10.0, 2.0,
                                                              10.0, 2.0),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                chipSpacing: 10.0,
                                                rowSpacing: 8.0,
                                                multiselect: false,
                                                alignment: WrapAlignment.center,
                                                controller: _model
                                                        .choiceChipsValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  [],
                                                ),
                                                wrapped: false,
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            functions.getStartDate(
                                                _model.choiceChipsValue!),
                                            'Start Date',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'npvn1md1' /* - */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            functions.getEndDate(),
                                            'End Date',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 240.0,
                                        decoration: BoxDecoration(),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: (_model
                                                      .apiRequestCompleter2 ??=
                                                  Completer<ApiCallResponse>()
                                                    ..complete(HealthChronoAPIsGroup
                                                        .displayScatterPlotsCall
                                                        .call(
                                                      token: FFAppState()
                                                          .loginAccessToken,
                                                      startDate: functions
                                                          .getStartDate(_model
                                                              .choiceChipsValue!),
                                                      endDate: functions
                                                          .getEndDate(),
                                                      userId:
                                                          widget.userID == null
                                                              ? null
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
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final listViewChoiceChipDisplayScatterPlotsResponse =
                                                snapshot.data!;

                                            return ListView(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              children: [
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
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child:
                                                            FlutterFlowExpandedImageView(
                                                          image: Image.network(
                                                            () {
                                                              if (widget
                                                                      .metricName ==
                                                                  'Heart Rate') {
                                                                return HealthChronoAPIsGroup
                                                                    .displayScatterPlotsCall
                                                                    .heartRate(
                                                                  listViewChoiceChipDisplayScatterPlotsResponse
                                                                      .jsonBody,
                                                                )!;
                                                              } else if (widget
                                                                      .metricName ==
                                                                  'Blood Pressure') {
                                                                return HealthChronoAPIsGroup
                                                                    .displayScatterPlotsCall
                                                                    .bp(
                                                                  listViewChoiceChipDisplayScatterPlotsResponse
                                                                      .jsonBody,
                                                                )!;
                                                              } else if (widget
                                                                      .metricName ==
                                                                  'BMI') {
                                                                return HealthChronoAPIsGroup
                                                                    .displayScatterPlotsCall
                                                                    .bmi(
                                                                  listViewChoiceChipDisplayScatterPlotsResponse
                                                                      .jsonBody,
                                                                )!;
                                                              } else if (widget
                                                                      .metricName ==
                                                                  'Waist to Hip Ratio') {
                                                                return HealthChronoAPIsGroup
                                                                    .displayScatterPlotsCall
                                                                    .waistToHip(
                                                                  listViewChoiceChipDisplayScatterPlotsResponse
                                                                      .jsonBody,
                                                                )!;
                                                              } else {
                                                                return HealthChronoAPIsGroup
                                                                    .displayScatterPlotsCall
                                                                    .waistToHeight(
                                                                  listViewChoiceChipDisplayScatterPlotsResponse
                                                                      .jsonBody,
                                                                )!;
                                                              }
                                                            }(),
                                                            fit: BoxFit.contain,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpg',
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                          allowRotation: false,
                                                          tag: () {
                                                            if (widget
                                                                    .metricName ==
                                                                'Heart Rate') {
                                                              return HealthChronoAPIsGroup
                                                                  .displayScatterPlotsCall
                                                                  .heartRate(
                                                                listViewChoiceChipDisplayScatterPlotsResponse
                                                                    .jsonBody,
                                                              )!;
                                                            } else if (widget
                                                                    .metricName ==
                                                                'Blood Pressure') {
                                                              return HealthChronoAPIsGroup
                                                                  .displayScatterPlotsCall
                                                                  .bp(
                                                                listViewChoiceChipDisplayScatterPlotsResponse
                                                                    .jsonBody,
                                                              )!;
                                                            } else if (widget
                                                                    .metricName ==
                                                                'BMI') {
                                                              return HealthChronoAPIsGroup
                                                                  .displayScatterPlotsCall
                                                                  .bmi(
                                                                listViewChoiceChipDisplayScatterPlotsResponse
                                                                    .jsonBody,
                                                              )!;
                                                            } else if (widget
                                                                    .metricName ==
                                                                'Waist to Hip Ratio') {
                                                              return HealthChronoAPIsGroup
                                                                  .displayScatterPlotsCall
                                                                  .waistToHip(
                                                                listViewChoiceChipDisplayScatterPlotsResponse
                                                                    .jsonBody,
                                                              )!;
                                                            } else {
                                                              return HealthChronoAPIsGroup
                                                                  .displayScatterPlotsCall
                                                                  .waistToHeight(
                                                                listViewChoiceChipDisplayScatterPlotsResponse
                                                                    .jsonBody,
                                                              )!;
                                                            }
                                                          }(),
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: () {
                                                      if (widget.metricName ==
                                                          'Heart Rate') {
                                                        return HealthChronoAPIsGroup
                                                            .displayScatterPlotsCall
                                                            .heartRate(
                                                          listViewChoiceChipDisplayScatterPlotsResponse
                                                              .jsonBody,
                                                        )!;
                                                      } else if (widget
                                                              .metricName ==
                                                          'Blood Pressure') {
                                                        return HealthChronoAPIsGroup
                                                            .displayScatterPlotsCall
                                                            .bp(
                                                          listViewChoiceChipDisplayScatterPlotsResponse
                                                              .jsonBody,
                                                        )!;
                                                      } else if (widget
                                                              .metricName ==
                                                          'BMI') {
                                                        return HealthChronoAPIsGroup
                                                            .displayScatterPlotsCall
                                                            .bmi(
                                                          listViewChoiceChipDisplayScatterPlotsResponse
                                                              .jsonBody,
                                                        )!;
                                                      } else if (widget
                                                              .metricName ==
                                                          'Waist to Hip Ratio') {
                                                        return HealthChronoAPIsGroup
                                                            .displayScatterPlotsCall
                                                            .waistToHip(
                                                          listViewChoiceChipDisplayScatterPlotsResponse
                                                              .jsonBody,
                                                        )!;
                                                      } else {
                                                        return HealthChronoAPIsGroup
                                                            .displayScatterPlotsCall
                                                            .waistToHeight(
                                                          listViewChoiceChipDisplayScatterPlotsResponse
                                                              .jsonBody,
                                                        )!;
                                                      }
                                                    }(),
                                                    transitionOnUserGestures:
                                                        true,
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
                                                              listViewChoiceChipDisplayScatterPlotsResponse
                                                                  .jsonBody,
                                                            )!;
                                                          } else if (widget
                                                                  .metricName ==
                                                              'Blood Pressure') {
                                                            return HealthChronoAPIsGroup
                                                                .displayScatterPlotsCall
                                                                .bp(
                                                              listViewChoiceChipDisplayScatterPlotsResponse
                                                                  .jsonBody,
                                                            )!;
                                                          } else if (widget
                                                                  .metricName ==
                                                              'BMI') {
                                                            return HealthChronoAPIsGroup
                                                                .displayScatterPlotsCall
                                                                .bmi(
                                                              listViewChoiceChipDisplayScatterPlotsResponse
                                                                  .jsonBody,
                                                            )!;
                                                          } else if (widget
                                                                  .metricName ==
                                                              'Waist to Hip Ratio') {
                                                            return HealthChronoAPIsGroup
                                                                .displayScatterPlotsCall
                                                                .waistToHip(
                                                              listViewChoiceChipDisplayScatterPlotsResponse
                                                                  .jsonBody,
                                                            )!;
                                                          } else {
                                                            return HealthChronoAPIsGroup
                                                                .displayScatterPlotsCall
                                                                .waistToHeight(
                                                              listViewChoiceChipDisplayScatterPlotsResponse
                                                                  .jsonBody,
                                                            )!;
                                                          }
                                                        }(),
                                                        width: double.infinity,
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
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                );
                              },
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

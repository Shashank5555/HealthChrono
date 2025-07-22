import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'health_metrics_graphs_model.dart';
export 'health_metrics_graphs_model.dart';

class HealthMetricsGraphsWidget extends StatefulWidget {
  const HealthMetricsGraphsWidget({
    super.key,
    required this.metricName,
    this.userID,
    this.email,
    required this.gender,
    required this.age,
  });

  final String? metricName;
  final String? userID;
  final String? email;
  final String? gender;
  final int? age;

  static String routeName = 'HealthMetricsGraphs';
  static String routePath = '/healthMetricsGraphs';

  @override
  State<HealthMetricsGraphsWidget> createState() =>
      _HealthMetricsGraphsWidgetState();
}

class _HealthMetricsGraphsWidgetState extends State<HealthMetricsGraphsWidget> {
  late HealthMetricsGraphsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthMetricsGraphsModel());

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
                            context.safePop();
                          },
                        ),
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'jf0skfxu' /* Health Trends */,
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
                          '76mogb5t' /* Your health data trends at a g... */,
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
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: ListView(
            padding: EdgeInsets.fromLTRB(
              0,
              10.0,
              0,
              30.0,
            ),
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
                                        'f47fvik5' /* Date Range */,
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
                                                          'p9x0ckot' /* Start Date */,
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
                                                        _model.startDate =
                                                            dateTimeFormat(
                                                          "yyyy-MM-dd",
                                                          _model.datePicked1,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        );
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
                                                          'j7vbul21' /* End Date */,
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
                                                        _model.endDate =
                                                            dateTimeFormat(
                                                          "yyyy-MM-dd",
                                                          _model.datePicked2,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        );
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: Wrap(
                                          spacing: 10.0,
                                          runSpacing: 5.0,
                                          alignment: WrapAlignment.center,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: FFButtonWidget(
                                                onPressed: ((_model.startDate !=
                                                                    null &&
                                                                _model.startDate !=
                                                                    '') &&
                                                            (_model.endDate !=
                                                                    null &&
                                                                _model.endDate !=
                                                                    '')
                                                        ? false
                                                        : true)
                                                    ? null
                                                    : () async {
                                                        safeSetState(() {
                                                          _model
                                                              .choiceChipsValueController
                                                              ?.reset();
                                                        });
                                                        _model.isGenerateClicked =
                                                            true;
                                                        safeSetState(() => _model
                                                                .apiRequestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForApiRequestCompleted();
                                                      },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'vmkax24x' /* Generate */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 95.0,
                                                  height: 35.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
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
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  disabledColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Visibility(
                                                visible: !isWeb,
                                                child: FFButtonWidget(
                                                  onPressed: ((_model.startDate !=
                                                                      null &&
                                                                  _model.startDate !=
                                                                      '') &&
                                                              (_model.endDate !=
                                                                      null &&
                                                                  _model.endDate !=
                                                                      '')
                                                          ? false
                                                          : true)
                                                      ? null
                                                      : () async {
                                                          _model.generateReport =
                                                              await NewAPIsGroup
                                                                  .generatePdfReportPdfGeneratePdfReportGetCall
                                                                  .call(
                                                            xAccessToken:
                                                                currentAuthenticationToken,
                                                            startDate: _model
                                                                .startDate,
                                                            endDate:
                                                                _model.endDate,
                                                            clientIdentifier:
                                                                widget.email,
                                                          );

                                                          if ((_model
                                                                  .generateReport
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await downloadFile(
                                                              filename:
                                                                  valueOrDefault<
                                                                      String>(
                                                                NewAPIsGroup
                                                                    .generatePdfReportPdfGeneratePdfReportGetCall
                                                                    .fileName(
                                                                  (_model.generateReport
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                'health_report.pdf',
                                                              ),
                                                              url:
                                                                  valueOrDefault<
                                                                      String>(
                                                                NewAPIsGroup
                                                                    .generatePdfReportPdfGeneratePdfReportGetCall
                                                                    .downloadURL(
                                                                  (_model.generateReport
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                '0',
                                                              ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .clearSnackBars();
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Report downloaded successfully...',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        2500),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                              ),
                                                            );
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .clearSnackBars();
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  getJsonField(
                                                                    (_model.generateReport
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.detail''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        2500),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                              ),
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'kpfymf7l' /* Download */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 95.0,
                                                    height: 35.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
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
                                                    disabledColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Visibility(
                                                visible: valueOrDefault<bool>(
                                                  isWeb,
                                                  false,
                                                ),
                                                child: FFButtonWidget(
                                                  onPressed: ((_model.startDate !=
                                                                      null &&
                                                                  _model.startDate !=
                                                                      '') &&
                                                              (_model.endDate !=
                                                                      null &&
                                                                  _model.endDate !=
                                                                      '')
                                                          ? false
                                                          : true)
                                                      ? null
                                                      : () async {
                                                          _model.generateReportWeb =
                                                              await NewAPIsGroup
                                                                  .generatePdfReportPdfGeneratePdfReportGetCall
                                                                  .call(
                                                            xAccessToken:
                                                                currentAuthenticationToken,
                                                            startDate: _model
                                                                .startDate,
                                                            endDate:
                                                                _model.endDate,
                                                            clientIdentifier:
                                                                widget.email,
                                                          );

                                                          if ((_model
                                                                  .generateReportWeb
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await launchURL(
                                                                NewAPIsGroup
                                                                    .generatePdfReportPdfGeneratePdfReportGetCall
                                                                    .downloadURL(
                                                              (_model.generateReportWeb
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!);
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .clearSnackBars();
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Report downloaded successfully...',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        2500),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                              ),
                                                            );
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .clearSnackBars();
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  getJsonField(
                                                                    (_model.generateReportWeb
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.detail''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        2500),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                              ),
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    't2926v16' /* Download */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 95.0,
                                                    height: 35.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
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
                                                    disabledColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
                                            '8rsk10un' /* Overview */,
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
                                                  return 'Last 30 Days';
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
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: Color(0xFFB8CCDA),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: FlutterFlowChoiceChips(
                                              options: [
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'u66qx3eq' /* Today */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '3nrqmdbw' /* Week */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'k0l2njln' /* Month */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'en6hm5zb' /* Year */,
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
                                                safeSetState(() =>
                                                    _model.apiRequestCompleter =
                                                        null);
                                                await _model
                                                    .waitForApiRequestCompleted();
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
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                        .fromSTEB(10.0, 1.0,
                                                            10.0, 1.0),
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
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                        .fromSTEB(10.0, 1.0,
                                                            10.0, 1.0),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
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
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (() {
                                      if (_model.choiceChipsValue != null &&
                                          _model.choiceChipsValue != '') {
                                        return true;
                                      } else if ((_model.startDate != null &&
                                              _model.startDate != '') &&
                                          (_model.endDate != null &&
                                              _model.endDate != '') &&
                                          _model.isGenerateClicked) {
                                        return true;
                                      } else {
                                        return false;
                                      }
                                    }())
                                      Text(
                                        '${functions.changeDateFormat(_model.startDate!)} - ${functions.changeDateFormat(_model.endDate!)}',
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
                                  decoration: BoxDecoration(),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: (_model.apiRequestCompleter ??=
                                            Completer<ApiCallResponse>()
                                              ..complete(NewAPIsGroup
                                                  .syncfusionCall
                                                  .call(
                                                xAccessToken:
                                                    currentAuthenticationToken,
                                                metricName: () {
                                                  if (widget.metricName ==
                                                      'Heart Rate') {
                                                    return 'heart_rate';
                                                  } else if (widget
                                                          .metricName ==
                                                      'BMI') {
                                                    return 'bmi';
                                                  } else if (widget
                                                          .metricName ==
                                                      'Waist to Height Ratio') {
                                                    return 'waist_to_height_ratio';
                                                  } else if (widget
                                                          .metricName ==
                                                      'Waist to Hip Ratio') {
                                                    return 'waist_to_hip_ratio';
                                                  } else {
                                                    return 'weight_kg';
                                                  }
                                                }(),
                                                startDate: _model.startDate !=
                                                            null &&
                                                        _model.startDate != ''
                                                    ? _model.startDate
                                                    : functions
                                                        .getStartDate('month'),
                                                endDate: _model.endDate !=
                                                            null &&
                                                        _model.endDate != ''
                                                    ? _model.endDate
                                                    : functions.getEndDate(),
                                                clientIdentifier:
                                                    widget.email != null &&
                                                            widget.email != ''
                                                        ? widget.email
                                                        : '',
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
                                      final syncFusionListViewSyncfusionResponse =
                                          snapshot.data!;

                                      return ListView(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          if (syncFusionListViewSyncfusionResponse
                                                  .succeeded &&
                                              (widget.metricName !=
                                                  'Blood Pressure'))
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 300.0,
                                                  child: custom_widgets
                                                      .MetricChart(
                                                    width: double.infinity,
                                                    height: 300.0,
                                                    xData: NewAPIsGroup
                                                        .syncfusionCall
                                                        .xAxis(
                                                      syncFusionListViewSyncfusionResponse
                                                          .jsonBody,
                                                    )!,
                                                    yData: NewAPIsGroup
                                                        .syncfusionCall
                                                        .yAxis(
                                                      syncFusionListViewSyncfusionResponse
                                                          .jsonBody,
                                                    )!,
                                                    metric: () {
                                                      if (widget.metricName ==
                                                          'Heart Rate') {
                                                        return 'heart_rate';
                                                      } else if (widget
                                                              .metricName ==
                                                          'BMI') {
                                                        return 'bmi';
                                                      } else if (widget
                                                              .metricName ==
                                                          'Waist to Height Ratio') {
                                                        return 'waist_to_height_ratio';
                                                      } else if (widget
                                                              .metricName ==
                                                          'Waist to Hip Ratio') {
                                                        return 'waist_to_hip_ratio';
                                                      } else {
                                                        return 'weight_kg';
                                                      }
                                                    }(),
                                                    gender: (widget.gender!)
                                                        .toLowerCase(),
                                                    age: widget.age!,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (syncFusionListViewSyncfusionResponse
                                                  .succeeded &&
                                              (widget.metricName ==
                                                  'Blood Pressure'))
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Container(
                                                width: double.infinity,
                                                height: 336.0,
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
                                                              'sqgpgu4v' /* Systolic Blood Pressure */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 300.0,
                                                              child: custom_widgets
                                                                  .MetricChart(
                                                                width: double
                                                                    .infinity,
                                                                height: 300.0,
                                                                xData: NewAPIsGroup
                                                                    .syncfusionCall
                                                                    .xAxis(
                                                                  syncFusionListViewSyncfusionResponse
                                                                      .jsonBody,
                                                                )!,
                                                                yData: NewAPIsGroup
                                                                    .syncfusionCall
                                                                    .yAxis(
                                                                  syncFusionListViewSyncfusionResponse
                                                                      .jsonBody,
                                                                )!,
                                                                metric: () {
                                                                  if (widget
                                                                          .metricName ==
                                                                      'Heart Rate') {
                                                                    return 'heart_rate';
                                                                  } else if (widget
                                                                          .metricName ==
                                                                      'BMI') {
                                                                    return 'bmi';
                                                                  } else if (widget
                                                                          .metricName ==
                                                                      'Waist to Height Ratio') {
                                                                    return 'waist_to_height_ratio';
                                                                  } else if (widget
                                                                          .metricName ==
                                                                      'Waist to Hip Ratio') {
                                                                    return 'waist_to_hip_ratio';
                                                                  } else if (widget
                                                                          .metricName ==
                                                                      'Blood Pressure') {
                                                                    return 'systolic_bp';
                                                                  } else {
                                                                    return 'weight_kg';
                                                                  }
                                                                }(),
                                                                gender: (widget
                                                                        .gender!)
                                                                    .toLowerCase(),
                                                                age: widget
                                                                    .age!,
                                                              ),
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
                                                              'x641f0fm' /* Diastolic Blood Pressure */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 300.0,
                                                              child: custom_widgets
                                                                  .MetricChart(
                                                                width: double
                                                                    .infinity,
                                                                height: 300.0,
                                                                xData: NewAPIsGroup
                                                                    .syncfusionCall
                                                                    .xAxis(
                                                                  syncFusionListViewSyncfusionResponse
                                                                      .jsonBody,
                                                                )!,
                                                                yData: NewAPIsGroup
                                                                    .syncfusionCall
                                                                    .yAxis(
                                                                  syncFusionListViewSyncfusionResponse
                                                                      .jsonBody,
                                                                )!,
                                                                metric: () {
                                                                  if (widget
                                                                          .metricName ==
                                                                      'Heart Rate') {
                                                                    return 'heart_rate';
                                                                  } else if (widget
                                                                          .metricName ==
                                                                      'BMI') {
                                                                    return 'bmi';
                                                                  } else if (widget
                                                                          .metricName ==
                                                                      'Waist to Height Ratio') {
                                                                    return 'waist_to_height_ratio';
                                                                  } else if (widget
                                                                          .metricName ==
                                                                      'Waist to Hip Ratio') {
                                                                    return 'waist_to_hip_ratio';
                                                                  } else if (widget
                                                                          .metricName ==
                                                                      'Blood Pressure') {
                                                                    return 'diastolic_bp';
                                                                  } else {
                                                                    return 'weight_kg';
                                                                  }
                                                                }(),
                                                                gender: (widget
                                                                        .gender!)
                                                                    .toLowerCase(),
                                                                age: widget
                                                                    .age!,
                                                              ),
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
                                                    enableInfiniteScroll: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    autoPlay: true,
                                                    autoPlayAnimationDuration:
                                                        Duration(
                                                            milliseconds: 2500),
                                                    autoPlayInterval: Duration(
                                                        milliseconds:
                                                            (2500 + 10000)),
                                                    autoPlayCurve:
                                                        Curves.linear,
                                                    pauseAutoPlayInFiniteScroll:
                                                        true,
                                                    onPageChanged: (index, _) =>
                                                        _model.carouselCurrentIndex =
                                                            index,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (!syncFusionListViewSyncfusionResponse
                                              .succeeded)
                                            Container(
                                              height: 300.0,
                                              constraints: BoxConstraints(
                                                maxWidth: 600.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: wrapWithModel(
                                                model:
                                                    _model.noDataAvailableModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: NoDataAvailableWidget(),
                                              ),
                                            ),
                                        ],
                                      );
                                    },
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
            ],
          ),
        ),
      ),
    );
  }
}

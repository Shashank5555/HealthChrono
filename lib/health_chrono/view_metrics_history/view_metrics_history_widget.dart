import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'view_metrics_history_model.dart';
export 'view_metrics_history_model.dart';

class ViewMetricsHistoryWidget extends StatefulWidget {
  const ViewMetricsHistoryWidget({
    super.key,
    this.email,
    this.selectedDate,
    required this.fromViewMetricsPage,
  });

  final String? email;
  final DateTime? selectedDate;
  final bool? fromViewMetricsPage;

  static String routeName = 'ViewMetricsHistory';
  static String routePath = '/viewMetricsHistory';

  @override
  State<ViewMetricsHistoryWidget> createState() =>
      _ViewMetricsHistoryWidgetState();
}

class _ViewMetricsHistoryWidgetState extends State<ViewMetricsHistoryWidget> {
  late ViewMetricsHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewMetricsHistoryModel());

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
        _model.metricDetailsByDate =
            await NewAPIsGroup.listMetricsMetricsGetCall.call(
          clientIdentifier: widget.email,
          xAccessToken: currentAuthenticationToken,
          fromDate: dateTimeFormat(
                        "yyyy-MM-dd",
                        widget.selectedDate,
                        locale: FFLocalizations.of(context).languageCode,
                      ) !=
                      ''
              ? dateTimeFormat(
                  "yyyy-MM-dd",
                  widget.selectedDate,
                  locale: FFLocalizations.of(context).languageCode,
                )
              : functions.getEndDate(),
          toDate: dateTimeFormat(
                        "yyyy-MM-dd",
                        widget.selectedDate,
                        locale: FFLocalizations.of(context).languageCode,
                      ) !=
                      ''
              ? dateTimeFormat(
                  "yyyy-MM-dd",
                  widget.selectedDate,
                  locale: FFLocalizations.of(context).languageCode,
                )
              : functions.getEndDate(),
        );

        if ((_model.metricDetailsByDate?.succeeded ?? true)) {
          _model.showNoDataAvailable = false;
          _model.draggedDown = false;
          safeSetState(() {});
        } else {
          _model.showNoDataAvailable = true;
          safeSetState(() {});
        }
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
                            if (widget.fromViewMetricsPage!) {
                              context.pushNamed(ViewMetricsWidget.routeName);
                            } else {
                              context.pushNamed(
                                ClientDetailsAtPractitionerSideWidget.routeName,
                                queryParameters: {
                                  'email': serializeParam(
                                    widget.email,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            }
                          },
                        ),
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'e2iwt4ys' /* View History */,
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
                          'ow4z96c3' /* View all your measurements */,
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
                  width: MediaQuery.sizeOf(context).width * 1.0,
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
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: (_model.apiRequestCompleter ??=
                              Completer<ApiCallResponse>()
                                ..complete(
                                    NewAPIsGroup.listMetricsMetricsGetCall.call(
                                  fromDate: dateTimeFormat(
                                    "yyyy-MM-dd",
                                    _model.calendarSelectedDay?.start,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  clientIdentifier: widget.email,
                                  xAccessToken: currentAuthenticationToken,
                                  toDate: dateTimeFormat(
                                    "yyyy-MM-dd",
                                    _model.calendarSelectedDay?.end,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
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
                            GestureDetector(
                              onVerticalDragDown: (details) async {
                                _model.draggedDown = true;
                                safeSetState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.2, 8.0, 5.2, 8.0),
                                  child: FlutterFlowCalendar(
                                    color: FlutterFlowTheme.of(context).primary,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    weekFormat:
                                        !(!listViewListMetricsMetricsGetResponse
                                                .succeeded ||
                                            _model.draggedDown),
                                    weekStartsMonday: false,
                                    rowHeight: 50.0,
                                    onChange:
                                        (DateTimeRange? newSelectedDate) async {
                                      if (_model.calendarSelectedDay ==
                                          newSelectedDate) {
                                        return;
                                      }
                                      _model.calendarSelectedDay =
                                          newSelectedDate;
                                      safeSetState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                      _model.metricsDetailsbyDateResponse =
                                          await NewAPIsGroup
                                              .listMetricsMetricsGetCall
                                              .call(
                                        toDate: dateTimeFormat(
                                          "yyyy-MM-dd",
                                          _model.calendarSelectedDay?.end,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        clientIdentifier: widget.email,
                                        xAccessToken:
                                            currentAuthenticationToken,
                                        fromDate: dateTimeFormat(
                                          "yyyy-MM-dd",
                                          _model.calendarSelectedDay?.start,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                      );

                                      if (NewAPIsGroup.listMetricsMetricsGetCall
                                                  .id(
                                                (_model.metricsDetailsbyDateResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              null &&
                                          (NewAPIsGroup
                                                  .listMetricsMetricsGetCall
                                                  .id(
                                            (_model.metricsDetailsbyDateResponse
                                                    ?.jsonBody ??
                                                ''),
                                          ))!
                                              .isNotEmpty) {
                                        _model.showNoDataAvailable = false;
                                        _model.draggedDown = false;
                                        safeSetState(() {});
                                      } else {
                                        _model.showNoDataAvailable = true;
                                        _model.draggedDown = true;
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    titleStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleLargeFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleLargeIsCustom,
                                        ),
                                    dayOfWeekStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyLargeIsCustom,
                                        ),
                                    dateStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    selectedDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                    inactiveDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelMediumIsCustom,
                                            ),
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final everything =
                                    (NewAPIsGroup.listMetricsMetricsGetCall
                                                .everything(
                                                  listViewListMetricsMetricsGetResponse
                                                      .jsonBody,
                                                )
                                                ?.toList() ??
                                            [])
                                        .take(500)
                                        .toList();

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: everything.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 10.0),
                                  itemBuilder: (context, everythingIndex) {
                                    final everythingItem =
                                        everything[everythingIndex];
                                    return Visibility(
                                      visible: NewAPIsGroup
                                                  .listMetricsMetricsGetCall
                                                  .id(
                                                listViewListMetricsMetricsGetResponse
                                                    .jsonBody,
                                              ) !=
                                              null &&
                                          (NewAPIsGroup
                                                  .listMetricsMetricsGetCall
                                                  .id(
                                            listViewListMetricsMetricsGetResponse
                                                .jsonBody,
                                          ))!
                                              .isNotEmpty,
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
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .changeDateFormat(
                                                                  getJsonField(
                                                            everythingItem,
                                                            r'''$.created_at''',
                                                          ).toString()),
                                                          '2025-01-01 05:05:05 AM',
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderRadius: 8.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.edit_square,
                                                      color: Color(0xFF3B9B77),
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        EditHealthmetricsRecordWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'recordID':
                                                              serializeParam(
                                                            getJsonField(
                                                              everythingItem,
                                                              r'''$.id''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'email':
                                                              serializeParam(
                                                            widget.email,
                                                            ParamType.String,
                                                          ),
                                                          'selectedDate':
                                                              serializeParam(
                                                            _model
                                                                .calendarSelectedDay
                                                                ?.start,
                                                            ParamType.DateTime,
                                                          ),
                                                          'fromViewMetricsPage':
                                                              serializeParam(
                                                            widget
                                                                .fromViewMetricsPage,
                                                            ParamType.bool,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 8.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Delete Record'),
                                                                    content: Text(
                                                                        'Are you sure you want to delete this record?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Cancel'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'Confirm'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        _model.deleteMetricsResponse =
                                                            await NewAPIsGroup
                                                                .deleteMetricMetricsMetricIdDeleteCall
                                                                .call(
                                                          metricId:
                                                              getJsonField(
                                                            everythingItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                          clientIdentifier:
                                                              widget.email,
                                                          xAccessToken:
                                                              currentAuthenticationToken,
                                                        );

                                                        _shouldSetState = true;
                                                        if ((_model
                                                                .deleteMetricsResponse
                                                                ?.succeeded ??
                                                            true)) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .clearSnackBars();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Metrics deleted successfully...',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      3500),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                            ),
                                                          );
                                                          safeSetState(() =>
                                                              _model.apiRequestCompleter =
                                                                  null);
                                                          await _model
                                                              .waitForApiRequestCompleted();
                                                          if (listViewListMetricsMetricsGetResponse
                                                              .succeeded) {
                                                            _model.showNoDataAvailable =
                                                                false;
                                                            _model.draggedDown =
                                                                false;
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.showNoDataAvailable =
                                                                true;
                                                            safeSetState(() {});
                                                          }
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .clearSnackBars();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                getJsonField(
                                                                  (_model.deleteMetricsResponse
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.detail''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      3500),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                            ),
                                                          );
                                                        }
                                                      } else {
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                    },
                                                  ),
                                                ].addToStart(
                                                    SizedBox(width: 5.0)),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      2.0,
                                                                      5.0,
                                                                      5.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Flexible(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        65.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          5.0,
                                                                          12.0,
                                                                          5.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'ogtxsox8' /* Weight */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '${(double.parse((getJsonField(
                                                                                  everythingItem,
                                                                                  r'''$.weight_kg''',
                                                                                ) * 2.20462).toStringAsFixed(2))).toString()} lbs',
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        65.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          5.0,
                                                                          12.0,
                                                                          5.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'e22oe5m7' /* BMI */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              getJsonField(
                                                                                everythingItem,
                                                                                r'''$.bmi''',
                                                                              )?.toString(),
                                                                              '25',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        65.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          5.0,
                                                                          12.0,
                                                                          5.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'pnn7gvek' /* Heart Rate */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '${getJsonField(
                                                                              everythingItem,
                                                                              r'''$.heart_rate''',
                                                                            ).toString()} BPM',
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (false)
                                                                  Flexible(
                                                                    flex: 1,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          65.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            5.0,
                                                                            12.0,
                                                                            5.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '17lq1li6' /* Blood Oxygen Level */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'xzxcauwv' /* 97% */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Flexible(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        65.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          5.0,
                                                                          12.0,
                                                                          5.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'la0uem44' /* Blood Pressue */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '${getJsonField(
                                                                              everythingItem,
                                                                              r'''$.systolic_bp''',
                                                                            ).toString()}/${getJsonField(
                                                                              everythingItem,
                                                                              r'''$.diastolic_bp''',
                                                                            ).toString()}',
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      icon: Icon(
                                                        Icons.info_outline,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 25.0,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          ViewAllMetricsOfEachRecordWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'recordID':
                                                                serializeParam(
                                                              getJsonField(
                                                                everythingItem,
                                                                r'''$.id''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'email':
                                                                serializeParam(
                                                              widget.email,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 5.0)),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
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
                                        .isNotEmpty) &&
                                _model.showNoDataAvailable)
                              Container(
                                height: 300.0,
                                constraints: BoxConstraints(
                                  maxWidth: 600.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: wrapWithModel(
                                  model: _model.noDataAvailableModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NoDataAvailableWidget(),
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
      ),
    );
  }
}

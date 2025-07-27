import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'book_appointment_model.dart';
export 'book_appointment_model.dart';

class BookAppointmentWidget extends StatefulWidget {
  const BookAppointmentWidget({
    super.key,
    this.userID,
  });

  final String? userID;

  static String routeName = 'BookAppointment';
  static String routePath = '/bookAppointment';

  @override
  State<BookAppointmentWidget> createState() => _BookAppointmentWidgetState();
}

class _BookAppointmentWidgetState extends State<BookAppointmentWidget> {
  late BookAppointmentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookAppointmentModel());

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
        if (currentUserData?.role == 'practitioner' ? true : false) {
          _model.pracIDResponse =
              await NewAPIsGroup.getMyProfilePractitionersMeGetCall.call(
            xAccessToken: currentAuthenticationToken,
          );

          if ((_model.pracIDResponse?.succeeded ?? true)) {
            _model.practitionerID =
                NewAPIsGroup.getMyProfilePractitionersMeGetCall.id(
              (_model.pracIDResponse?.jsonBody ?? ''),
            );
            safeSetState(() {});
          } else {
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();

            context.goNamedAuth(LoginWidget.routeName, context.mounted);
          }
        } else {
          return;
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
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            context.pop();
                          },
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '463soemm' /* Book Appointment */,
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
                      ],
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
              Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (currentUserData?.role == 'user' ? true : false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x19000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '2i6fv973' /* Select Practitioner */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleMediumIsCustom,
                                        ),
                                  ),
                                  Container(
                                    height: 190.0,
                                    decoration: BoxDecoration(),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: NewAPIsGroup
                                          .searchPractitionersClientsPractitionersSearchGetCall
                                          .call(
                                        fullname: 'everyone',
                                        xAccessToken:
                                            currentAuthenticationToken,
                                      ),
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
                                        final listViewSearchPractitionersClientsPractitionersSearchGetResponse =
                                            snapshot.data!;

                                        return Builder(
                                          builder: (context) {
                                            final allPractitioners = (NewAPIsGroup
                                                        .searchPractitionersClientsPractitionersSearchGetCall
                                                        .everyPrac(
                                                          listViewSearchPractitionersClientsPractitionersSearchGetResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [])
                                                .take(100)
                                                .toList();

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  allPractitioners.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 10.0),
                                              itemBuilder: (context,
                                                  allPractitionersIndex) {
                                                final allPractitionersItem =
                                                    allPractitioners[
                                                        allPractitionersIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.practitionerID =
                                                        getJsonField(
                                                      allPractitionersItem,
                                                      r'''$.id''',
                                                    ).toString();
                                                    safeSetState(() {});
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter2 =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted2();
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter1 =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted1();
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        _model.practitionerID ==
                                                                getJsonField(
                                                                  allPractitionersItem,
                                                                  r'''$.id''',
                                                                ).toString()
                                                            ? Color(0xFFC7CFD4)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 60.0,
                                                            height: 60.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: Image
                                                                    .network(
                                                                  '\"500x500?doctor#1\"',
                                                                ).image,
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Container(
                                                              width: 200.0,
                                                              height: 200.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                getJsonField(
                                                                  allPractitionersItem,
                                                                  r'''$.profile_picture''',
                                                                ).toString(),
                                                                fit: BoxFit
                                                                    .cover,
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
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    '${getJsonField(
                                                                      allPractitionersItem,
                                                                      r'''$.first_name''',
                                                                    ).toString()} ${getJsonField(
                                                                      allPractitionersItem,
                                                                      r'''$.last_name''',
                                                                    ).toString()}',
                                                                    'Sarah Johnson',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 16.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'elzzzd4v' /* Select Date */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleMediumFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleMediumIsCustom,
                                      ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: FlutterFlowCalendar(
                                    color: FlutterFlowTheme.of(context).primary,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    weekFormat: false,
                                    weekStartsMonday: false,
                                    initialDate: getCurrentTimestamp,
                                    rowHeight: 50.0,
                                    onChange:
                                        (DateTimeRange? newSelectedDate) async {
                                      if (_model.calendarSelectedDay ==
                                          newSelectedDate) {
                                        return;
                                      }
                                      _model.calendarSelectedDay =
                                          newSelectedDate;
                                      _model.isTappedIndex = null;
                                      safeSetState(() {});
                                      safeSetState(() =>
                                          _model.apiRequestCompleter2 = null);
                                      await _model
                                          .waitForApiRequestCompleted2();
                                      safeSetState(() =>
                                          _model.apiRequestCompleter1 = null);
                                      await _model
                                          .waitForApiRequestCompleted1();
                                      safeSetState(() {});
                                    },
                                    titleStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleLargeFamily,
                                          letterSpacing: 0.0,
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
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                      if ((_model.practitionerID != null &&
                              _model.practitionerID != '') &&
                          (currentUserData?.role == 'user'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x19000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'sk79qgsv' /* Available Time Slots */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleMediumIsCustom,
                                        ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).width <=
                                                  450.0
                                              ? 180.0
                                              : 120.0,
                                      constraints: BoxConstraints(
                                        maxWidth: 800.0,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: (_model.apiRequestCompleter2 ??=
                                                Completer<ApiCallResponse>()
                                                  ..complete(NewAPIsGroup
                                                      .getBookedAppointmentSlotsCall
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 40.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final timeSlotsListClientGetBookedAppointmentSlotsResponse =
                                              snapshot.data!;

                                          return ListView(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              if (NewAPIsGroup
                                                          .getBookedAppointmentSlotsCall
                                                          .startTime(
                                                        timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                            .jsonBody,
                                                      ) !=
                                                      null &&
                                                  (NewAPIsGroup
                                                          .getBookedAppointmentSlotsCall
                                                          .startTime(
                                                    timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                        .jsonBody,
                                                  ))!
                                                      .isNotEmpty)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Wrap(
                                                      spacing: 10.0,
                                                      runSpacing: 10.0,
                                                      alignment:
                                                          WrapAlignment.center,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .center,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.center,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '9:00 AM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '9:00 AM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '9:00 AM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        1;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'jyqeoc7o' /* 9:00 AM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        1
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 1
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '9:30 AM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '9:30 AM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '9:30 AM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        2;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'yzgicadl' /* 9:30 AM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        2
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 2
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '10:00 AM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '10:00 AM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '10:00 AM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        3;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'chr4z3qq' /* 10:00 AM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        3
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 3
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '10:30 AM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '10:30 AM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '10:30 AM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        4;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'ffdhpszs' /* 10:30 AM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        4
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 4
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '11:00 AM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '11:00 AM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '11:00 AM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        5;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '26h64dok' /* 11:00 AM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        5
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 5
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '11:30 AM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '11:30 AM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '11:30 AM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        6;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '62b4kdbx' /* 11:30 AM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        6
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 6
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '1:00 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '1:00 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '1:00 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        7;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '53t2zy72' /* 1:00 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        7
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 7
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '1:30 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '1:30 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '1:30 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        8;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'sseg796c' /* 1:30 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        8
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 8
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '2:00 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '2:00 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '2:00 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        9;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'h3vmfvj4' /* 2:00 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        9
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 9
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '2:30 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '2:30 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '2:30 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        10;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'ykqpk2a1' /* 2:30 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        10
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 10
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '3:00 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '3:00 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '3:00 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        11;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'woq7czj6' /* 3:00 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        11
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 11
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '3:30 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '3:30 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '3:30 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        12;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'haux5ylr' /* 3:30 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        12
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 12
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '4:00 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '4:00 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '4:00 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        13;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'q1w5bxey' /* 4:00 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        13
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 13
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '4:30 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '4:30 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '4:30 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        14;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '247foxcz' /* 4:30 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        14
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 14
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              if (!(NewAPIsGroup
                                                          .getBookedAppointmentSlotsCall
                                                          .startTime(
                                                        timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                            .jsonBody,
                                                      ) !=
                                                      null &&
                                                  (NewAPIsGroup
                                                          .getBookedAppointmentSlotsCall
                                                          .startTime(
                                                    timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                        .jsonBody,
                                                  ))!
                                                      .isNotEmpty))
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Wrap(
                                                      spacing: 10.0,
                                                      runSpacing: 10.0,
                                                      alignment:
                                                          WrapAlignment.center,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .center,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.center,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '9:00 AM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '9:00 AM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '9:00 AM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        1;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '9f4sbj2v' /* 9:00 AM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        1
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 1
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '9:30 AM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '9:30 AM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '9:30 AM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        2;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'gbdhpyay' /* 9:30 AM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        2
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 2
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '10:00 AM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '10:00 AM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '10:00 AM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        3;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'e48rd3q5' /* 10:00 AM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        3
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 3
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '10:30 AM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '10:30 AM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '10:30 AM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        4;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '9eblu19i' /* 10:30 AM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        4
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 4
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '11:30 AM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '11:30 AM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '11:30 AM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        6;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'brcmi7v1' /* 11:30 AM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        6
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 6
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '11:00 AM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '11:00 AM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '11:00 AM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        5;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              't9emy0d2' /* 11:00 AM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        5
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 5
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '1:00 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '1:00 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '1:00 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        7;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'gdz3iuqj' /* 1:00 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        7
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 7
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '1:30 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '1:30 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '1:30 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        8;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'msmmxz1k' /* 1:30 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        8
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 8
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '2:00 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '2:00 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '2:00 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        9;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '2z9j1dsd' /* 2:00 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        9
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 9
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '2:30 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '2:30 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '2:30 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        10;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'moiwix9t' /* 2:30 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        10
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 10
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '3:00 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '3:00 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '3:00 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        11;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'vbrnfe8l' /* 3:00 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        11
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 11
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '3:30 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '3:30 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '3:30 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        12;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'slntdg2r' /* 3:30 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        12
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 12
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '4:00 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '4:00 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '4:00 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        13;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '4uapjonj' /* 4:00 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        13
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 13
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onDoubleTap:
                                                              () async {
                                                            _model.isTappedIndex =
                                                                null;
                                                            _model.startDate =
                                                                null;
                                                            _model.endDate =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: FFButtonWidget(
                                                            onPressed: functions.isTimeSlotBooked(
                                                                    dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                        .startTime(
                                                                          timeSlotsListClientGetBookedAppointmentSlotsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    '4:30 PM',
                                                                    _model.yss.toList())
                                                                ? null
                                                                : () async {
                                                                    _model.startDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '4:30 PM')
                                                                        .firstOrNull;
                                                                    _model.endDate = functions
                                                                        .getStartAndEndDateTime(
                                                                            _model.calendarSelectedDay!.start,
                                                                            '4:30 PM')
                                                                        .lastOrNull;
                                                                    _model.isTappedIndex =
                                                                        14;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'k33ci2e9' /* 4:30 PM */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isTappedIndex ==
                                                                        14
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isTappedIndex == 14
                                                                              ? FlutterFlowTheme.of(context).info
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ),
                      if ((_model.practitionerID != null &&
                                  _model.practitionerID != '') &&
                              (currentUserData?.role == 'practitioner')
                          ? true
                          : false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x19000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'wiy7nwa5' /* Available Time Slots */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleMediumIsCustom,
                                        ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).width <=
                                                  450.0
                                              ? 180.0
                                              : 120.0,
                                      constraints: BoxConstraints(
                                        maxWidth: 800.0,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: (_model.apiRequestCompleter1 ??=
                                                Completer<ApiCallResponse>()
                                                  ..complete(NewAPIsGroup
                                                      .getBookedAppointmentSlotsCall
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 40.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final timeSlotsListGetBookedAppointmentSlotsResponse =
                                              snapshot.data!;

                                          return ListView(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: Wrap(
                                                    spacing: 10.0,
                                                    runSpacing: 10.0,
                                                    alignment:
                                                        WrapAlignment.center,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .center,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.center,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
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
                                                        onDoubleTap: () async {
                                                          _model.isTappedIndex =
                                                              null;
                                                          _model.startDate =
                                                              null;
                                                          _model.endDate = null;
                                                          safeSetState(() {});
                                                        },
                                                        child: FFButtonWidget(
                                                          onPressed: functions.isTimeSlotBooked(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .calendarSelectedDay!
                                                                        .start,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .startTime(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  '9:00 AM',
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .status(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList())
                                                              ? null
                                                              : () async {
                                                                  _model.startDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '9:00 AM')
                                                                      .firstOrNull;
                                                                  _model.endDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '9:00 AM')
                                                                      .lastOrNull;
                                                                  _model.isTappedIndex =
                                                                      1;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'ze0vrju0' /* 9:00 AM */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.isTappedIndex ==
                                                                      1
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.isTappedIndex ==
                                                                                1
                                                                            ? FlutterFlowTheme.of(context).info
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
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
                                                        onDoubleTap: () async {
                                                          _model.isTappedIndex =
                                                              null;
                                                          _model.startDate =
                                                              null;
                                                          _model.endDate = null;
                                                          safeSetState(() {});
                                                        },
                                                        child: FFButtonWidget(
                                                          onPressed: functions.isTimeSlotBooked(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .calendarSelectedDay!
                                                                        .start,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .startTime(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  '9:30 AM',
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .status(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList())
                                                              ? null
                                                              : () async {
                                                                  _model.startDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '9:30 AM')
                                                                      .firstOrNull;
                                                                  _model.endDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '9:30 AM')
                                                                      .lastOrNull;
                                                                  _model.isTappedIndex =
                                                                      2;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            's8e8ffmy' /* 9:30 AM */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.isTappedIndex ==
                                                                      2
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.isTappedIndex ==
                                                                                2
                                                                            ? FlutterFlowTheme.of(context).info
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
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
                                                        onDoubleTap: () async {
                                                          _model.isTappedIndex =
                                                              null;
                                                          _model.startDate =
                                                              null;
                                                          _model.endDate = null;
                                                          safeSetState(() {});
                                                        },
                                                        child: FFButtonWidget(
                                                          onPressed: functions.isTimeSlotBooked(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .calendarSelectedDay!
                                                                        .start,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .startTime(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  '10:00 AM',
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .status(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList())
                                                              ? null
                                                              : () async {
                                                                  _model.startDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '10:00 AM')
                                                                      .firstOrNull;
                                                                  _model.endDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '10:00 AM')
                                                                      .lastOrNull;
                                                                  _model.isTappedIndex =
                                                                      3;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'er0cvjeb' /* 10:00 AM */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.isTappedIndex ==
                                                                      3
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.isTappedIndex ==
                                                                                3
                                                                            ? FlutterFlowTheme.of(context).info
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
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
                                                        onDoubleTap: () async {
                                                          _model.isTappedIndex =
                                                              null;
                                                          _model.startDate =
                                                              null;
                                                          _model.endDate = null;
                                                          safeSetState(() {});
                                                        },
                                                        child: FFButtonWidget(
                                                          onPressed: functions.isTimeSlotBooked(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .calendarSelectedDay!
                                                                        .start,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .startTime(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  '10:30 AM',
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .status(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList())
                                                              ? null
                                                              : () async {
                                                                  _model.startDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '10:30 AM')
                                                                      .firstOrNull;
                                                                  _model.endDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '10:30 AM')
                                                                      .lastOrNull;
                                                                  _model.isTappedIndex =
                                                                      4;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'fdz1uq63' /* 10:30 AM */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.isTappedIndex ==
                                                                      4
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.isTappedIndex ==
                                                                                4
                                                                            ? FlutterFlowTheme.of(context).info
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
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
                                                        onDoubleTap: () async {
                                                          _model.isTappedIndex =
                                                              null;
                                                          _model.startDate =
                                                              null;
                                                          _model.endDate = null;
                                                          safeSetState(() {});
                                                        },
                                                        child: FFButtonWidget(
                                                          onPressed: functions.isTimeSlotBooked(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .calendarSelectedDay!
                                                                        .start,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .startTime(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  '11:00 AM',
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .status(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList())
                                                              ? null
                                                              : () async {
                                                                  _model.startDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '11:00 AM')
                                                                      .firstOrNull;
                                                                  _model.endDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '11:00 AM')
                                                                      .lastOrNull;
                                                                  _model.isTappedIndex =
                                                                      5;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'pixx0jwq' /* 11:00 AM */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.isTappedIndex ==
                                                                      5
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.isTappedIndex ==
                                                                                5
                                                                            ? FlutterFlowTheme.of(context).info
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
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
                                                        onDoubleTap: () async {
                                                          _model.isTappedIndex =
                                                              null;
                                                          _model.startDate =
                                                              null;
                                                          _model.endDate = null;
                                                          safeSetState(() {});
                                                        },
                                                        child: FFButtonWidget(
                                                          onPressed: functions.isTimeSlotBooked(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .calendarSelectedDay!
                                                                        .start,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .startTime(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  '11:30 AM',
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .status(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList())
                                                              ? null
                                                              : () async {
                                                                  _model.startDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '11:30 AM')
                                                                      .firstOrNull;
                                                                  _model.endDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '11:30 AM')
                                                                      .lastOrNull;
                                                                  _model.isTappedIndex =
                                                                      6;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            '7itc5uwr' /* 11:30 AM */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.isTappedIndex ==
                                                                      6
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.isTappedIndex ==
                                                                                6
                                                                            ? FlutterFlowTheme.of(context).info
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
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
                                                        onDoubleTap: () async {
                                                          _model.isTappedIndex =
                                                              null;
                                                          _model.startDate =
                                                              null;
                                                          _model.endDate = null;
                                                          safeSetState(() {});
                                                        },
                                                        child: FFButtonWidget(
                                                          onPressed: functions.isTimeSlotBooked(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .calendarSelectedDay!
                                                                        .start,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .startTime(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  '1:00 PM',
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .status(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList())
                                                              ? null
                                                              : () async {
                                                                  _model.startDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '1:00 PM')
                                                                      .firstOrNull;
                                                                  _model.endDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '1:00 PM')
                                                                      .lastOrNull;
                                                                  _model.isTappedIndex =
                                                                      7;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'naoz6abq' /* 1:00 PM */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.isTappedIndex ==
                                                                      7
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.isTappedIndex ==
                                                                                7
                                                                            ? FlutterFlowTheme.of(context).info
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
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
                                                        onDoubleTap: () async {
                                                          _model.isTappedIndex =
                                                              null;
                                                          _model.startDate =
                                                              null;
                                                          _model.endDate = null;
                                                          safeSetState(() {});
                                                        },
                                                        child: FFButtonWidget(
                                                          onPressed: functions.isTimeSlotBooked(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .calendarSelectedDay!
                                                                        .start,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .startTime(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  '1:30 PM',
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .status(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList())
                                                              ? null
                                                              : () async {
                                                                  _model.startDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '1:30 PM')
                                                                      .firstOrNull;
                                                                  _model.endDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '1:30 PM')
                                                                      .lastOrNull;
                                                                  _model.isTappedIndex =
                                                                      8;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'wzm7q947' /* 1:30 PM */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.isTappedIndex ==
                                                                      8
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.isTappedIndex ==
                                                                                8
                                                                            ? FlutterFlowTheme.of(context).info
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
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
                                                        onDoubleTap: () async {
                                                          _model.isTappedIndex =
                                                              null;
                                                          _model.startDate =
                                                              null;
                                                          _model.endDate = null;
                                                          safeSetState(() {});
                                                        },
                                                        child: FFButtonWidget(
                                                          onPressed: functions.isTimeSlotBooked(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .calendarSelectedDay!
                                                                        .start,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .startTime(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  '2:00 PM',
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .status(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList())
                                                              ? null
                                                              : () async {
                                                                  _model.startDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '2:00 PM')
                                                                      .firstOrNull;
                                                                  _model.endDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '2:00 PM')
                                                                      .lastOrNull;
                                                                  _model.isTappedIndex =
                                                                      9;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'w5d6z8oo' /* 2:00 PM */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.isTappedIndex ==
                                                                      9
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.isTappedIndex ==
                                                                                9
                                                                            ? FlutterFlowTheme.of(context).info
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
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
                                                        onDoubleTap: () async {
                                                          _model.isTappedIndex =
                                                              null;
                                                          _model.startDate =
                                                              null;
                                                          _model.endDate = null;
                                                          safeSetState(() {});
                                                        },
                                                        child: FFButtonWidget(
                                                          onPressed: functions.isTimeSlotBooked(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .calendarSelectedDay!
                                                                        .start,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .startTime(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  '2:30 PM',
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .status(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList())
                                                              ? null
                                                              : () async {
                                                                  _model.startDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '2:30 PM')
                                                                      .firstOrNull;
                                                                  _model.endDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '2:30 PM')
                                                                      .lastOrNull;
                                                                  _model.isTappedIndex =
                                                                      10;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'f9xppq2g' /* 2:30 PM */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.isTappedIndex ==
                                                                      10
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.isTappedIndex ==
                                                                                10
                                                                            ? FlutterFlowTheme.of(context).info
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
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
                                                        onDoubleTap: () async {
                                                          _model.isTappedIndex =
                                                              null;
                                                          _model.startDate =
                                                              null;
                                                          _model.endDate = null;
                                                          safeSetState(() {});
                                                        },
                                                        child: FFButtonWidget(
                                                          onPressed: functions.isTimeSlotBooked(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .calendarSelectedDay!
                                                                        .start,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .startTime(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  '3:00 PM',
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .status(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList())
                                                              ? null
                                                              : () async {
                                                                  _model.startDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '3:00 PM')
                                                                      .firstOrNull;
                                                                  _model.endDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '3:00 PM')
                                                                      .lastOrNull;
                                                                  _model.isTappedIndex =
                                                                      11;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            '348hdqtz' /* 3:00 PM */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.isTappedIndex ==
                                                                      11
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.isTappedIndex ==
                                                                                11
                                                                            ? FlutterFlowTheme.of(context).info
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
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
                                                        onDoubleTap: () async {
                                                          _model.isTappedIndex =
                                                              null;
                                                          _model.startDate =
                                                              null;
                                                          _model.endDate = null;
                                                          safeSetState(() {});
                                                        },
                                                        child: FFButtonWidget(
                                                          onPressed: functions.isTimeSlotBooked(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .calendarSelectedDay!
                                                                        .start,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .startTime(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  '3:30 PM',
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .status(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList())
                                                              ? null
                                                              : () async {
                                                                  _model.startDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '3:30 PM')
                                                                      .firstOrNull;
                                                                  _model.endDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '3:30 PM')
                                                                      .lastOrNull;
                                                                  _model.isTappedIndex =
                                                                      12;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            '89abrk54' /* 3:30 PM */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.isTappedIndex ==
                                                                      12
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.isTappedIndex ==
                                                                                12
                                                                            ? FlutterFlowTheme.of(context).info
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
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
                                                        onDoubleTap: () async {
                                                          _model.isTappedIndex =
                                                              null;
                                                          _model.startDate =
                                                              null;
                                                          _model.endDate = null;
                                                          safeSetState(() {});
                                                        },
                                                        child: FFButtonWidget(
                                                          onPressed: functions.isTimeSlotBooked(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .calendarSelectedDay!
                                                                        .start,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .startTime(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  '4:00 PM',
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .status(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList())
                                                              ? null
                                                              : () async {
                                                                  _model.startDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '4:00 PM')
                                                                      .firstOrNull;
                                                                  _model.endDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '4:00 PM')
                                                                      .lastOrNull;
                                                                  _model.isTappedIndex =
                                                                      13;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'wrh4zqn4' /* 4:00 PM */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.isTappedIndex ==
                                                                      13
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.isTappedIndex ==
                                                                                13
                                                                            ? FlutterFlowTheme.of(context).info
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
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
                                                        onDoubleTap: () async {
                                                          _model.isTappedIndex =
                                                              null;
                                                          _model.startDate =
                                                              null;
                                                          _model.endDate = null;
                                                          safeSetState(() {});
                                                        },
                                                        child: FFButtonWidget(
                                                          onPressed: functions.isTimeSlotBooked(
                                                                  dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    _model
                                                                        .calendarSelectedDay!
                                                                        .start,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .startTime(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  '4:30 PM',
                                                                  NewAPIsGroup.getBookedAppointmentSlotsCall
                                                                      .status(
                                                                        timeSlotsListGetBookedAppointmentSlotsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList())
                                                              ? null
                                                              : () async {
                                                                  _model.startDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '4:30 PM')
                                                                      .firstOrNull;
                                                                  _model.endDate = functions
                                                                      .getStartAndEndDateTime(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          '4:30 PM')
                                                                      .lastOrNull;
                                                                  _model.isTappedIndex =
                                                                      14;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'xp4jj3yg' /* 4:30 PM */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.isTappedIndex ==
                                                                      14
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        _model.isTappedIndex ==
                                                                                14
                                                                            ? FlutterFlowTheme.of(context).info
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.startDate != null &&
                                _model.startDate != '') {
                              _model.createAppointment = await NewAPIsGroup
                                  .createANewAppointmentSlotCall
                                  .call(
                                clientId: widget.userID,
                                practitionerId: _model.practitionerID,
                                startTime: _model.startDate,
                                endTime: _model.endDate,
                                xAccessToken: currentAuthenticationToken,
                              );

                              if ((_model.createAppointment?.succeeded ??
                                  true)) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Appointment booked successfully...',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 3500),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                );
                                context.safePop();
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      getJsonField(
                                        (_model.createAppointment?.jsonBody ??
                                            ''),
                                        r'''$.detail''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 3500),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please choose a time slot...',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 3500),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'kupnubze' /* Confirm Appointment */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: EdgeInsets.all(8.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ].addToEnd(SizedBox(height: 40.0)),
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

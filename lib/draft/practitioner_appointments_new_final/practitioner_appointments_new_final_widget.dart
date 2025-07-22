import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'practitioner_appointments_new_final_model.dart';
export 'practitioner_appointments_new_final_model.dart';

class PractitionerAppointmentsNewFinalWidget extends StatefulWidget {
  const PractitionerAppointmentsNewFinalWidget({super.key});

  static String routeName = 'PractitionerAppointmentsNewFinal';
  static String routePath = '/practitionerAppointmentsNewFinal';

  @override
  State<PractitionerAppointmentsNewFinalWidget> createState() =>
      _PractitionerAppointmentsNewFinalWidgetState();
}

class _PractitionerAppointmentsNewFinalWidgetState
    extends State<PractitionerAppointmentsNewFinalWidget>
    with TickerProviderStateMixin {
  late PractitionerAppointmentsNewFinalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => PractitionerAppointmentsNewFinalModel());

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

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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
                            context.pushNamed(HomeScreenWidget.routeName);
                          },
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '1abrs5so' /* My Appointments */,
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
        body: FutureBuilder<ApiCallResponse>(
          future: NewAPIsGroup.listMyClientsPractitionersMeClientsGetCall.call(
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
            final listViewListMyClientsPractitionersMeClientsGetResponse =
                snapshot.data!;

            return ListView(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 12.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: NewAPIsGroup.viewMyAppointmentsCall.call(
                        upcomingOnly: false,
                        xAccessToken: currentAuthenticationToken,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitCircle(
                                color: FlutterFlowTheme.of(context).success,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        final listViewViewMyAppointmentsResponse =
                            snapshot.data!;

                        return ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 16.0),
                              child: Container(
                                width: double.infinity,
                                height: 1305.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(0.0, 0),
                                      child: FlutterFlowButtonTabBar(
                                        useToggleButtonStyle: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        unselectedLabelStyle: FlutterFlowTheme
                                                .of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        backgroundColor: Color(0xFF2DB7A6),
                                        unselectedBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        unselectedBorderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 1.5,
                                        borderRadius: 8.0,
                                        elevation: 0.0,
                                        buttonMargin:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                        padding: EdgeInsets.all(16.0),
                                        tabs: [
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'duo7jq47' /* Upcoming */,
                                            ),
                                          ),
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '6z3pz1lq' /* Completed */,
                                            ),
                                          ),
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'vfrmxiiy' /* Cancelled */,
                                            ),
                                          ),
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'pefwi4ax' /* Pending */,
                                            ),
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                        onTap: (i) async {
                                          [
                                            () async {
                                              _model.updateStatusAtIndex(
                                                0,
                                                (_) => 'confirmed',
                                              );
                                              safeSetState(() {});
                                            },
                                            () async {
                                              _model.updateStatusAtIndex(
                                                0,
                                                (_) => 'confirmed',
                                              );
                                              safeSetState(() {});
                                            },
                                            () async {
                                              _model.updateStatusAtIndex(
                                                0,
                                                (_) => 'cancelled',
                                              );
                                              safeSetState(() {});
                                            },
                                            () async {
                                              _model.updateStatusAtIndex(
                                                0,
                                                (_) => 'pending',
                                              );
                                              safeSetState(() {});
                                            }
                                          ][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        children: [
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final everything = (NewAPIsGroup
                                                                  .viewMyAppointmentsCall
                                                                  .everything(
                                                                    listViewViewMyAppointmentsResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.where((e) =>
                                                                      _model
                                                                          .status
                                                                          .contains(
                                                                              getJsonField(
                                                                        e,
                                                                        r'''$.status''',
                                                                      ).toString()) &&
                                                                      (functions.convertIsoToUnixTimestamp(getJsonField(
                                                                            e,
                                                                            r'''$.start_time''',
                                                                          ).toString()) >
                                                                          getCurrentTimestamp.secondsSinceEpoch))
                                                                  .toList()
                                                                  .toList() ??
                                                              [])
                                                          .take(100)
                                                          .toList();
                                                      if (everything.isEmpty) {
                                                        return NoDataAvailableWidget();
                                                      }

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            everything.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 0.0),
                                                        itemBuilder: (context,
                                                            everythingIndex) {
                                                          final everythingItem =
                                                              everything[
                                                                  everythingIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            16.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          ListView(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        primary:
                                                                            false,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                0.0,
                                                                                2.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 70.0,
                                                                                  height: 70.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    image: DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: Image.network(
                                                                                        '\"500x500?doctor#1\"',
                                                                                      ).image,
                                                                                    ),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 200.0,
                                                                                    height: 200.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      getJsonField(
                                                                                        NewAPIsGroup.listMyClientsPractitionersMeClientsGetCall
                                                                                            .everyClient(
                                                                                              listViewListMyClientsPractitionersMeClientsGetResponse.jsonBody,
                                                                                            )!
                                                                                            .where((e) =>
                                                                                                getJsonField(
                                                                                                  everythingItem,
                                                                                                  r'''$.client_id''',
                                                                                                ) ==
                                                                                                getJsonField(
                                                                                                  e,
                                                                                                  r'''$.id''',
                                                                                                ))
                                                                                            .toList()
                                                                                            .firstOrNull,
                                                                                        r'''$.profile_picture''',
                                                                                      ).toString(),
                                                                                      fit: BoxFit.cover,
                                                                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                        'assets/images/error_image.jpg',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        '${getJsonField(
                                                                                          NewAPIsGroup.listMyClientsPractitionersMeClientsGetCall
                                                                                              .everyClient(
                                                                                                listViewListMyClientsPractitionersMeClientsGetResponse.jsonBody,
                                                                                              )
                                                                                              ?.where((e) =>
                                                                                                  getJsonField(
                                                                                                    everythingItem,
                                                                                                    r'''$.client_id''',
                                                                                                  ) ==
                                                                                                  getJsonField(
                                                                                                    e,
                                                                                                    r'''$.id''',
                                                                                                  ))
                                                                                              .toList()
                                                                                              .firstOrNull,
                                                                                          r'''$.first_name''',
                                                                                        ).toString()} ${getJsonField(
                                                                                          NewAPIsGroup.listMyClientsPractitionersMeClientsGetCall
                                                                                              .everyClient(
                                                                                                listViewListMyClientsPractitionersMeClientsGetResponse.jsonBody,
                                                                                              )
                                                                                              ?.where((e) =>
                                                                                                  getJsonField(
                                                                                                    everythingItem,
                                                                                                    r'''$.client_id''',
                                                                                                  ) ==
                                                                                                  getJsonField(
                                                                                                    e,
                                                                                                    r'''$.id''',
                                                                                                  ))
                                                                                              .toList()
                                                                                              .firstOrNull,
                                                                                          r'''$.last_name''',
                                                                                        ).toString()}',
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 12.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                11.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'sgjltj69' /* Date */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions
                                                                                            .formatUtcDateTimeToLocal(getJsonField(
                                                                                              everythingItem,
                                                                                              r'''$.start_time''',
                                                                                            ).toString())
                                                                                            .firstOrNull,
                                                                                        'Apr 05, 2025',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 10.0)),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 50.0,
                                                                                  child: VerticalDivider(
                                                                                    width: 10.0,
                                                                                    thickness: 2.0,
                                                                                    indent: 3.0,
                                                                                    endIndent: 3.0,
                                                                                    color: Color(0x4C050119),
                                                                                  ),
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '2an1njef' /* Time */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions
                                                                                            .formatUtcDateTimeToLocal(getJsonField(
                                                                                              everythingItem,
                                                                                              r'''$.start_time''',
                                                                                            ).toString())
                                                                                            .lastOrNull,
                                                                                        '11:00 AM',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 10.0)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    var _shouldSetState = false;
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              title: Text('Cancel Appointment'),
                                                                                              content: Text('Are you sure you want to cancel this appointment?'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                  child: Text('No'),
                                                                                                ),
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                  child: Text('Yes'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ) ??
                                                                                        false;
                                                                                    if (confirmDialogResponse) {
                                                                                      _model.cancelAppointment = await NewAPIsGroup.cancelAnAppointmentSlotCall.call(
                                                                                        appointmentId: getJsonField(
                                                                                          everythingItem,
                                                                                          r'''$.id''',
                                                                                        ).toString(),
                                                                                        xAccessToken: currentAuthenticationToken,
                                                                                      );

                                                                                      _shouldSetState = true;
                                                                                      if ((_model.cancelAppointment?.succeeded ?? true)) {
                                                                                        ScaffoldMessenger.of(context).clearSnackBars();
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Appointment cancelled successfully...',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 3500),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        ScaffoldMessenger.of(context).clearSnackBars();
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              getJsonField(
                                                                                                (_model.cancelAppointment?.jsonBody ?? ''),
                                                                                                r'''$.detail''',
                                                                                              ).toString(),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 3500),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    } else {
                                                                                      if (_shouldSetState) safeSetState(() {});
                                                                                      return;
                                                                                    }

                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'ozwtxi1s' /* Cancel */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 50.0,
                                                                                    padding: EdgeInsets.all(8.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                        ),
                                                                                    borderRadius: BorderRadius.circular(30.0),
                                                                                  ),
                                                                                  showLoadingIndicator: false,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          12.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final everything = (NewAPIsGroup
                                                                  .viewMyAppointmentsCall
                                                                  .everything(
                                                                    listViewViewMyAppointmentsResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.where((e) =>
                                                                      _model
                                                                          .status
                                                                          .contains(
                                                                              getJsonField(
                                                                        e,
                                                                        r'''$.status''',
                                                                      ).toString()) &&
                                                                      (functions.convertIsoToUnixTimestamp(getJsonField(
                                                                            e,
                                                                            r'''$.start_time''',
                                                                          ).toString()) <=
                                                                          getCurrentTimestamp.secondsSinceEpoch))
                                                                  .toList()
                                                                  .toList() ??
                                                              [])
                                                          .take(100)
                                                          .toList();
                                                      if (everything.isEmpty) {
                                                        return Center(
                                                          child:
                                                              NoDataAvailableWidget(),
                                                        );
                                                      }

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            everything.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 0.0),
                                                        itemBuilder: (context,
                                                            everythingIndex) {
                                                          final everythingItem =
                                                              everything[
                                                                  everythingIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            16.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          ListView(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        primary:
                                                                            false,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                0.0,
                                                                                2.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 70.0,
                                                                                  height: 70.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    image: DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: Image.network(
                                                                                        '\"500x500?doctor#1\"',
                                                                                      ).image,
                                                                                    ),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 200.0,
                                                                                    height: 200.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      getJsonField(
                                                                                        NewAPIsGroup.listMyClientsPractitionersMeClientsGetCall
                                                                                            .everyClient(
                                                                                              listViewListMyClientsPractitionersMeClientsGetResponse.jsonBody,
                                                                                            )!
                                                                                            .where((e) =>
                                                                                                getJsonField(
                                                                                                  everythingItem,
                                                                                                  r'''$.client_id''',
                                                                                                ) ==
                                                                                                getJsonField(
                                                                                                  e,
                                                                                                  r'''$.id''',
                                                                                                ))
                                                                                            .toList()
                                                                                            .firstOrNull,
                                                                                        r'''$.profile_picture''',
                                                                                      ).toString(),
                                                                                      fit: BoxFit.cover,
                                                                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                        'assets/images/error_image.jpg',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        '${getJsonField(
                                                                                          NewAPIsGroup.listMyClientsPractitionersMeClientsGetCall
                                                                                              .everyClient(
                                                                                                listViewListMyClientsPractitionersMeClientsGetResponse.jsonBody,
                                                                                              )
                                                                                              ?.where((e) =>
                                                                                                  getJsonField(
                                                                                                    everythingItem,
                                                                                                    r'''$.client_id''',
                                                                                                  ) ==
                                                                                                  getJsonField(
                                                                                                    e,
                                                                                                    r'''$.id''',
                                                                                                  ))
                                                                                              .toList()
                                                                                              .firstOrNull,
                                                                                          r'''$.first_name''',
                                                                                        ).toString()} ${getJsonField(
                                                                                          NewAPIsGroup.listMyClientsPractitionersMeClientsGetCall
                                                                                              .everyClient(
                                                                                                listViewListMyClientsPractitionersMeClientsGetResponse.jsonBody,
                                                                                              )
                                                                                              ?.where((e) =>
                                                                                                  getJsonField(
                                                                                                    everythingItem,
                                                                                                    r'''$.client_id''',
                                                                                                  ) ==
                                                                                                  getJsonField(
                                                                                                    e,
                                                                                                    r'''$.id''',
                                                                                                  ))
                                                                                              .toList()
                                                                                              .firstOrNull,
                                                                                          r'''$.last_name''',
                                                                                        ).toString()}',
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 12.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                11.0,
                                                                                10.0,
                                                                                11.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '0i0v43n5' /* Date */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions
                                                                                            .formatUtcDateTimeToLocal(getJsonField(
                                                                                              everythingItem,
                                                                                              r'''$.start_time''',
                                                                                            ).toString())
                                                                                            .firstOrNull,
                                                                                        'Apr 05, 2025',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 10.0)),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 50.0,
                                                                                  child: VerticalDivider(
                                                                                    width: 10.0,
                                                                                    thickness: 2.0,
                                                                                    indent: 3.0,
                                                                                    endIndent: 3.0,
                                                                                    color: Color(0x4C050119),
                                                                                  ),
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '33a0ah8j' /* Time */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions
                                                                                            .formatUtcDateTimeToLocal(getJsonField(
                                                                                              everythingItem,
                                                                                              r'''$.start_time''',
                                                                                            ).toString())
                                                                                            .lastOrNull,
                                                                                        '11:00 AM',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 10.0)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (responsiveVisibility(
                                                                                  context: context,
                                                                                  phone: false,
                                                                                  tablet: false,
                                                                                  tabletLandscape: false,
                                                                                  desktop: false,
                                                                                ))
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                      child: FFButtonWidget(
                                                                                        onPressed: () {
                                                                                          print('Button pressed ...');
                                                                                        },
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          '1484xj08' /* Reschedule */,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          width: double.infinity,
                                                                                          height: 50.0,
                                                                                          padding: EdgeInsets.all(8.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                              ),
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(30.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          12.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final everythingg = (NewAPIsGroup
                                                                  .viewMyAppointmentsCall
                                                                  .everything(
                                                                    listViewViewMyAppointmentsResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.where((e) =>
                                                                      _model
                                                                          .status
                                                                          .contains(
                                                                              getJsonField(
                                                                        e,
                                                                        r'''$.status''',
                                                                      ).toString()))
                                                                  .toList()
                                                                  .toList() ??
                                                              [])
                                                          .take(100)
                                                          .toList();
                                                      if (everythingg.isEmpty) {
                                                        return Center(
                                                          child:
                                                              NoDataAvailableWidget(),
                                                        );
                                                      }

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            everythingg.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 0.0),
                                                        itemBuilder: (context,
                                                            everythinggIndex) {
                                                          final everythinggItem =
                                                              everythingg[
                                                                  everythinggIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            16.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          ListView(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        primary:
                                                                            false,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                0.0,
                                                                                2.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 70.0,
                                                                                  height: 70.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    image: DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: Image.network(
                                                                                        '\"500x500?doctor#1\"',
                                                                                      ).image,
                                                                                    ),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 200.0,
                                                                                    height: 200.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      getJsonField(
                                                                                        NewAPIsGroup.listMyClientsPractitionersMeClientsGetCall
                                                                                            .everyClient(
                                                                                              listViewListMyClientsPractitionersMeClientsGetResponse.jsonBody,
                                                                                            )!
                                                                                            .where((e) =>
                                                                                                getJsonField(
                                                                                                  everythinggItem,
                                                                                                  r'''$.client_id''',
                                                                                                ) ==
                                                                                                getJsonField(
                                                                                                  e,
                                                                                                  r'''$.id''',
                                                                                                ))
                                                                                            .toList()
                                                                                            .firstOrNull,
                                                                                        r'''$.profile_picture''',
                                                                                      ).toString(),
                                                                                      fit: BoxFit.cover,
                                                                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                        'assets/images/error_image.jpg',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        '${getJsonField(
                                                                                          NewAPIsGroup.listMyClientsPractitionersMeClientsGetCall
                                                                                              .everyClient(
                                                                                                listViewListMyClientsPractitionersMeClientsGetResponse.jsonBody,
                                                                                              )
                                                                                              ?.where((e) =>
                                                                                                  getJsonField(
                                                                                                    everythinggItem,
                                                                                                    r'''$.client_id''',
                                                                                                  ) ==
                                                                                                  getJsonField(
                                                                                                    e,
                                                                                                    r'''$.id''',
                                                                                                  ))
                                                                                              .toList()
                                                                                              .firstOrNull,
                                                                                          r'''$.first_name''',
                                                                                        ).toString()} ${getJsonField(
                                                                                          NewAPIsGroup.listMyClientsPractitionersMeClientsGetCall
                                                                                              .everyClient(
                                                                                                listViewListMyClientsPractitionersMeClientsGetResponse.jsonBody,
                                                                                              )
                                                                                              ?.where((e) =>
                                                                                                  getJsonField(
                                                                                                    everythinggItem,
                                                                                                    r'''$.client_id''',
                                                                                                  ) ==
                                                                                                  getJsonField(
                                                                                                    e,
                                                                                                    r'''$.id''',
                                                                                                  ))
                                                                                              .toList()
                                                                                              .firstOrNull,
                                                                                          r'''$.last_name''',
                                                                                        ).toString()}',
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 12.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                11.0,
                                                                                10.0,
                                                                                11.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'rlcwgxpz' /* Date */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions
                                                                                            .formatUtcDateTimeToLocal(getJsonField(
                                                                                              everythinggItem,
                                                                                              r'''$.start_time''',
                                                                                            ).toString())
                                                                                            .firstOrNull,
                                                                                        'Apr 05, 2025',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 10.0)),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 50.0,
                                                                                  child: VerticalDivider(
                                                                                    width: 10.0,
                                                                                    thickness: 2.0,
                                                                                    indent: 3.0,
                                                                                    endIndent: 3.0,
                                                                                    color: Color(0x4C050119),
                                                                                  ),
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'mle37itl' /* Time */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions
                                                                                            .formatUtcDateTimeToLocal(getJsonField(
                                                                                              everythinggItem,
                                                                                              r'''$.start_time''',
                                                                                            ).toString())
                                                                                            .lastOrNull,
                                                                                        '11:00 AM',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 10.0)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          12.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final everything = (NewAPIsGroup
                                                                  .viewMyAppointmentsCall
                                                                  .everything(
                                                                    listViewViewMyAppointmentsResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.where((e) =>
                                                                      _model
                                                                          .status
                                                                          .contains(
                                                                              getJsonField(
                                                                        e,
                                                                        r'''$.status''',
                                                                      ).toString()) &&
                                                                      (functions.convertIsoToUnixTimestamp(getJsonField(
                                                                            e,
                                                                            r'''$.start_time''',
                                                                          ).toString()) >
                                                                          getCurrentTimestamp.secondsSinceEpoch))
                                                                  .toList()
                                                                  .toList() ??
                                                              [])
                                                          .take(100)
                                                          .toList();
                                                      if (everything.isEmpty) {
                                                        return NoDataAvailableWidget();
                                                      }

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            everything.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 0.0),
                                                        itemBuilder: (context,
                                                            everythingIndex) {
                                                          final everythingItem =
                                                              everything[
                                                                  everythingIndex];
                                                          return Visibility(
                                                            visible: NewAPIsGroup
                                                                    .viewMyAppointmentsCall
                                                                    .everything(
                                                                      listViewViewMyAppointmentsResponse
                                                                          .jsonBody,
                                                                    )!
                                                                    .where((e) =>
                                                                        _model.status.contains(getJsonField(
                                                                          e,
                                                                          r'''$.status''',
                                                                        ).toString()) &&
                                                                        (functions.convertIsoToUnixTimestamp(getJsonField(
                                                                              e,
                                                                              r'''$.start_time''',
                                                                            ).toString()) <=
                                                                            getCurrentTimestamp.secondsSinceEpoch))
                                                                    .toList()
                                                                    .isNotEmpty
                                                                ? true
                                                                : false,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            ListView(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 70.0,
                                                                                    height: 70.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      image: DecorationImage(
                                                                                        fit: BoxFit.cover,
                                                                                        image: Image.network(
                                                                                          '\"500x500?doctor#1\"',
                                                                                        ).image,
                                                                                      ),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Container(
                                                                                      width: 200.0,
                                                                                      height: 200.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        getJsonField(
                                                                                          NewAPIsGroup.listMyClientsPractitionersMeClientsGetCall
                                                                                              .everyClient(
                                                                                                listViewListMyClientsPractitionersMeClientsGetResponse.jsonBody,
                                                                                              )!
                                                                                              .where((e) =>
                                                                                                  getJsonField(
                                                                                                    everythingItem,
                                                                                                    r'''$.client_id''',
                                                                                                  ) ==
                                                                                                  getJsonField(
                                                                                                    e,
                                                                                                    r'''$.id''',
                                                                                                  ))
                                                                                              .toList()
                                                                                              .firstOrNull,
                                                                                          r'''$.profile_picture''',
                                                                                        ).toString(),
                                                                                        fit: BoxFit.cover,
                                                                                        errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                          'assets/images/error_image.jpg',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          '${getJsonField(
                                                                                            NewAPIsGroup.listMyClientsPractitionersMeClientsGetCall
                                                                                                .everyClient(
                                                                                                  listViewListMyClientsPractitionersMeClientsGetResponse.jsonBody,
                                                                                                )
                                                                                                ?.where((e) =>
                                                                                                    getJsonField(
                                                                                                      everythingItem,
                                                                                                      r'''$.client_id''',
                                                                                                    ) ==
                                                                                                    getJsonField(
                                                                                                      e,
                                                                                                      r'''$.id''',
                                                                                                    ))
                                                                                                .toList()
                                                                                                .firstOrNull,
                                                                                            r'''$.first_name''',
                                                                                          ).toString()} ${getJsonField(
                                                                                            NewAPIsGroup.listMyClientsPractitionersMeClientsGetCall
                                                                                                .everyClient(
                                                                                                  listViewListMyClientsPractitionersMeClientsGetResponse.jsonBody,
                                                                                                )
                                                                                                ?.where((e) =>
                                                                                                    getJsonField(
                                                                                                      everythingItem,
                                                                                                      r'''$.client_id''',
                                                                                                    ) ==
                                                                                                    getJsonField(
                                                                                                      e,
                                                                                                      r'''$.id''',
                                                                                                    ))
                                                                                                .toList()
                                                                                                .firstOrNull,
                                                                                            r'''$.last_name''',
                                                                                          ).toString()}',
                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 12.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 11.0, 10.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'y9o79y3v' /* Date */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          functions
                                                                                              .formatUtcDateTimeToLocal(getJsonField(
                                                                                                everythingItem,
                                                                                                r'''$.start_time''',
                                                                                              ).toString())
                                                                                              .firstOrNull,
                                                                                          'Apr 05, 2025',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 10.0)),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 50.0,
                                                                                    child: VerticalDivider(
                                                                                      width: 10.0,
                                                                                      thickness: 2.0,
                                                                                      indent: 3.0,
                                                                                      endIndent: 3.0,
                                                                                      color: Color(0x4C050119),
                                                                                    ),
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ukoo86eq' /* Time */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          functions
                                                                                              .formatUtcDateTimeToLocal(getJsonField(
                                                                                                everythingItem,
                                                                                                r'''$.start_time''',
                                                                                              ).toString())
                                                                                              .lastOrNull,
                                                                                          '11:00 AM',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 10.0)),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                        child: FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            _model.acceptAppointment = await NewAPIsGroup.practitionerAcceptAppointmentCall.call(
                                                                                              appointmentId: getJsonField(
                                                                                                everythingItem,
                                                                                                r'''$.id''',
                                                                                              ).toString(),
                                                                                              xAccessToken: currentAuthenticationToken,
                                                                                            );

                                                                                            if ((_model.acceptAppointment?.succeeded ?? true)) {
                                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    'Appointment accepted successfully...',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  duration: Duration(milliseconds: 3500),
                                                                                                  backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                ),
                                                                                              );
                                                                                            } else {
                                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    getJsonField(
                                                                                                      (_model.acceptAppointment?.jsonBody ?? ''),
                                                                                                      r'''$.detail''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  duration: Duration(milliseconds: 3500),
                                                                                                  backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                                ),
                                                                                              );
                                                                                            }

                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            'yxiqnvd5' /* Accept */,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            width: double.infinity,
                                                                                            height: 50.0,
                                                                                            padding: EdgeInsets.all(8.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                ),
                                                                                            borderRadius: BorderRadius.circular(30.0),
                                                                                          ),
                                                                                          showLoadingIndicator: false,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                        child: FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            var _shouldSetState = false;
                                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                                  context: context,
                                                                                                  builder: (alertDialogContext) {
                                                                                                    return AlertDialog(
                                                                                                      title: Text('Reject Appointment Request'),
                                                                                                      content: Text('Are you sure you want to reject this appointment request?'),
                                                                                                      actions: [
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                          child: Text('No'),
                                                                                                        ),
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                          child: Text('Yes'),
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  },
                                                                                                ) ??
                                                                                                false;
                                                                                            if (confirmDialogResponse) {
                                                                                              _model.rejectAppointment = await NewAPIsGroup.practitionerRejectAppointmentCall.call(
                                                                                                appointmentId: getJsonField(
                                                                                                  everythingItem,
                                                                                                  r'''$.id''',
                                                                                                ).toString(),
                                                                                                xAccessToken: currentAuthenticationToken,
                                                                                              );

                                                                                              _shouldSetState = true;
                                                                                              if ((_model.rejectAppointment?.succeeded ?? true)) {
                                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Appointment rejected successfully...',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 3500),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                  ),
                                                                                                );
                                                                                              } else {
                                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      getJsonField(
                                                                                                        (_model.rejectAppointment?.jsonBody ?? ''),
                                                                                                        r'''$.detail''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 3500),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                            } else {
                                                                                              if (_shouldSetState) safeSetState(() {});
                                                                                              return;
                                                                                            }

                                                                                            if (_shouldSetState) safeSetState(() {});
                                                                                          },
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            'ipxrnq9c' /* Reject */,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            width: double.infinity,
                                                                                            height: 50.0,
                                                                                            padding: EdgeInsets.all(8.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                ),
                                                                                            borderRadius: BorderRadius.circular(30.0),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 10.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            12.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
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
              ],
            );
          },
        ),
      ),
    );
  }
}

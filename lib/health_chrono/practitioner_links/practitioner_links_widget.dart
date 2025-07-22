import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/health_chrono/link_search/link_search_widget.dart';
import '/health_chrono/no_data_available/no_data_available_widget.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'practitioner_links_model.dart';
export 'practitioner_links_model.dart';

class PractitionerLinksWidget extends StatefulWidget {
  const PractitionerLinksWidget({super.key});

  static String routeName = 'PractitionerLinks';
  static String routePath = '/practitionerLinks';

  @override
  State<PractitionerLinksWidget> createState() =>
      _PractitionerLinksWidgetState();
}

class _PractitionerLinksWidgetState extends State<PractitionerLinksWidget>
    with TickerProviderStateMixin {
  late PractitionerLinksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PractitionerLinksModel());

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
        safeSetState(() => _model.apiRequestCompleter1 = null);
        await _model.waitForApiRequestCompleted1();
        safeSetState(() => _model.apiRequestCompleter2 = null);
        await _model.waitForApiRequestCompleted2();
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
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
        floatingActionButton: Builder(
          builder: (context) => Padding(
            padding: EdgeInsets.all(12.0),
            child: FloatingActionButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: AlignmentDirectional(0.0, 0.5)
                          .resolve(Directionality.of(context)),
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(dialogContext).unfocus();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: LinkSearchWidget(),
                      ),
                    );
                  },
                );
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 10.0,
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).info,
                size: 30.0,
              ),
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
                            context
                                .goNamed(PractitionerDashboardWidget.routeName);
                          },
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '2eam7z2f' /* My Linked Clients */,
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
        body: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 1310.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 12.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: Container(
                        width: double.infinity,
                        height: 1310.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
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
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                backgroundColor: Color(0xFF2DB7A6),
                                unselectedBackgroundColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                unselectedBorderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 1.5,
                                borderRadius: 8.0,
                                elevation: 0.0,
                                buttonMargin: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                padding: EdgeInsets.all(16.0),
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'ejbrrw8y' /* Pending */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '2ott19jz' /* Active */,
                                    ),
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [
                                    () async {
                                      safeSetState(() =>
                                          _model.apiRequestCompleter1 = null);
                                      await _model
                                          .waitForApiRequestCompleted1();
                                    },
                                    () async {
                                      safeSetState(() =>
                                          _model.apiRequestCompleter2 = null);
                                      await _model
                                          .waitForApiRequestCompleted2();
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
                                    builder: (context) =>
                                        FutureBuilder<ApiCallResponse>(
                                      future: (_model.apiRequestCompleter1 ??=
                                              Completer<ApiCallResponse>()
                                                ..complete(NewAPIsGroup
                                                    .getMyPendingLinksLinksGetCall
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
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitCircle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        final pendingBQGetMyPendingLinksLinksGetResponse =
                                            snapshot.data!;

                                        return ListView(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Builder(
                                                builder: (context) {
                                                  final everythingPending =
                                                      (NewAPIsGroup
                                                                  .getMyPendingLinksLinksGetCall
                                                                  .everythingPending(
                                                                    pendingBQGetMyPendingLinksLinksGetResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.toList() ??
                                                              [])
                                                          .take(100)
                                                          .toList();
                                                  if (everythingPending
                                                      .isEmpty) {
                                                    return Center(
                                                      child:
                                                          NoDataAvailableWidget(),
                                                    );
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: everythingPending
                                                        .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 0.0),
                                                    itemBuilder: (context,
                                                        everythingPendingIndex) {
                                                      final everythingPendingItem =
                                                          everythingPending[
                                                              everythingPendingIndex];
                                                      return ListView(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        children: [
                                                          Padding(
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
                                                                                        everythingPendingItem,
                                                                                        r'''$.client.profile_picture''',
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
                                                                                          everythingPendingItem,
                                                                                          r'''$.client.first_name''',
                                                                                        ).toString()} ${getJsonField(
                                                                                          everythingPendingItem,
                                                                                          r'''$.client.last_name''',
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
                                                                                12.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'o03r7aup' /* Email */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          getJsonField(
                                                                                            everythingPendingItem,
                                                                                            r'''$.client.email''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 10.0)),
                                                                                    ),
                                                                                  ),
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
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'tjj1lper' /* Phone */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          getJsonField(
                                                                                            everythingPendingItem,
                                                                                            r'''$.client.contact_number''',
                                                                                          ).toString(),
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
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          if (_model
                                                                              .requestedBy
                                                                              .contains(getJsonField(
                                                                            everythingPendingItem,
                                                                            r'''$.requested_by''',
                                                                          ).toString()))
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                        child: FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            _model.pendingLink = await NewAPIsGroup.acceptLinkLinksLinkIdAcceptPostCall.call(
                                                                                              linkId: getJsonField(
                                                                                                everythingPendingItem,
                                                                                                r'''$.id''',
                                                                                              ).toString(),
                                                                                              xAccessToken: currentAuthenticationToken,
                                                                                            );

                                                                                            if ((_model.pendingLink?.succeeded ?? true)) {
                                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    'Link created successfully...',
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
                                                                                              safeSetState(() => _model.apiRequestCompleter1 = null);
                                                                                              await _model.waitForApiRequestCompleted1();
                                                                                            } else {
                                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    getJsonField(
                                                                                                      (_model.pendingLink?.jsonBody ?? ''),
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
                                                                                            'rbskg0ha' /* Accept */,
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
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                        child: FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            var _shouldSetState = false;
                                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                                  context: context,
                                                                                                  builder: (alertDialogContext) {
                                                                                                    return AlertDialog(
                                                                                                      title: Text('Cancel Link'),
                                                                                                      content: Text('Are you sure you want to reject this link request?'),
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
                                                                                              _model.pendingLinkReject = await NewAPIsGroup.rejectLinkLinksLinkIdRejectPostCall.call(
                                                                                                linkId: getJsonField(
                                                                                                  everythingPendingItem,
                                                                                                  r'''$.id''',
                                                                                                ).toString(),
                                                                                                xAccessToken: currentAuthenticationToken,
                                                                                              );

                                                                                              _shouldSetState = true;
                                                                                              if ((_model.pendingLinkReject?.succeeded ?? true)) {
                                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Link rejected successfully...',
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
                                                                                                safeSetState(() => _model.apiRequestCompleter1 = null);
                                                                                                await _model.waitForApiRequestCompleted1();
                                                                                              } else {
                                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      getJsonField(
                                                                                                        (_model.pendingLinkReject?.jsonBody ?? ''),
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
                                                                                            'vag46bmt' /* Reject */,
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
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) =>
                                        FutureBuilder<ApiCallResponse>(
                                      future: (_model.apiRequestCompleter2 ??=
                                              Completer<ApiCallResponse>()
                                                ..complete(NewAPIsGroup
                                                    .getActiveLinksLinksActiveGetCall
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
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitCircle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        final activeBQGetActiveLinksLinksActiveGetResponse =
                                            snapshot.data!;

                                        return ListView(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Builder(
                                                builder: (context) {
                                                  final evertyhingActive =
                                                      NewAPIsGroup
                                                              .getActiveLinksLinksActiveGetCall
                                                              .everythingActive(
                                                                activeBQGetActiveLinksLinksActiveGetResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.toList() ??
                                                          [];
                                                  if (evertyhingActive
                                                      .isEmpty) {
                                                    return Center(
                                                      child:
                                                          NoDataAvailableWidget(),
                                                    );
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        evertyhingActive.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 0.0),
                                                    itemBuilder: (context,
                                                        evertyhingActiveIndex) {
                                                      final evertyhingActiveItem =
                                                          evertyhingActive[
                                                              evertyhingActiveIndex];
                                                      return ListView(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        children: [
                                                          Padding(
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
                                                                                        evertyhingActiveItem,
                                                                                        r'''$.client.profile_picture''',
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
                                                                                          evertyhingActiveItem,
                                                                                          r'''$.client.first_name''',
                                                                                        ).toString()} ${getJsonField(
                                                                                          evertyhingActiveItem,
                                                                                          r'''$.client.last_name''',
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
                                                                                FlutterFlowIconButton(
                                                                                  borderRadius: 8.0,
                                                                                  buttonSize: 40.0,
                                                                                  icon: Icon(
                                                                                    Icons.delete,
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    size: 25.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    var _shouldSetState = false;
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              title: Text('Delete Link'),
                                                                                              content: Text('Are you sure you want to delete this link?'),
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
                                                                                      _model.deleteLink = await NewAPIsGroup.deleteLinkLinksLinkIdDeleteCall.call(
                                                                                        linkId: getJsonField(
                                                                                          evertyhingActiveItem,
                                                                                          r'''$.id''',
                                                                                        ).toString(),
                                                                                        xAccessToken: currentAuthenticationToken,
                                                                                      );

                                                                                      _shouldSetState = true;
                                                                                      if ((_model.deleteLink?.succeeded ?? true)) {
                                                                                        ScaffoldMessenger.of(context).clearSnackBars();
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Link deleted successfully...',
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
                                                                                        safeSetState(() => _model.apiRequestCompleter2 = null);
                                                                                        await _model.waitForApiRequestCompleted2();
                                                                                      } else {
                                                                                        ScaffoldMessenger.of(context).clearSnackBars();
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              getJsonField(
                                                                                                (_model.deleteLink?.jsonBody ?? ''),
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
                                                                                        '5vcgtfml' /* Email */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      getJsonField(
                                                                                        evertyhingActiveItem,
                                                                                        r'''$.client.email''',
                                                                                      ).toString(),
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
                                                                                        'x18qmwkv' /* Phone */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      getJsonField(
                                                                                        evertyhingActiveItem,
                                                                                        r'''$.client.contact_number''',
                                                                                      ).toString(),
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
                                                                                          'wcmksbun' /* Reschedule */,
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
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

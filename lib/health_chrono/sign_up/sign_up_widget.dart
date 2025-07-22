import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/health_chrono/privacy_policy/privacy_policy_widget.dart';
import '/health_chrono/termsand_conditions/termsand_conditions_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_up_model.dart';
export 'sign_up_model.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    super.key,
    required this.email,
    required this.contact,
    required this.sessionID,
    required this.role,
  });

  final String? email;
  final String? contact;
  final String? sessionID;
  final String? role;

  static String routeName = 'SignUp';
  static String routePath = '/signUp';

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget>
    with TickerProviderStateMixin {
  late SignUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.tabBarController!.animateTo(
          widget.role == 'user' ? 0 : 1,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.fnameClientCATextController ??= TextEditingController();
    _model.fnameClientCAFocusNode ??= FocusNode();

    _model.lnameClientCATextController ??= TextEditingController();
    _model.lnameClientCAFocusNode ??= FocusNode();

    _model.passwordClientCATextController ??= TextEditingController();
    _model.passwordClientCAFocusNode ??= FocusNode();

    _model.confirmPasswordClientCATextController ??= TextEditingController();
    _model.confirmPasswordClientCAFocusNode ??= FocusNode();

    _model.fnamePractitionerCATextController ??= TextEditingController();
    _model.fnamePractitionerCAFocusNode ??= FocusNode();

    _model.lnamePractitionerCATextController ??= TextEditingController();
    _model.lnamePractitionerCAFocusNode ??= FocusNode();

    _model.passwordPractitionerCATextController ??= TextEditingController();
    _model.passwordPractitionerCAFocusNode ??= FocusNode();

    _model.confirmPasswordPractitionerCATextController ??=
        TextEditingController();
    _model.confirmPasswordPractitionerCAFocusNode ??= FocusNode();

    _model.textController9 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController10 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController11 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController12 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController13 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController14 ??= TextEditingController();
    _model.textFieldFocusNode6 ??= FocusNode();

    _model.textController15 ??= TextEditingController();
    _model.textFieldFocusNode7 ??= FocusNode();

    _model.textController16 ??= TextEditingController();
    _model.textFieldFocusNode8 ??= FocusNode();

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
                            context.pop();
                          },
                        ),
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'p112f5ct' /* Create Account */,
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
                          '4mohut7o' /* Join us to track your health j... */,
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
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
            ))
              Container(
                width: MediaQuery.sizeOf(context).width * 0.45,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: Color(0xFF249689),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(48.0, 32.0, 48.0, 32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 200.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/AA272237-0DD4-4A26-9927-5A903A267F4E.png',
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'y2swlogg' /* Health Chrono */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .headlineMediumFamily,
                              color: FlutterFlowTheme.of(context).info,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .headlineMediumIsCustom,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'l48u6hpq' /* Your Personal Health Companion */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleLargeFamily,
                              color: FlutterFlowTheme.of(context).info,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .titleLargeIsCustom,
                            ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        decoration: BoxDecoration(
                          color: Color(0x33FFFFEE),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 15.0, 15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ytqnqfzq' /* Why Choose Health Monitor? */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleLargeFamily,
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleLargeIsCustom,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.verified_user,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      's6kk63kp' /* HIPAA Compliant Security */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.analytics,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'nv0o9d96' /* Advanced Health Analytics */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.sync,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '8wamjm0t' /* Real-time Health Monitoring */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD8B655),
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.devices,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'j644paej' /* Multi-device Support */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.031,
                        height: 1250.0,
                        constraints: BoxConstraints(
                          maxWidth: 600.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 24.0, 32.0, 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(0.0, 0),
                                      child: FlutterFlowButtonTabBar(
                                        useToggleButtonStyle: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleMediumIsCustom,
                                            ),
                                        unselectedLabelStyle: FlutterFlowTheme
                                                .of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleMediumIsCustom,
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
                                              'ho4tj62l' /* Client */,
                                            ),
                                          ),
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'khiwu4pi' /* Practitioner */,
                                            ),
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                        onTap: (i) async {
                                          [() async {}, () async {}][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        children: [
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  24.0,
                                                                  24.0,
                                                                  24.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Form(
                                                            key:
                                                                _model.formKey2,
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                TextFormField(
                                                                  controller: _model
                                                                      .fnameClientCATextController,
                                                                  focusNode: _model
                                                                      .fnameClientCAFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  textCapitalization:
                                                                      TextCapitalization
                                                                          .words,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'qjmq6jkq' /* First Name */,
                                                                    ),
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    suffixIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .person_outline,
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                  minLines: 1,
                                                                  validator: _model
                                                                      .fnameClientCATextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                  inputFormatters: [
                                                                    if (!isAndroid &&
                                                                        !isiOS)
                                                                      TextInputFormatter.withFunction(
                                                                          (oldValue,
                                                                              newValue) {
                                                                        return TextEditingValue(
                                                                          selection:
                                                                              newValue.selection,
                                                                          text: newValue
                                                                              .text
                                                                              .toCapitalization(TextCapitalization.words),
                                                                        );
                                                                      }),
                                                                    FilteringTextInputFormatter
                                                                        .allow(RegExp(
                                                                            '[a-zA-Z0-9]'))
                                                                  ],
                                                                ),
                                                                TextFormField(
                                                                  controller: _model
                                                                      .lnameClientCATextController,
                                                                  focusNode: _model
                                                                      .lnameClientCAFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  textCapitalization:
                                                                      TextCapitalization
                                                                          .words,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'd1er2gwd' /* Last Name */,
                                                                    ),
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    suffixIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .person_outline,
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                  minLines: 1,
                                                                  validator: _model
                                                                      .lnameClientCATextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                  inputFormatters: [
                                                                    if (!isAndroid &&
                                                                        !isiOS)
                                                                      TextInputFormatter.withFunction(
                                                                          (oldValue,
                                                                              newValue) {
                                                                        return TextEditingValue(
                                                                          selection:
                                                                              newValue.selection,
                                                                          text: newValue
                                                                              .text
                                                                              .toCapitalization(TextCapitalization.words),
                                                                        );
                                                                      }),
                                                                    FilteringTextInputFormatter
                                                                        .allow(RegExp(
                                                                            '[a-zA-Z0-9]'))
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            _model.showGenderTextError
                                                                                ? FlutterFlowTheme.of(context).error
                                                                                : FlutterFlowTheme.of(context).info,
                                                                            FlutterFlowTheme.of(context).info,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      child: FlutterFlowDropDown<
                                                                          String>(
                                                                        controller:
                                                                            _model.genderClientCAValueController ??=
                                                                                FormFieldController<String>(
                                                                          _model.genderClientCAValue ??=
                                                                              '',
                                                                        ),
                                                                        options:
                                                                            List<String>.from([
                                                                          'Male',
                                                                          'Female',
                                                                          'Other'
                                                                        ]),
                                                                        optionLabels: [
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'wolgcyq1' /* Male */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '6yvjem9l' /* Female */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'oorfy6zs' /* Other */,
                                                                          )
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          safeSetState(() =>
                                                                              _model.genderClientCAValue = val);
                                                                          _model.showGenderTextError =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            48.0,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          't5v0bziw' /* Select Gender */,
                                                                        ),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                        borderWidth:
                                                                            1.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isOverButton:
                                                                            false,
                                                                        isSearchable:
                                                                            false,
                                                                        isMultiSelect:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                    if (_model
                                                                        .showGenderTextError)
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '4y9fz3ov' /* Field is required... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          5.0)),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            _model.showDOBTextError
                                                                                ? FlutterFlowTheme.of(context).error
                                                                                : FlutterFlowTheme.of(context).info,
                                                                            FlutterFlowTheme.of(context).info,
                                                                          ),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            final _datePicked1Date =
                                                                                await showDatePicker(
                                                                              context: context,
                                                                              initialDate: functions.getMaxDate(),
                                                                              firstDate: DateTime(1900),
                                                                              lastDate: (functions.getMaxDate() ?? DateTime(2050)),
                                                                              builder: (context, child) {
                                                                                return wrapInMaterialDatePickerTheme(
                                                                                  context,
                                                                                  child!,
                                                                                  headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                  headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                  headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                        fontSize: 32.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).headlineLargeIsCustom,
                                                                                      ),
                                                                                  pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                  selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                  selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                  actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                  iconSize: 24.0,
                                                                                );
                                                                              },
                                                                            );

                                                                            if (_datePicked1Date !=
                                                                                null) {
                                                                              safeSetState(() {
                                                                                _model.datePicked1 = DateTime(
                                                                                  _datePicked1Date.year,
                                                                                  _datePicked1Date.month,
                                                                                  _datePicked1Date.day,
                                                                                );
                                                                              });
                                                                            } else if (_model.datePicked1 !=
                                                                                null) {
                                                                              safeSetState(() {
                                                                                _model.datePicked1 = functions.getMaxDate();
                                                                              });
                                                                            }
                                                                            _model.showDOBTextError =
                                                                                false;
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      dateTimeFormat(
                                                                                        "yyyy-MM-dd",
                                                                                        _model.datePicked1,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      'Date of Birth',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsets.all(10.0),
                                                                                child: Icon(
                                                                                  Icons.calendar_today,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (_model
                                                                        .showDOBTextError)
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'qlfn1z53' /* Field is required... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          5.0)),
                                                                ),
                                                                FutureBuilder<
                                                                    ApiCallResponse>(
                                                                  future: NewAPIsGroup
                                                                      .listTimezonesTimezonesGetCall
                                                                      .call(),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              40.0,
                                                                          height:
                                                                              40.0,
                                                                          child:
                                                                              SpinKitCircle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                40.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final listViewListTimezonesTimezonesGetResponse =
                                                                        snapshot
                                                                            .data!;

                                                                    return ListView(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: valueOrDefault<Color>(
                                                                                _model.showGenderTextError ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).info,
                                                                                FlutterFlowTheme.of(context).info,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              FlutterFlowDropDown<String>(
                                                                            controller: _model.timezoneClientCAValueController ??=
                                                                                FormFieldController<String>(null),
                                                                            options:
                                                                                NewAPIsGroup.listTimezonesTimezonesGetCall.name(
                                                                              listViewListTimezonesTimezonesGetResponse.jsonBody,
                                                                            )!,
                                                                            onChanged:
                                                                                (val) async {
                                                                              safeSetState(() => _model.timezoneClientCAValue = val);
                                                                              _model.showTimeZoneTextError = false;
                                                                              safeSetState(() {});
                                                                            },
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                48.0,
                                                                            searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                ),
                                                                            searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '2ksqlvjs' /* Select Timezone */,
                                                                            ),
                                                                            searchHintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'qnyjpgiy' /* Search... */,
                                                                            ),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            borderWidth:
                                                                                1.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isOverButton:
                                                                                false,
                                                                            isSearchable:
                                                                                true,
                                                                            isMultiSelect:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                        if (_model.showTimeZoneTextError ??
                                                                            true)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'plhjp5wg' /* Field is required... */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                widget.contact,
                                                                                'Phone Number',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(10.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.phone_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                widget.email,
                                                                                'Email',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(10.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.mail_outline_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                TextFormField(
                                                                  controller: _model
                                                                      .passwordClientCATextController,
                                                                  focusNode: _model
                                                                      .passwordClientCAFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  obscureText:
                                                                      !_model
                                                                          .passwordClientCAVisibility,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '2vin7q4t' /* Password */,
                                                                    ),
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    suffixIcon:
                                                                        InkWell(
                                                                      onTap: () =>
                                                                          safeSetState(
                                                                        () => _model.passwordClientCAVisibility =
                                                                            !_model.passwordClientCAVisibility,
                                                                      ),
                                                                      focusNode:
                                                                          FocusNode(
                                                                              skipTraversal: true),
                                                                      child:
                                                                          Icon(
                                                                        _model.passwordClientCAVisibility
                                                                            ? Icons.visibility_outlined
                                                                            : Icons.visibility_off_outlined,
                                                                        size:
                                                                            22,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                  minLines: 1,
                                                                  validator: _model
                                                                      .passwordClientCATextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                                TextFormField(
                                                                  controller: _model
                                                                      .confirmPasswordClientCATextController,
                                                                  focusNode: _model
                                                                      .confirmPasswordClientCAFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .done,
                                                                  obscureText:
                                                                      !_model
                                                                          .confirmPasswordClientCAVisibility,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'jaahnp4n' /* Confirm Password */,
                                                                    ),
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    suffixIcon:
                                                                        InkWell(
                                                                      onTap: () =>
                                                                          safeSetState(
                                                                        () => _model.confirmPasswordClientCAVisibility =
                                                                            !_model.confirmPasswordClientCAVisibility,
                                                                      ),
                                                                      focusNode:
                                                                          FocusNode(
                                                                              skipTraversal: true),
                                                                      child:
                                                                          Icon(
                                                                        _model.confirmPasswordClientCAVisibility
                                                                            ? Icons.visibility_outlined
                                                                            : Icons.visibility_off_outlined,
                                                                        size:
                                                                            22,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                  minLines: 1,
                                                                  validator: _model
                                                                      .confirmPasswordClientCATextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      20.0)),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 20.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 10.0, 5.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      if (_model.formKey2
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey2
                                                              .currentState!
                                                              .validate()) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .genderClientCAValue ==
                                                          null) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .clearSnackBars();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Gender field is required...',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                    1500),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                        );
                                                        return;
                                                      }
                                                      if (_model
                                                              .passwordClientCATextController
                                                              .text ==
                                                          _model
                                                              .confirmPasswordClientCATextController
                                                              .text) {
                                                        _model.registerClient =
                                                            await NewAPIsGroup
                                                                .registerWithTokenRegisterPostCall
                                                                .call(
                                                          token:
                                                              widget.sessionID,
                                                          fname: _model
                                                              .fnameClientCATextController
                                                              .text,
                                                          lname: _model
                                                              .lnameClientCATextController
                                                              .text,
                                                          password: _model
                                                              .passwordClientCATextController
                                                              .text,
                                                          confirmPassword: _model
                                                              .confirmPasswordClientCATextController
                                                              .text,
                                                          dob: dateTimeFormat(
                                                            "yyyy-MM-dd",
                                                            _model.datePicked1,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          gender: _model
                                                              .genderClientCAValue,
                                                          timezone: _model
                                                              .timezoneClientCAValue,
                                                        );

                                                        if ((_model
                                                                .registerClient
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
                                                                'Registration successful...',
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

                                                          context.goNamed(
                                                              LoginWidget
                                                                  .routeName);
                                                        } else {
                                                          if (_model.genderClientCAValue !=
                                                                      null &&
                                                                  _model.genderClientCAValue !=
                                                                      ''
                                                              ? true
                                                              : false) {
                                                            if (dateTimeFormat(
                                                                      "yyyy-MM-dd",
                                                                      _model
                                                                          .datePicked1,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ) ==
                                                                    ''
                                                                ? false
                                                                : true) {
                                                              if (_model.timezoneClientCAValue !=
                                                                          null &&
                                                                      _model.timezoneClientCAValue !=
                                                                          ''
                                                                  ? true
                                                                  : false) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .clearSnackBars();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      getJsonField(
                                                                        (_model.registerClient?.jsonBody ??
                                                                            ''),
                                                                        r'''$.detail''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3500),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                );
                                                              } else {
                                                                _model.showTimeZoneTextError =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .clearSnackBars();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      getJsonField(
                                                                        (_model.registerClient?.jsonBody ??
                                                                            ''),
                                                                        r'''$.detail''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3500),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                );
                                                              }
                                                            } else {
                                                              _model.showDOBTextError =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .clearSnackBars();
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    getJsonField(
                                                                      (_model.registerClient
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.detail''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
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
                                                            _model.showGenderTextError =
                                                                true;
                                                            safeSetState(() {});
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .clearSnackBars();
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  getJsonField(
                                                                    (_model.registerClient
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.detail''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
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
                                                              'Password and Confirm Password fields don\'t match...',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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

                                                      safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'ik5jq9xm' /* Sign Up */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 56.0,
                                                      padding:
                                                          EdgeInsets.all(0.0),
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
                                                              .titleLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLargeIsCustom,
                                                              ),
                                                      elevation: 3.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                ),
                                                Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 0.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '9y7qmas7' /* By creating an account, you ar... */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                    Builder(
                                                      builder: (context) =>
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
                                                          await showAlignedDialog(
                                                            context: context,
                                                            isGlobal: false,
                                                            avoidOverflow: true,
                                                            targetAnchor:
                                                                AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                            followerAnchor:
                                                                AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                            builder:
                                                                (dialogContext) {
                                                              return Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        550.0,
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        TermsandConditionsWidget(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'i7olfo6d' /* Terms & Conditions */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'tyfsi3bq' /*  and  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                    Builder(
                                                      builder: (context) =>
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
                                                          await showAlignedDialog(
                                                            context: context,
                                                            isGlobal: false,
                                                            avoidOverflow: true,
                                                            targetAnchor:
                                                                AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                            followerAnchor:
                                                                AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                            builder:
                                                                (dialogContext) {
                                                              return Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        550.0,
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        PrivacyPolicyWidget(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '49wi9d2t' /* Privacy Policy */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'tc152fsr' /* Already have an account?  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
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
                                                        context.pushNamed(
                                                            LoginWidget
                                                                .routeName);
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'wyki395q' /* Sign In */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ].divide(SizedBox(height: 20.0)),
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Container(
                                              width: double.infinity,
                                              height: 1400.0,
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 22.0,
                                                                0.0, 40.0),
                                                    child: PageView(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      controller: _model
                                                              .pageViewController ??=
                                                          PageController(
                                                              initialPage: 0),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'ro7rzn4b' /* Practitioner Details */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .headlineSmallIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Form(
                                                                      key: _model
                                                                          .formKey1,
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .disabled,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            24.0,
                                                                            24.0,
                                                                            24.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            TextFormField(
                                                                              controller: _model.fnamePractitionerCATextController,
                                                                              focusNode: _model.fnamePractitionerCAFocusNode,
                                                                              autofocus: false,
                                                                              textCapitalization: TextCapitalization.words,
                                                                              textInputAction: TextInputAction.next,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'w21l3if1' /* First Name */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                suffixIcon: Icon(
                                                                                  Icons.person_outline,
                                                                                ),
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                  ),
                                                                              minLines: 1,
                                                                              validator: _model.fnamePractitionerCATextControllerValidator.asValidator(context),
                                                                              inputFormatters: [
                                                                                if (!isAndroid && !isiOS)
                                                                                  TextInputFormatter.withFunction((oldValue, newValue) {
                                                                                    return TextEditingValue(
                                                                                      selection: newValue.selection,
                                                                                      text: newValue.text.toCapitalization(TextCapitalization.words),
                                                                                    );
                                                                                  }),
                                                                                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
                                                                              ],
                                                                            ),
                                                                            TextFormField(
                                                                              controller: _model.lnamePractitionerCATextController,
                                                                              focusNode: _model.lnamePractitionerCAFocusNode,
                                                                              autofocus: false,
                                                                              textCapitalization: TextCapitalization.words,
                                                                              textInputAction: TextInputAction.next,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'bfpzgfos' /* Last Name */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                suffixIcon: Icon(
                                                                                  Icons.person_outline,
                                                                                ),
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                  ),
                                                                              minLines: 1,
                                                                              validator: _model.lnamePractitionerCATextControllerValidator.asValidator(context),
                                                                              inputFormatters: [
                                                                                if (!isAndroid && !isiOS)
                                                                                  TextInputFormatter.withFunction((oldValue, newValue) {
                                                                                    return TextEditingValue(
                                                                                      selection: newValue.selection,
                                                                                      text: newValue.text.toCapitalization(TextCapitalization.words),
                                                                                    );
                                                                                  }),
                                                                                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
                                                                              ],
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: valueOrDefault<Color>(
                                                                                        _model.showGenderTextError ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).info,
                                                                                        FlutterFlowTheme.of(context).info,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  child: FlutterFlowDropDown<String>(
                                                                                    controller: _model.genderPractitionerCAValueController ??= FormFieldController<String>(
                                                                                      _model.genderPractitionerCAValue ??= '',
                                                                                    ),
                                                                                    options: List<String>.from([
                                                                                      'Male',
                                                                                      'Female',
                                                                                      'Other'
                                                                                    ]),
                                                                                    optionLabels: [
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'xumd8005' /* Male */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'wxzomt78' /* Female */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'p79uhhk8' /* Other */,
                                                                                      )
                                                                                    ],
                                                                                    onChanged: (val) async {
                                                                                      safeSetState(() => _model.genderPractitionerCAValue = val);
                                                                                      _model.showGenderTextError = false;
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 48.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                      'kzx9y4d9' /* Select Gender */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    elevation: 2.0,
                                                                                    borderColor: FlutterFlowTheme.of(context).info,
                                                                                    borderWidth: 1.0,
                                                                                    borderRadius: 8.0,
                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                    hidesUnderline: true,
                                                                                    isOverButton: false,
                                                                                    isSearchable: false,
                                                                                    isMultiSelect: false,
                                                                                  ),
                                                                                ),
                                                                                if (_model.showGenderTextError)
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'z0pv4lu1' /* Field is required... */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ].divide(SizedBox(height: 5.0)),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: 50.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: valueOrDefault<Color>(
                                                                                        _model.showDOBTextError ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).info,
                                                                                        FlutterFlowTheme.of(context).info,
                                                                                      ),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        final _datePicked2Date = await showDatePicker(
                                                                                          context: context,
                                                                                          initialDate: functions.getMaxDate(),
                                                                                          firstDate: DateTime(1900),
                                                                                          lastDate: (functions.getMaxDate() ?? DateTime(2050)),
                                                                                          builder: (context, child) {
                                                                                            return wrapInMaterialDatePickerTheme(
                                                                                              context,
                                                                                              child!,
                                                                                              headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                              headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                              headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                                    fontSize: 32.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).headlineLargeIsCustom,
                                                                                                  ),
                                                                                              pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                              selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                              selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                              actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                              iconSize: 24.0,
                                                                                            );
                                                                                          },
                                                                                        );

                                                                                        if (_datePicked2Date != null) {
                                                                                          safeSetState(() {
                                                                                            _model.datePicked2 = DateTime(
                                                                                              _datePicked2Date.year,
                                                                                              _datePicked2Date.month,
                                                                                              _datePicked2Date.day,
                                                                                            );
                                                                                          });
                                                                                        } else if (_model.datePicked2 != null) {
                                                                                          safeSetState(() {
                                                                                            _model.datePicked2 = functions.getMaxDate();
                                                                                          });
                                                                                        }
                                                                                        _model.showDOBTextError = false;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  dateTimeFormat(
                                                                                                    "yyyy-MM-dd",
                                                                                                    _model.datePicked2,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  ),
                                                                                                  'Date of Birth',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsets.all(10.0),
                                                                                            child: Icon(
                                                                                              Icons.calendar_today,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if (_model.showDOBTextError)
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'eevppkgi' /* Field is required... */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ].divide(SizedBox(height: 5.0)),
                                                                            ),
                                                                            FutureBuilder<ApiCallResponse>(
                                                                              future: NewAPIsGroup.listTimezonesTimezonesGetCall.call(),
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
                                                                                final listViewListTimezonesTimezonesGetResponse = snapshot.data!;

                                                                                return ListView(
                                                                                  padding: EdgeInsets.zero,
                                                                                  primary: false,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  children: [
                                                                                    Container(
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: valueOrDefault<Color>(
                                                                                            _model.showTimeZoneTextError! ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).info,
                                                                                            FlutterFlowTheme.of(context).info,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      child: FlutterFlowDropDown<String>(
                                                                                        controller: _model.timezonePractitionerCAValueController ??= FormFieldController<String>(null),
                                                                                        options: NewAPIsGroup.listTimezonesTimezonesGetCall.name(
                                                                                          listViewListTimezonesTimezonesGetResponse.jsonBody,
                                                                                        )!,
                                                                                        onChanged: (val) async {
                                                                                          safeSetState(() => _model.timezonePractitionerCAValue = val);
                                                                                          _model.showTimeZoneTextError = false;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: 48.0,
                                                                                        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                            ),
                                                                                        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'm6ykttwv' /* Select Timezone */,
                                                                                        ),
                                                                                        searchHintText: FFLocalizations.of(context).getText(
                                                                                          'b21vnc3x' /* Search... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).info,
                                                                                        borderWidth: 1.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: false,
                                                                                        isSearchable: true,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                    ),
                                                                                    if (_model.showTimeZoneTextError ?? true)
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '8qvu2q46' /* Field is required... */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            widget.contact,
                                                                                            'Phone Number',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsets.all(10.0),
                                                                                      child: Icon(
                                                                                        Icons.phone_sharp,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 20.0,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            widget.email,
                                                                                            'Email',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsets.all(10.0),
                                                                                      child: Icon(
                                                                                        Icons.mail_outline_rounded,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 20.0,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            TextFormField(
                                                                              controller: _model.passwordPractitionerCATextController,
                                                                              focusNode: _model.passwordPractitionerCAFocusNode,
                                                                              autofocus: false,
                                                                              textInputAction: TextInputAction.next,
                                                                              obscureText: !_model.passwordPractitionerCAVisibility,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  '7ns30vuu' /* Password */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                suffixIcon: InkWell(
                                                                                  onTap: () => safeSetState(
                                                                                    () => _model.passwordPractitionerCAVisibility = !_model.passwordPractitionerCAVisibility,
                                                                                  ),
                                                                                  focusNode: FocusNode(skipTraversal: true),
                                                                                  child: Icon(
                                                                                    _model.passwordPractitionerCAVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                                                                    size: 22,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                  ),
                                                                              minLines: 1,
                                                                              validator: _model.passwordPractitionerCATextControllerValidator.asValidator(context),
                                                                            ),
                                                                            TextFormField(
                                                                              controller: _model.confirmPasswordPractitionerCATextController,
                                                                              focusNode: _model.confirmPasswordPractitionerCAFocusNode,
                                                                              autofocus: false,
                                                                              textInputAction: TextInputAction.done,
                                                                              obscureText: !_model.confirmPasswordPractitionerCAVisibility,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'dsbqno33' /* Confirm Password */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                suffixIcon: InkWell(
                                                                                  onTap: () => safeSetState(
                                                                                    () => _model.confirmPasswordPractitionerCAVisibility = !_model.confirmPasswordPractitionerCAVisibility,
                                                                                  ),
                                                                                  focusNode: FocusNode(skipTraversal: true),
                                                                                  child: Icon(
                                                                                    _model.confirmPasswordPractitionerCAVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                                                                    size: 22,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                  ),
                                                                              minLines: 1,
                                                                              validator: _model.confirmPasswordPractitionerCATextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ].divide(SizedBox(height: 20.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if (_model.formKey1
                                                                              .currentState ==
                                                                          null ||
                                                                      !_model
                                                                          .formKey1
                                                                          .currentState!
                                                                          .validate()) {
                                                                    return;
                                                                  }
                                                                  if (_model
                                                                          .genderPractitionerCAValue ==
                                                                      null) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .clearSnackBars();
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Gender field is required...',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 1000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                      ),
                                                                    );
                                                                    return;
                                                                  }
                                                                  if (_model
                                                                          .passwordPractitionerCATextController
                                                                          .text ==
                                                                      _model
                                                                          .confirmPasswordPractitionerCATextController
                                                                          .text) {
                                                                    _model.registerPractitioner =
                                                                        await NewAPIsGroup
                                                                            .registerWithTokenRegisterPostCall
                                                                            .call(
                                                                      token: widget
                                                                          .sessionID,
                                                                      fname: _model
                                                                          .fnamePractitionerCATextController
                                                                          .text,
                                                                      lname: _model
                                                                          .lnamePractitionerCATextController
                                                                          .text,
                                                                      password: _model
                                                                          .passwordPractitionerCATextController
                                                                          .text,
                                                                      confirmPassword: _model
                                                                          .confirmPasswordPractitionerCATextController
                                                                          .text,
                                                                      dob:
                                                                          dateTimeFormat(
                                                                        "yyyy-MM-dd",
                                                                        _model
                                                                            .datePicked2,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      gender: _model
                                                                          .genderPractitionerCAValue,
                                                                      timezone:
                                                                          _model
                                                                              .timezonePractitionerCAValue,
                                                                    );

                                                                    if ((_model
                                                                            .registerPractitioner
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .clearSnackBars();
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Registration successful...',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 3500),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                      );

                                                                      context.goNamed(
                                                                          LoginWidget
                                                                              .routeName);
                                                                    } else {
                                                                      if (_model.genderPractitionerCAValue != null &&
                                                                              _model.genderPractitionerCAValue != ''
                                                                          ? true
                                                                          : false) {
                                                                        if (dateTimeFormat(
                                                                                  "yyyy-MM-dd",
                                                                                  _model.datePicked2,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ) ==
                                                                                ''
                                                                            ? false
                                                                            : true) {
                                                                          if (_model.timezonePractitionerCAValue != null &&
                                                                              _model.timezonePractitionerCAValue != '') {
                                                                            ScaffoldMessenger.of(context).clearSnackBars();
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  getJsonField(
                                                                                    (_model.registerPractitioner?.jsonBody ?? ''),
                                                                                    r'''$.detail''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 3500),
                                                                                backgroundColor: FlutterFlowTheme.of(context).error,
                                                                              ),
                                                                            );
                                                                          } else {
                                                                            _model.showTimeZoneTextError =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            ScaffoldMessenger.of(context).clearSnackBars();
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  getJsonField(
                                                                                    (_model.registerPractitioner?.jsonBody ?? ''),
                                                                                    r'''$.detail''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 3500),
                                                                                backgroundColor: FlutterFlowTheme.of(context).error,
                                                                              ),
                                                                            );
                                                                          }
                                                                        } else {
                                                                          _model.showDOBTextError =
                                                                              true;
                                                                          safeSetState(
                                                                              () {});
                                                                          ScaffoldMessenger.of(context)
                                                                              .clearSnackBars();
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                getJsonField(
                                                                                  (_model.registerPractitioner?.jsonBody ?? ''),
                                                                                  r'''$.detail''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 3500),
                                                                              backgroundColor: FlutterFlowTheme.of(context).error,
                                                                            ),
                                                                          );
                                                                        }
                                                                      } else {
                                                                        _model.showGenderTextError =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                        ScaffoldMessenger.of(context)
                                                                            .clearSnackBars();
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              getJsonField(
                                                                                (_model.registerPractitioner?.jsonBody ?? ''),
                                                                                r'''$.detail''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 3500),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).error,
                                                                          ),
                                                                        );
                                                                      }
                                                                    }
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .clearSnackBars();
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Password and Confirm Password fields don\'t match...',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 3500),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).error,
                                                                      ),
                                                                    );
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '9w26y6vc' /* Sign Up */,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 56.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleLargeIsCustom,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                              ),
                                                            ),
                                                            Wrap(
                                                              spacing: 0.0,
                                                              runSpacing: 0.0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '4b8th5fi' /* By creating an account, you ar... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showAlignedDialog(
                                                                        context:
                                                                            context,
                                                                        isGlobal:
                                                                            false,
                                                                        avoidOverflow:
                                                                            true,
                                                                        targetAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        followerAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Container(
                                                                                height: 550.0,
                                                                                width: double.infinity,
                                                                                child: TermsandConditionsWidget(),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '8yfzbvgr' /* Terms & Conditions */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ki9j3yn0' /*  and  */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showAlignedDialog(
                                                                        context:
                                                                            context,
                                                                        isGlobal:
                                                                            false,
                                                                        avoidOverflow:
                                                                            true,
                                                                        targetAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        followerAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Container(
                                                                                height: 550.0,
                                                                                width: double.infinity,
                                                                                child: PrivacyPolicyWidget(),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '14npaaz4' /* Privacy Policy */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'y2rey9z5' /* Already have an account?  */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context.pushNamed(
                                                                        LoginWidget
                                                                            .routeName);
                                                                  },
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '2o313cg4' /* Sign In */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          decoration:
                                                                              TextDecoration.underline,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 4.0)),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 20.0)),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'jpm5t1xq' /* Practitioner Information */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .headlineSmallIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          24.0,
                                                                          24.0,
                                                                          24.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                        multiSelectController: _model
                                                                            .dropDownValueController1 ??= FormListFieldController<
                                                                                String>(
                                                                            null),
                                                                        options: [
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '4r3le09c' /* Option 1 */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'thpdosx2' /* Option 2 */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '69uouvr2' /* Option 3 */,
                                                                          )
                                                                        ],
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            50.0,
                                                                        searchHintTextStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                            ),
                                                                        searchTextStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'hcp7e9gb' /* Practitioner Type(s) */,
                                                                        ),
                                                                        searchHintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'b48ooe3i' /* Search... */,
                                                                        ),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderWidth:
                                                                            0.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isOverButton:
                                                                            false,
                                                                        isSearchable:
                                                                            true,
                                                                        isMultiSelect:
                                                                            true,
                                                                        onMultiSelectChanged:
                                                                            (val) =>
                                                                                safeSetState(() => _model.dropDownValue1 = val),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              90.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(13.0, 10.0, 10.0, 0.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'br5v0ih0' /* Are you medically licensed in ... */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-0.3, -1.0),
                                                                                child: FlutterFlowRadioButton(
                                                                                  options: [
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'pt9c4v4b' /* Yes */,
                                                                                    ),
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '65rbnx1s' /* No */,
                                                                                    )
                                                                                  ].toList(),
                                                                                  onChanged: (val) => safeSetState(() {}),
                                                                                  controller: _model.radioButtonValueController1 ??= FormFieldController<String>(null),
                                                                                  optionHeight: 32.0,
                                                                                  optionWidth: 100.0,
                                                                                  textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                      ),
                                                                                  selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                  buttonPosition: RadioButtonPosition.left,
                                                                                  direction: Axis.horizontal,
                                                                                  radioButtonColor: FlutterFlowTheme.of(context).primary,
                                                                                  inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  toggleable: false,
                                                                                  horizontalAlignment: WrapAlignment.start,
                                                                                  verticalAlignment: WrapCrossAlignment.start,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 5.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (_model
                                                                              .radioButtonValue1 ==
                                                                          'Yes')
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.textController9,
                                                                            focusNode:
                                                                                _model.textFieldFocusNode1,
                                                                            autofocus:
                                                                                false,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: false,
                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                'got1n3iy' /* Type in your registration numb... */,
                                                                              ),
                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                  ),
                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                  ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              errorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              filled: true,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            maxLines:
                                                                                null,
                                                                            cursorColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            validator:
                                                                                _model.textController9Validator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              90.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(13.0, 10.0, 10.0, 0.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'm2sogv2n' /* Are you non-medically licensed... */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-0.3, -1.0),
                                                                                child: FlutterFlowRadioButton(
                                                                                  options: [
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'n61skv3n' /* Yes */,
                                                                                    ),
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'rw2ugkmc' /* No */,
                                                                                    )
                                                                                  ].toList(),
                                                                                  onChanged: (val) => safeSetState(() {}),
                                                                                  controller: _model.radioButtonValueController2 ??= FormFieldController<String>(null),
                                                                                  optionHeight: 32.0,
                                                                                  optionWidth: 100.0,
                                                                                  textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                      ),
                                                                                  selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                  buttonPosition: RadioButtonPosition.left,
                                                                                  direction: Axis.horizontal,
                                                                                  radioButtonColor: FlutterFlowTheme.of(context).primary,
                                                                                  inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  toggleable: false,
                                                                                  horizontalAlignment: WrapAlignment.start,
                                                                                  verticalAlignment: WrapCrossAlignment.start,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 5.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (_model
                                                                              .radioButtonValue2 ==
                                                                          'Yes')
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.textController10,
                                                                            focusNode:
                                                                                _model.textFieldFocusNode2,
                                                                            autofocus:
                                                                                false,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: false,
                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                'rw7fru4h' /* What type of license? */,
                                                                              ),
                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                  ),
                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                  ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              errorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              filled: true,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            cursorColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            validator:
                                                                                _model.textController10Validator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            20.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 10.0)),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'ny2hl68r' /* Business Information */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .headlineSmallIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          24.0,
                                                                          24.0,
                                                                          24.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.textController11,
                                                                          focusNode:
                                                                              _model.textFieldFocusNode3,
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                false,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'ksqi2tii' /* Business Name */,
                                                                            ),
                                                                            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          validator: _model
                                                                              .textController11Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.textController12,
                                                                          focusNode:
                                                                              _model.textFieldFocusNode4,
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                false,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'ix0tvbaw' /* Phone Number */,
                                                                            ),
                                                                            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          validator: _model
                                                                              .textController12Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.textController13,
                                                                          focusNode:
                                                                              _model.textFieldFocusNode5,
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                false,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'hdvyfwka' /* City */,
                                                                            ),
                                                                            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          validator: _model
                                                                              .textController13Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.textController14,
                                                                          focusNode:
                                                                              _model.textFieldFocusNode6,
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                false,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '9444lr14' /* State */,
                                                                            ),
                                                                            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          validator: _model
                                                                              .textController14Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.textController15,
                                                                          focusNode:
                                                                              _model.textFieldFocusNode7,
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                false,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'giu8i2ja' /* Province */,
                                                                            ),
                                                                            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          validator: _model
                                                                              .textController15Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.textController16,
                                                                          focusNode:
                                                                              _model.textFieldFocusNode8,
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                false,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'ngw5x8do' /* Country */,
                                                                            ),
                                                                            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          validator: _model
                                                                              .textController16Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              110.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(13.0, 10.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'uj7gcubo' /* Type of Business */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-0.5, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(2.0),
                                                                                  child: FlutterFlowRadioButton(
                                                                                    options: [
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'quw4jbv0' /* Personal Business */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'ecrdulh7' /* Another Organization */,
                                                                                      )
                                                                                    ].toList(),
                                                                                    onChanged: (val) => safeSetState(() {}),
                                                                                    controller: _model.radioButtonValueController3 ??= FormFieldController<String>(null),
                                                                                    optionHeight: 32.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                        ),
                                                                                    selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                    buttonPosition: RadioButtonPosition.left,
                                                                                    direction: Axis.vertical,
                                                                                    radioButtonColor: FlutterFlowTheme.of(context).primary,
                                                                                    inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                    toggleable: false,
                                                                                    horizontalAlignment: WrapAlignment.start,
                                                                                    verticalAlignment: WrapCrossAlignment.start,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 5.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                        controller:
                                                                            _model.dropDownValueController2 ??=
                                                                                FormFieldController<String>(
                                                                          _model.dropDownValue2 ??=
                                                                              '',
                                                                        ),
                                                                        options:
                                                                            List<String>.from([
                                                                          '1 - 3',
                                                                          '4 - 10',
                                                                          '10+'
                                                                        ]),
                                                                        optionLabels: [
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'ghz2ysjh' /* 1 - 3 */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'x2crqfi5' /* 4 - 10 */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '9iyqiud2' /* 10+ */,
                                                                          )
                                                                        ],
                                                                        onChanged:
                                                                            (val) =>
                                                                                safeSetState(() => _model.dropDownValue2 = val),
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            80.0,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'a7b5mh9r' /* Approximately how many other p... */,
                                                                        ),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderWidth:
                                                                            0.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isOverButton:
                                                                            false,
                                                                        isSearchable:
                                                                            false,
                                                                        isMultiSelect:
                                                                            false,
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              170.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(13.0, 10.0, 10.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'kwsxj6jc' /* Do you have support staff that... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-0.3, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 2.0, 2.0),
                                                                                  child: FlutterFlowRadioButton(
                                                                                    options: [
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'pd96dk78' /* Yes */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '48lnlzd3' /* No */,
                                                                                      )
                                                                                    ].toList(),
                                                                                    onChanged: (val) => safeSetState(() {}),
                                                                                    controller: _model.radioButtonValueController4 ??= FormFieldController<String>(null),
                                                                                    optionHeight: 32.0,
                                                                                    optionWidth: 100.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                        ),
                                                                                    selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                    buttonPosition: RadioButtonPosition.left,
                                                                                    direction: Axis.horizontal,
                                                                                    radioButtonColor: FlutterFlowTheme.of(context).primary,
                                                                                    inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                    toggleable: false,
                                                                                    horizontalAlignment: WrapAlignment.start,
                                                                                    verticalAlignment: WrapCrossAlignment.start,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 5.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (_model
                                                                              .radioButtonValue4 ==
                                                                          'Yes')
                                                                        FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.dropDownValueController3 ??=
                                                                              FormFieldController<String>(
                                                                            _model.dropDownValue3 ??=
                                                                                '',
                                                                          ),
                                                                          options:
                                                                              List<String>.from([
                                                                            '0',
                                                                            '1',
                                                                            '2',
                                                                            '3',
                                                                            '4'
                                                                          ]),
                                                                          optionLabels: [
                                                                            FFLocalizations.of(context).getText(
                                                                              'l0ei7s3e' /* 0 */,
                                                                            ),
                                                                            FFLocalizations.of(context).getText(
                                                                              'rrukfvlx' /* 1 */,
                                                                            ),
                                                                            FFLocalizations.of(context).getText(
                                                                              'vijqt4if' /* 2 */,
                                                                            ),
                                                                            FFLocalizations.of(context).getText(
                                                                              'xuqcrxmz' /* 3 */,
                                                                            ),
                                                                            FFLocalizations.of(context).getText(
                                                                              '9xwha39w' /* 4 */,
                                                                            )
                                                                          ],
                                                                          onChanged: (val) =>
                                                                              safeSetState(() => _model.dropDownValue3 = val),
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              70.0,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'uo6ki37m' /* If yes, how many support staff... */,
                                                                          ),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderWidth:
                                                                              0.0,
                                                                          borderRadius:
                                                                              8.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          isOverButton:
                                                                              false,
                                                                          isSearchable:
                                                                              false,
                                                                          isMultiSelect:
                                                                              false,
                                                                        ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            20.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 10.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: smooth_page_indicator
                                                          .SmoothPageIndicator(
                                                        controller: _model
                                                                .pageViewController ??=
                                                            PageController(
                                                                initialPage: 0),
                                                        count: 3,
                                                        axisDirection:
                                                            Axis.horizontal,
                                                        onDotClicked:
                                                            (i) async {
                                                          await _model
                                                              .pageViewController!
                                                              .animateToPage(
                                                            i,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500),
                                                            curve: Curves.ease,
                                                          );
                                                          safeSetState(() {});
                                                        },
                                                        effect:
                                                            smooth_page_indicator
                                                                .SlideEffect(
                                                          spacing: 8.0,
                                                          radius: 24.0,
                                                          dotWidth: 100.0,
                                                          dotHeight: 6.0,
                                                          dotColor:
                                                              Color(0x4C9E9EB7),
                                                          activeDotColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          paintStyle:
                                                              PaintingStyle
                                                                  .fill,
                                                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'sign_up_authentication_widget.dart' show SignUpAuthenticationWidget;
import 'package:flutter/material.dart';

class SignUpAuthenticationModel
    extends FlutterFlowModel<SignUpAuthenticationWidget> {
  ///  Local state fields for this page.

  String? sessionID = '';

  bool isEmailOTPButtonClicked = false;

  bool isPhoneOTPButtonClicked = false;

  bool isClientSelected = false;

  bool isPractitionerSelected = false;

  String? role;

  bool isEmailVerifyButtonClicked = false;

  bool isPhoneVerifyButtonClicked = false;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for email_V widget.
  FocusNode? emailVFocusNode;
  TextEditingController? emailVTextController;
  String? Function(BuildContext, String?)? emailVTextControllerValidator;
  String? _emailVTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g6s6ikge' /* Email address is required... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'mmptyuwj' /* Enter a valid email address... */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (otp_email_send_otp_email_send_post)] action in sendEmailOTP widget.
  ApiCallResponse? signUpEmailOTP;
  // State field(s) for email_OTP widget.
  FocusNode? emailOTPFocusNode;
  TextEditingController? emailOTPTextController;
  String? Function(BuildContext, String?)? emailOTPTextControllerValidator;
  String? _emailOTPTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ftjnyy1d' /* OTP is required... */,
      );
    }

    return null;
  }

  // State field(s) for emailTimer widget.
  final emailTimerInitialTimeMs = 5000;
  int emailTimerMilliseconds = 5000;
  String emailTimerValue = StopWatchTimer.getDisplayTime(
    5000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController emailTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - API (otp_email_verify_otp_email_verify_post)] action in verifyEmail widget.
  ApiCallResponse? verfiyEmailOTP;
  // State field(s) for contact_V widget.
  FocusNode? contactVFocusNode;
  TextEditingController? contactVTextController;
  String? Function(BuildContext, String?)? contactVTextControllerValidator;
  String? _contactVTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1nxnpw7a' /* Phone Number is required... */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (otp_phone_send_otp_phone_send_post)] action in sendPhoneOTP widget.
  ApiCallResponse? signUpPhoneOTP;
  // State field(s) for phone_OTP widget.
  FocusNode? phoneOTPFocusNode;
  TextEditingController? phoneOTPTextController;
  String? Function(BuildContext, String?)? phoneOTPTextControllerValidator;
  String? _phoneOTPTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bl5yruft' /* OTP is required... */,
      );
    }

    return null;
  }

  // State field(s) for phoneTimer widget.
  final phoneTimerInitialTimeMs = 5000;
  int phoneTimerMilliseconds = 5000;
  String phoneTimerValue = StopWatchTimer.getDisplayTime(
    5000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController phoneTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - API (otp_phone_verify_otp_phone_verify_post)] action in verifyPhone widget.
  ApiCallResponse? verifyPhoneOTP;
  // Stores action output result for [Backend Call - API (get_registration_token_registration_token_post)] action in Next widget.
  ApiCallResponse? regToken;

  @override
  void initState(BuildContext context) {
    emailVTextControllerValidator = _emailVTextControllerValidator;
    emailOTPTextControllerValidator = _emailOTPTextControllerValidator;
    contactVTextControllerValidator = _contactVTextControllerValidator;
    phoneOTPTextControllerValidator = _phoneOTPTextControllerValidator;
  }

  @override
  void dispose() {
    emailVFocusNode?.dispose();
    emailVTextController?.dispose();

    emailOTPFocusNode?.dispose();
    emailOTPTextController?.dispose();

    emailTimerController.dispose();
    contactVFocusNode?.dispose();
    contactVTextController?.dispose();

    phoneOTPFocusNode?.dispose();
    phoneOTPTextController?.dispose();

    phoneTimerController.dispose();
  }
}

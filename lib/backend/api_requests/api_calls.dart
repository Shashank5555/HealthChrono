import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start HealthChrono APIs Group Code

class HealthChronoAPIsGroup {
  static String getBaseUrl() => 'https://chronoapi.lvtlabs.com/';
  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
  static RequestPasswordResetAndChooseMethodCall
      requestPasswordResetAndChooseMethodCall =
      RequestPasswordResetAndChooseMethodCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static LogoutCall logoutCall = LogoutCall();
  static SignUpEmailOTPCall signUpEmailOTPCall = SignUpEmailOTPCall();
  static SignUpPhoneOTPCall signUpPhoneOTPCall = SignUpPhoneOTPCall();
  static RegisterUserCall registerUserCall = RegisterUserCall();
  static ChooseRoleCall chooseRoleCall = ChooseRoleCall();
  static VerifyEmailOTPCall verifyEmailOTPCall = VerifyEmailOTPCall();
  static VerifyPhoneOTPCall verifyPhoneOTPCall = VerifyPhoneOTPCall();
  static UploadProfilePictureCall uploadProfilePictureCall =
      UploadProfilePictureCall();
  static DeleteProfilePictureCall deleteProfilePictureCall =
      DeleteProfilePictureCall();
  static DisplayUserProfilePictureCall displayUserProfilePictureCall =
      DisplayUserProfilePictureCall();
  static WelcomeBackCall welcomeBackCall = WelcomeBackCall();
  static UserFullNameCall userFullNameCall = UserFullNameCall();
  static UserEmailCall userEmailCall = UserEmailCall();
  static DeleteUserCall deleteUserCall = DeleteUserCall();
  static GetUserDetailsCall getUserDetailsCall = GetUserDetailsCall();
  static AddMetricsCall addMetricsCall = AddMetricsCall();
  static MetricsDetailsByDateCall metricsDetailsByDateCall =
      MetricsDetailsByDateCall();
  static EditMetricsCall editMetricsCall = EditMetricsCall();
  static DeleteMetricsCall deleteMetricsCall = DeleteMetricsCall();
  static GetMetricsDetailsCall getMetricsDetailsCall = GetMetricsDetailsCall();
  static ListMetircsCall listMetircsCall = ListMetircsCall();
  static ExportMetricsCall exportMetricsCall = ExportMetricsCall();
  static DisplayGaugeChartsCall displayGaugeChartsCall =
      DisplayGaugeChartsCall();
  static DisplayScatterPlotsCall displayScatterPlotsCall =
      DisplayScatterPlotsCall();
  static RegisterUserFromPractitionerCall registerUserFromPractitionerCall =
      RegisterUserFromPractitionerCall();
  static UpdateUserDetailsCall updateUserDetailsCall = UpdateUserDetailsCall();
  static RequestContactUpdateOTPCall requestContactUpdateOTPCall =
      RequestContactUpdateOTPCall();
  static UpdateContactNumberCall updateContactNumberCall =
      UpdateContactNumberCall();
  static UpdateStatusCall updateStatusCall = UpdateStatusCall();
  static SyncfusionGraphDataCall syncfusionGraphDataCall =
      SyncfusionGraphDataCall();
  static GeneratePDFReportCall generatePDFReportCall = GeneratePDFReportCall();
  static CreateAppointmentSlotCall createAppointmentSlotCall =
      CreateAppointmentSlotCall();
  static CancelAppointmentSlotCall cancelAppointmentSlotCall =
      CancelAppointmentSlotCall();
  static ViewAppointmentsForPractitionersCall
      viewAppointmentsForPractitionersCall =
      ViewAppointmentsForPractitionersCall();
  static ViewAppointmentsForClientCall viewAppointmentsForClientCall =
      ViewAppointmentsForClientCall();
  static CheckAvailabilityCall checkAvailabilityCall = CheckAvailabilityCall();
  static SetUserRemindersCall setUserRemindersCall = SetUserRemindersCall();
  static GetAllPractitionersCall getAllPractitionersCall =
      GetAllPractitionersCall();
  static PractitionerBookedSlotsCall practitionerBookedSlotsCall =
      PractitionerBookedSlotsCall();
  static GetAllClientsCall getAllClientsCall = GetAllClientsCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? role = '',
    bool? rememberMe,
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user": {
    "email": "${escapeStringForJson(email)}",
    "password": "${escapeStringForJson(password)}"
  },
  "role": "${escapeStringForJson(role)}",
  "remember_me": ${rememberMe}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${baseUrl}auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? accessToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class RequestPasswordResetAndChooseMethodCall {
  Future<ApiCallResponse> call({
    String? emailOrPhone = '',
    String? method = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(emailOrPhone)}",
  "method": "${escapeStringForJson(method)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Request Password Reset and Choose Method',
      apiUrl: '${baseUrl}auth/request-password-reset',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? contactOrEmail = '',
    String? otp = '',
    String? newPassword = '',
    String? confirmPassword = '',
    String? method = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "contact": "${escapeStringForJson(contactOrEmail)}",
  "otp": "${escapeStringForJson(otp)}",
  "new_password": "${escapeStringForJson(newPassword)}",
  "confirm_password": "${escapeStringForJson(confirmPassword)}",
  "method": "${escapeStringForJson(method)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reset Password',
      apiUrl: '${baseUrl}auth/reset-password',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
"${escapeStringForJson(accessToken)}"''';
    return ApiManager.instance.makeApiCall(
      callName: 'Logout',
      apiUrl: '${baseUrl}auth/logout',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class SignUpEmailOTPCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? sessionId = '',
    String? role = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "session_id": "${escapeStringForJson(sessionId)}",
  "role": "${escapeStringForJson(role)}",
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignUp Email OTP',
      apiUrl: '${baseUrl}auth/signup-email-otp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? signupOTPSessionID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.session_id''',
      ));
  dynamic successMsg(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class SignUpPhoneOTPCall {
  Future<ApiCallResponse> call({
    String? contactNumber = '',
    String? sessionId = '',
    String? role = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "session_id": "${escapeStringForJson(sessionId)}",
  "role": "${escapeStringForJson(role)}",
  "contact_number": "${escapeStringForJson(contactNumber)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignUp Phone OTP',
      apiUrl: '${baseUrl}auth/signup-phone-otp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic successMsg(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic errorMsg(dynamic response) => getJsonField(
        response,
        r'''$.detail''',
      );
}

class RegisterUserCall {
  Future<ApiCallResponse> call({
    String? sessionId = '',
    String? firstName = '',
    String? lastName = '',
    String? dateOfBirth = '',
    String? gender = '',
    String? password = '',
    String? confirmPasword = '',
    String? role = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "session_id": "${escapeStringForJson(sessionId)}",
  "role": "${escapeStringForJson(role)}",
  "user": {
    "first_name": "${escapeStringForJson(firstName)}",
    "last_name": "${escapeStringForJson(lastName)}",
    "date_of_birth": "${escapeStringForJson(dateOfBirth)}",
    "gender": "${escapeStringForJson(gender)}",
    "password": "${escapeStringForJson(password)}",
    "confirm_password": "${escapeStringForJson(confirmPasword)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register User',
      apiUrl: '${baseUrl}auth/register-user',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic successMsg(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic errorMsg(dynamic response) => getJsonField(
        response,
        r'''$.detail''',
      );
}

class ChooseRoleCall {
  Future<ApiCallResponse> call({
    String? role = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
"${escapeStringForJson(role)}"''';
    return ApiManager.instance.makeApiCall(
      callName: 'Choose Role',
      apiUrl: '${baseUrl}auth/choose-role',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? sessionID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_id''',
      ));
  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class VerifyEmailOTPCall {
  Future<ApiCallResponse> call({
    String? sessionId = '',
    String? role = '',
    String? emailOtp = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "session_id": "${escapeStringForJson(sessionId)}",
  "role": "${escapeStringForJson(role)}",
  "email_otp": "${escapeStringForJson(emailOtp)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Verify Email OTP',
      apiUrl: '${baseUrl}auth/verify-email-otp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic successMsg(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class VerifyPhoneOTPCall {
  Future<ApiCallResponse> call({
    String? sessionId = '',
    String? role = '',
    String? phoneOtp = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "session_id": "${escapeStringForJson(sessionId)}",
  "role": "${escapeStringForJson(role)}",
  "phone_otp": "${escapeStringForJson(phoneOtp)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Verify Phone OTP',
      apiUrl: '${baseUrl}auth/verify-phone-otp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic successMsg(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic errorMsg(dynamic response) => getJsonField(
        response,
        r'''$.detail''',
      );
}

class UploadProfilePictureCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    FFUploadedFile? profilePicture,
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Upload Profile Picture',
      apiUrl: '${baseUrl}auth/upload-profile-picture',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'token': accessToken,
        'profile_picture': profilePicture,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic successMsg(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  List<String>? errorMsg(dynamic response) => (getJsonField(
        response,
        r'''$.detail[:].msg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DeleteProfilePictureCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Profile Picture',
      apiUrl: '${baseUrl}auth/delete-profile-picture',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {
        'token': accessToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class DisplayUserProfilePictureCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Display User Profile Picture',
      apiUrl: '${baseUrl}auth/user-profile-picture?token=${accessToken}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'access_token': accessToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic successMsg(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic errorMsg(dynamic response) => getJsonField(
        response,
        r'''$.detail''',
      );
}

class WelcomeBackCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Welcome Back',
      apiUrl: '${baseUrl}auth/welcome-back?token=${accessToken}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'access_token': accessToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class UserFullNameCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User Full Name',
      apiUrl: '${baseUrl}auth/user-full-name?token=${accessToken}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'access_token': accessToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? fullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.full_name''',
      ));
}

class UserEmailCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User Email',
      apiUrl: '${baseUrl}auth/user-email?token=${accessToken}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'access_token': accessToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
}

class DeleteUserCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? accessToken = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete User',
      apiUrl: '${baseUrl}auth/delete-user',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {
        'email': email,
        'token': accessToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserDetailsCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? role = '',
    String? accessToken = '',
    String? contactNumber = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get User Details',
      apiUrl:
          '${baseUrl}auth/get-user-details?email=${email}&role=${role}&token=${accessToken}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'email': email,
        'role': role,
        'token': accessToken,
        'contact_number': contactNumber,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_details.email''',
      ));
  String? fname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_details.first_name''',
      ));
  String? lname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_details.last_name''',
      ));
  String? contact(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_details.contact_number''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_details.status''',
      ));
  String? dob(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_details.additional_details.date_of_birth''',
      ));
  String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_details.additional_details.gender''',
      ));
  String? picture(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_details.additional_details.profile_picture''',
      ));
  int? userID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user_details.id''',
      ));
  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  int? age(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user_details.additional_details.age''',
      ));
}

class AddMetricsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? email = '',
    double? weight,
    double? height,
    String? activityLevel = '',
    double? waist,
    double? hip,
    double? systolicBp,
    double? diastolicBp,
    double? heartRate,
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "weight": ${weight},
  "height":${height} ,
  "activity_level": "${escapeStringForJson(activityLevel)}",
  "waist": ${waist},
  "hip": ${hip},
  "systolic_bp": ${systolicBp},
  "diastolic_bp": ${diastolicBp},
  "heart_rate": ${heartRate}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Metrics',
      apiUrl:
          '${baseUrl}auth/metrics/add?token=${accessToken}&user_email=${email}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic successMsg(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail[:].msg''',
      ));
}

class MetricsDetailsByDateCall {
  Future<ApiCallResponse> call({
    String? date = '',
    String? accessToken = '',
    String? email = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Metrics Details by Date',
      apiUrl:
          '${baseUrl}auth/metrics/edit?date=${date}&token=${accessToken}&user_email=${email}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'date': date,
        'token': accessToken,
        'user_email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? recordID(dynamic response) => (getJsonField(
        response,
        r'''$[:].record_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? createdDate(dynamic response) => (getJsonField(
        response,
        r'''$[:].created_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? details(dynamic response) => getJsonField(
        response,
        r'''$[:].details''',
        true,
      ) as List?;
  List<double>? systolicBP(dynamic response) => (getJsonField(
        response,
        r'''$[:].details.systolic_bp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? diastolicBP(dynamic response) => (getJsonField(
        response,
        r'''$[:].details.diastolic_bp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? heartRate(dynamic response) => (getJsonField(
        response,
        r'''$[:].details.heart_rate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? waist(dynamic response) => (getJsonField(
        response,
        r'''$[:].details.waist''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List? everything(dynamic response) => getJsonField(
        response,
        r'''$.*''',
        true,
      ) as List?;
  List<double>? bmi(dynamic response) => (getJsonField(
        response,
        r'''$[:].details.bmi''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class EditMetricsCall {
  Future<ApiCallResponse> call({
    int? recordId,
    String? accessToken = '',
    String? email = '',
    double? weight,
    double? height,
    String? activityLevel = '',
    double? waist,
    double? hip,
    double? systolicBp,
    double? diastolicBp,
    double? heartRate,
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "weight": ${weight},
  "height": ${height},
  "activity_level": "${escapeStringForJson(activityLevel)}",
  "waist": ${waist},
  "hip": ${hip},
  "systolic_bp": ${systolicBp},
  "diastolic_bp": ${diastolicBp},
  "heart_rate": ${heartRate}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Metrics',
      apiUrl:
          '${baseUrl}auth/metrics/edit/${recordId}?token=${accessToken}&user_email=${email}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic successMsg(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  List<String>? errorMsg(dynamic response) => (getJsonField(
        response,
        r'''$.detail[:].msg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DeleteMetricsCall {
  Future<ApiCallResponse> call({
    int? recordId = 0,
    String? accessToken = '',
    String? email = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Metrics',
      apiUrl:
          '${baseUrl}auth/metrics/delete/${recordId}?token=${accessToken}&user_email=${email}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {
        'record_id': recordId,
        'token': accessToken,
        'user_email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic successMsg(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class GetMetricsDetailsCall {
  Future<ApiCallResponse> call({
    int? recordId = 0,
    String? accessToken = '',
    String? email = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Metrics Details',
      apiUrl:
          '${baseUrl}auth/metrics/details?record_id=${recordId}&token=${accessToken}&user_email=${email}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'record_id': recordId,
        'token': accessToken,
        'user_email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? recordID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.record_id''',
      ));
  double? weight(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.weight''',
      ));
  int? height(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.height''',
      ));
  String? activityLevel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.activity_level''',
      ));
  double? waist(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.waist''',
      ));
  double? hip(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.hip''',
      ));
  int? systolicBP(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.systolic_bp''',
      ));
  int? diastolicBP(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.diastolic_bp''',
      ));
  int? heartRate(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.heart_rate''',
      ));
  double? waistToHipRatio(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.waist_to_hip_ratio''',
      ));
  String? waistToHipEstimation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.waist_to_hip_estimation''',
      ));
  double? waistToHeightRatio(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.waist_to_height_ratio''',
      ));
  String? waistToHeightEstimation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.waist_to_height_estimation''',
      ));
  double? bmr(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.bmr''',
      ));
  double? tee(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.tee''',
      ));
  double? fluidReq(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.fluid_requirements''',
      ));
  double? bmi(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.bmi''',
      ));
  String? bmiClassification(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.bmi_classification''',
      ));
  double? ibw(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.ideal_body_weight''',
      ));
  String? bpCategory(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bp_category''',
      ));
  String? heartRateCondition(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.heart_rate_condition''',
      ));
  String? createdDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.created_date''',
      ));
  String? lastEditedDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.last_edited_date''',
      ));
  String? everything(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.*''',
      ));
}

class ListMetircsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? email = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'List Metircs',
      apiUrl: '${baseUrl}auth/metrics/list',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': accessToken,
        'user_email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ExportMetricsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? email = '',
    String? contactNumber = '',
    bool? sendEmail,
    String? practitionerEmail = '',
    bool? sendToUser,
    bool? sendToSelf,
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Export Metrics',
      apiUrl: '${baseUrl}auth/metrics/export-detailed',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': accessToken,
        'email': email,
        'contact_number': contactNumber,
        'send_email': sendEmail,
        'practitioner_email': practitionerEmail,
        'send_to_user': sendToUser,
        'send_to_self': sendToSelf,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? downloadURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.download_url''',
      ));
  String? fileName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.filename''',
      ));
}

class DisplayGaugeChartsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? userId,
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Display Gauge Charts',
      apiUrl: '${baseUrl}auth/auth/metrics/gauge-charts',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': accessToken,
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? waistToHip(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gauge_charts.waist_to_hip_ratio''',
      ));
  String? waistToHeight(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gauge_charts.waist_to_height_ratio''',
      ));
  String? bloodPressure(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gauge_charts.blood_pressure''',
      ));
  String? heartRate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gauge_charts.heart_rate''',
      ));
  String? bmi(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gauge_charts.bmi''',
      ));
}

class DisplayScatterPlotsCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? startDate,
    String? endDate,
    int? userId,
  }) async {
    startDate ??= '';
    endDate ??= '';
    userId ??= null;
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Display Scatter Plots',
      apiUrl: '${baseUrl}auth/auth/metrics/export-colour-scatterplots',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
        'start_date': startDate,
        'end_date': endDate,
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? waistToHip(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.scatterplots.waist_to_hip_ratio''',
      ));
  String? waistToHeight(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.scatterplots.waist_to_height_ratio''',
      ));
  String? bp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.scatterplots.systolic_bp''',
      ));
  String? heartRate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.scatterplots.heart_rate''',
      ));
  String? bmi(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.scatterplots.bmi''',
      ));
}

class RegisterUserFromPractitionerCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? role = 'user',
    String? firstName = '',
    String? lastName = '',
    String? dateOfBirth = '',
    String? gender = '',
    String? email = '',
    String? contactNumber = '',
    String? password = '',
    String? confirmPassword = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "access_token": "${escapeStringForJson(accessToken)}",
  "role": "${escapeStringForJson(role)}",
  "user": {
    "first_name": "${escapeStringForJson(firstName)}",
    "last_name": "${escapeStringForJson(lastName)}",
    "date_of_birth": "${escapeStringForJson(dateOfBirth)}",
    "gender": "${escapeStringForJson(gender)}",
    "email": "${escapeStringForJson(email)}",
    "contact_number": "${escapeStringForJson(contactNumber)}",
    "password": "${escapeStringForJson(password)}",
    "confirm_password": "${escapeStringForJson(confirmPassword)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register User from Practitioner',
      apiUrl: '${baseUrl}auth/register-user-by-practitioner',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class UpdateUserDetailsCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? firstName = '',
    String? lastName = '',
    String? dateOfBirth = '',
    String? gender = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "token": "${escapeStringForJson(token)}",
  "first_name": "${escapeStringForJson(firstName)}",
  "last_name": "${escapeStringForJson(lastName)}",
  "date_of_birth": "${escapeStringForJson(dateOfBirth)}",
  "gender": "${escapeStringForJson(gender)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update User Details',
      apiUrl: '${baseUrl}auth/update-user-details',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List<String>? errorMsg(dynamic response) => (getJsonField(
        response,
        r'''$.detail''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RequestContactUpdateOTPCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? newContactNumber = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "token": "${escapeStringForJson(token)}",
  "new_contact_number": "${escapeStringForJson(newContactNumber)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Request Contact Update OTP',
      apiUrl: '${baseUrl}auth/request-contact-update-otp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class UpdateContactNumberCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? newContactNumber = '',
    String? otp = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "token": "${escapeStringForJson(token)}",
  "new_contact_number": "${escapeStringForJson(newContactNumber)}",
  "otp": "${escapeStringForJson(otp)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Contact Number',
      apiUrl: '${baseUrl}auth/update-contact-number',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class UpdateStatusCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? newStatus = '',
    String? token = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "new_status": "${escapeStringForJson(newStatus)}",
  "token": "${escapeStringForJson(token)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Status',
      apiUrl: '${baseUrl}auth/update-status',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SyncfusionGraphDataCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? metricName = '',
    String? startDate = '',
    String? endDate = '',
    String? userEmail = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Syncfusion Graph Data',
      apiUrl: '${baseUrl}auth/metrics/graph',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'access_token': accessToken,
        'metric_name': metricName,
        'start_date': startDate,
        'end_date': endDate,
        'user_email': userEmail,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? xAxis(dynamic response) => (getJsonField(
        response,
        r'''$.x_axis''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<double>? yAxis(dynamic response) => (getJsonField(
        response,
        r'''$.y_axis''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class GeneratePDFReportCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? startDate = '',
    String? endDate = '',
    int? userId,
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Generate PDF Report',
      apiUrl: '${baseUrl}auth/auth/metrics/generate-pdf-report',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': accessToken,
        'start_date': startDate,
        'end_date': endDate,
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? link(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.download_url''',
      ));
  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  String? fileName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.pdf_filename''',
      ));
}

class CreateAppointmentSlotCall {
  Future<ApiCallResponse> call({
    int? userID,
    int? practitionerID,
    String? startTime = '',
    String? endTime = '',
    String? token = '',
    List<int>? reminderMinutesBeforeStartList,
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();
    final reminderMinutesBeforeStart =
        _serializeList(reminderMinutesBeforeStartList);

    final ffApiRequestBody = '''
{
  "data": {
    "user_id": ${userID},
    "practitioner_id": ${practitionerID},
    "start_time": "${escapeStringForJson(startTime)}",
    "end_time": "${escapeStringForJson(endTime)}",
    "reminder_minutes_before_start": ${reminderMinutesBeforeStart}
  },
  "token": "${escapeStringForJson(token)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Appointment Slot',
      apiUrl: '${baseUrl}auth/appointments/create',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelAppointmentSlotCall {
  Future<ApiCallResponse> call({
    int? appointmentID,
    int? userID,
    String? token = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "data": {
    "appointment_id": ${appointmentID},
    "user_id": ${userID}
  },
  "token": "${escapeStringForJson(token)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cancel Appointment Slot',
      apiUrl: '${baseUrl}auth/appointments/cancel',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ViewAppointmentsForPractitionersCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? email = '',
    String? contactNumber = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'View Appointments for Practitioners',
      apiUrl: '${baseUrl}auth/appointments/practitioner',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
        'email': email,
        'contact_number': contactNumber,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? startTimes(dynamic response) => (getJsonField(
        response,
        r'''$[:].start_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? endTimes(dynamic response) => (getJsonField(
        response,
        r'''$[:].end_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$[:].latest_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? appointmentID(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? userID(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? pracID(dynamic response) => (getJsonField(
        response,
        r'''$[:].practitioner_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? everything(dynamic response) => getJsonField(
        response,
        r'''$.*''',
        true,
      ) as List?;
}

class ViewAppointmentsForClientCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'View Appointments for Client',
      apiUrl: '${baseUrl}auth/appointments/user',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? userID(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? startTimes(dynamic response) => (getJsonField(
        response,
        r'''$[:].start_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? pracID(dynamic response) => (getJsonField(
        response,
        r'''$[:].practitioner_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? endTimes(dynamic response) => (getJsonField(
        response,
        r'''$[:].end_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$[:].latest_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? appointmentID(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? everything(dynamic response) => getJsonField(
        response,
        r'''$.*''',
        true,
      ) as List?;
}

class CheckAvailabilityCall {
  Future<ApiCallResponse> call({
    int? practitionerId,
    String? startTime = '',
    String? endTime = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Check Availability',
      apiUrl: '${baseUrl}auth/availability/check',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'practitioner_id': practitionerId,
        'start_time': startTime,
        'end_time': endTime,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SetUserRemindersCall {
  Future<ApiCallResponse> call({
    int? appointmentId,
    List<int>? reminderMinutesList,
    String? token = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();
    final reminderMinutes = _serializeList(reminderMinutesList);

    final ffApiRequestBody = '''
{
  "reminder_minutes": ${reminderMinutes},
  "token": "${escapeStringForJson(token)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Set User Reminders',
      apiUrl: '${baseUrl}auth/appointments/${appointmentId}/set-reminders',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? successMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetAllPractitionersCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get All Practitioners',
      apiUrl: '${baseUrl}auth/practitioners/all',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allPractitioners(dynamic response) => getJsonField(
        response,
        r'''$.*''',
        true,
      ) as List?;
  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? firstName(dynamic response) => (getJsonField(
        response,
        r'''$[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lastName(dynamic response) => (getJsonField(
        response,
        r'''$[:].last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? profilePicture(dynamic response) => (getJsonField(
        response,
        r'''$[:].profile_picture''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PractitionerBookedSlotsCall {
  Future<ApiCallResponse> call({
    int? practitionerId,
    String? token = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Practitioner Booked Slots',
      apiUrl: '${baseUrl}auth/appointments/practitioner/booked-slots',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'practitioner_id': practitionerId,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? startTimes(dynamic response) => (getJsonField(
        response,
        r'''$[:].start_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? endTimes(dynamic response) => (getJsonField(
        response,
        r'''$[:].end_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetAllClientsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = HealthChronoAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get All Clients',
      apiUrl: '${baseUrl}auth/users/active',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? userID(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? firstName(dynamic response) => (getJsonField(
        response,
        r'''$[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lastName(dynamic response) => (getJsonField(
        response,
        r'''$[:].last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? profilePicture(dynamic response) => getJsonField(
        response,
        r'''$[:].profile_picture''',
        true,
      ) as List?;
  List? everything(dynamic response) => getJsonField(
        response,
        r'''$.*''',
        true,
      ) as List?;
}

/// End HealthChrono APIs Group Code

/// Start New APIs Group Code

class NewAPIsGroup {
  static String getBaseUrl() => 'https://chronoapi.lvtlabs.com';
  static Map<String, String> headers = {};
  static HealthzHealthzGetCall healthzHealthzGetCall = HealthzHealthzGetCall();
  static OtpEmailSendOtpEmailSendPostCall otpEmailSendOtpEmailSendPostCall =
      OtpEmailSendOtpEmailSendPostCall();
  static OtpEmailVerifyOtpEmailVerifyPostCall
      otpEmailVerifyOtpEmailVerifyPostCall =
      OtpEmailVerifyOtpEmailVerifyPostCall();
  static OtpPhoneSendOtpPhoneSendPostCall otpPhoneSendOtpPhoneSendPostCall =
      OtpPhoneSendOtpPhoneSendPostCall();
  static OtpPhoneVerifyOtpPhoneVerifyPostCall
      otpPhoneVerifyOtpPhoneVerifyPostCall =
      OtpPhoneVerifyOtpPhoneVerifyPostCall();
  static GetRegistrationTokenRegistrationTokenPostCall
      getRegistrationTokenRegistrationTokenPostCall =
      GetRegistrationTokenRegistrationTokenPostCall();
  static RegisterWithTokenRegisterPostCall registerWithTokenRegisterPostCall =
      RegisterWithTokenRegisterPostCall();
  static ListTimezonesTimezonesGetCall listTimezonesTimezonesGetCall =
      ListTimezonesTimezonesGetCall();
  static LoginAuthLoginPostCall loginAuthLoginPostCall =
      LoginAuthLoginPostCall();
  static LogoutAuthLogoutPostCall logoutAuthLogoutPostCall =
      LogoutAuthLogoutPostCall();
  static RefreshTokenAuthRefreshPostCall refreshTokenAuthRefreshPostCall =
      RefreshTokenAuthRefreshPostCall();
  static UpdateMyPasswordMePasswordPutCall updateMyPasswordMePasswordPutCall =
      UpdateMyPasswordMePasswordPutCall();
  static UpdateMyPhoneMePhonePutCall updateMyPhoneMePhonePutCall =
      UpdateMyPhoneMePhonePutCall();
  static PasswordResetRequestPasswordResetRequestPostCall
      passwordResetRequestPasswordResetRequestPostCall =
      PasswordResetRequestPasswordResetRequestPostCall();
  static PasswordResetConfirmPasswordResetConfirmPostCall
      passwordResetConfirmPasswordResetConfirmPostCall =
      PasswordResetConfirmPasswordResetConfirmPostCall();
  static GetMyProfileClientsMeGetCall getMyProfileClientsMeGetCall =
      GetMyProfileClientsMeGetCall();
  static UpdateProfileClientsMePatchCall updateProfileClientsMePatchCall =
      UpdateProfileClientsMePatchCall();
  static UploadProfilePictureClientsMeProfilePicturePutCall
      uploadProfilePictureClientsMeProfilePicturePutCall =
      UploadProfilePictureClientsMeProfilePicturePutCall();
  static DeleteProfilePictureClientsMeProfilePictureDeleteCall
      deleteProfilePictureClientsMeProfilePictureDeleteCall =
      DeleteProfilePictureClientsMeProfilePictureDeleteCall();
  static SearchPractitionersClientsPractitionersSearchGetCall
      searchPractitionersClientsPractitionersSearchGetCall =
      SearchPractitionersClientsPractitionersSearchGetCall();
  static GetMyProfilePractitionersMeGetCall getMyProfilePractitionersMeGetCall =
      GetMyProfilePractitionersMeGetCall();
  static UpdatePractitionerProfilePractitionersMePatchCall
      updatePractitionerProfilePractitionersMePatchCall =
      UpdatePractitionerProfilePractitionersMePatchCall();
  static UploadProfilePicturePractitionersMeProfilePicturePutCall
      uploadProfilePicturePractitionersMeProfilePicturePutCall =
      UploadProfilePicturePractitionersMeProfilePicturePutCall();
  static DeleteProfilePicturePractitionersMeProfilePictureDeleteCall
      deleteProfilePicturePractitionersMeProfilePictureDeleteCall =
      DeleteProfilePicturePractitionersMeProfilePictureDeleteCall();
  static SearchClientsPractitionersClientsSearchGetCall
      searchClientsPractitionersClientsSearchGetCall =
      SearchClientsPractitionersClientsSearchGetCall();
  static SearchLinkedClientsForPractitionerCall
      searchLinkedClientsForPractitionerCall =
      SearchLinkedClientsForPractitionerCall();
  static RegisterClientByPractitionerPractitionersPractitionerClientsPostCall
      registerClientByPractitionerPractitionersPractitionerClientsPostCall =
      RegisterClientByPractitionerPractitionersPractitionerClientsPostCall();
  static ListMyClientsPractitionersMeClientsGetCall
      listMyClientsPractitionersMeClientsGetCall =
      ListMyClientsPractitionersMeClientsGetCall();
  static RequestLinkLinksRequestPostCall requestLinkLinksRequestPostCall =
      RequestLinkLinksRequestPostCall();
  static GetMyPendingLinksLinksGetCall getMyPendingLinksLinksGetCall =
      GetMyPendingLinksLinksGetCall();
  static GetActiveLinksLinksActiveGetCall getActiveLinksLinksActiveGetCall =
      GetActiveLinksLinksActiveGetCall();
  static AcceptLinkLinksLinkIdAcceptPostCall
      acceptLinkLinksLinkIdAcceptPostCall =
      AcceptLinkLinksLinkIdAcceptPostCall();
  static RejectLinkLinksLinkIdRejectPostCall
      rejectLinkLinksLinkIdRejectPostCall =
      RejectLinkLinksLinkIdRejectPostCall();
  static DeleteLinkLinksLinkIdDeleteCall deleteLinkLinksLinkIdDeleteCall =
      DeleteLinkLinksLinkIdDeleteCall();
  static CreateMetricMetricsPostCall createMetricMetricsPostCall =
      CreateMetricMetricsPostCall();
  static ListMetricsMetricsGetCall listMetricsMetricsGetCall =
      ListMetricsMetricsGetCall();
  static PatchMetricMetricsMetricIdPatchCall
      patchMetricMetricsMetricIdPatchCall =
      PatchMetricMetricsMetricIdPatchCall();
  static DeleteMetricMetricsMetricIdDeleteCall
      deleteMetricMetricsMetricIdDeleteCall =
      DeleteMetricMetricsMetricIdDeleteCall();
  static ExportMetricsReportMetricsExportPostCall
      exportMetricsReportMetricsExportPostCall =
      ExportMetricsReportMetricsExportPostCall();
  static GetAllGaugeChartsGaugeMetricsGaugeChartsGetCall
      getAllGaugeChartsGaugeMetricsGaugeChartsGetCall =
      GetAllGaugeChartsGaugeMetricsGaugeChartsGetCall();
  static GetGaugeChartGaugeMetricsGaugeChartsFilenameGetCall
      getGaugeChartGaugeMetricsGaugeChartsFilenameGetCall =
      GetGaugeChartGaugeMetricsGaugeChartsFilenameGetCall();
  static ScatterPlotsScatterMetricsPlotsGetCall
      scatterPlotsScatterMetricsPlotsGetCall =
      ScatterPlotsScatterMetricsPlotsGetCall();
  static GetScatterPlotScatterMetricsPlotsFilenameGetCall
      getScatterPlotScatterMetricsPlotsFilenameGetCall =
      GetScatterPlotScatterMetricsPlotsFilenameGetCall();
  static GeneratePdfReportPdfGeneratePdfReportGetCall
      generatePdfReportPdfGeneratePdfReportGetCall =
      GeneratePdfReportPdfGeneratePdfReportGetCall();
  static DeactivateRequestMeDeactivateRequestPostCall
      deactivateRequestMeDeactivateRequestPostCall =
      DeactivateRequestMeDeactivateRequestPostCall();
  static DeactivateConfirmMeDeactivateConfirmPostCall
      deactivateConfirmMeDeactivateConfirmPostCall =
      DeactivateConfirmMeDeactivateConfirmPostCall();
  static ReactivateRequestReactivateRequestPostCall
      reactivateRequestReactivateRequestPostCall =
      ReactivateRequestReactivateRequestPostCall();
  static ReactivateConfirmReactivateConfirmPostCall
      reactivateConfirmReactivateConfirmPostCall =
      ReactivateConfirmReactivateConfirmPostCall();
  static SyncfusionCall syncfusionCall = SyncfusionCall();
  static CheckPractitionerAvailabilityCall checkPractitionerAvailabilityCall =
      CheckPractitionerAvailabilityCall();
  static CreateANewAppointmentSlotCall createANewAppointmentSlotCall =
      CreateANewAppointmentSlotCall();
  static CancelAnAppointmentSlotCall cancelAnAppointmentSlotCall =
      CancelAnAppointmentSlotCall();
  static ViewMyAppointmentsCall viewMyAppointmentsCall =
      ViewMyAppointmentsCall();
  static PractitionerAcceptAppointmentCall practitionerAcceptAppointmentCall =
      PractitionerAcceptAppointmentCall();
  static PractitionerRejectAppointmentCall practitionerRejectAppointmentCall =
      PractitionerRejectAppointmentCall();
  static GetBookedAppointmentSlotsCall getBookedAppointmentSlotsCall =
      GetBookedAppointmentSlotsCall();
}

class HealthzHealthzGetCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'healthz_healthz_get',
      apiUrl: '${baseUrl}/healthz',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OtpEmailSendOtpEmailSendPostCall {
  Future<ApiCallResponse> call({
    String? destination = '',
    String? purpose = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "destination": "${escapeStringForJson(destination)}",
  "purpose": "${escapeStringForJson(purpose)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'otp_email_send_otp_email_send_post',
      apiUrl: '${baseUrl}/otp/email/send',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class OtpEmailVerifyOtpEmailVerifyPostCall {
  Future<ApiCallResponse> call({
    String? destination = '',
    String? purpose = '',
    String? code = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "destination": "${escapeStringForJson(destination)}",
  "purpose": "${escapeStringForJson(purpose)}",
  "code": "${escapeStringForJson(code)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'otp_email_verify_otp_email_verify_post',
      apiUrl: '${baseUrl}/otp/email/verify',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class OtpPhoneSendOtpPhoneSendPostCall {
  Future<ApiCallResponse> call({
    String? destination = '',
    String? purpose = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "destination": "${escapeStringForJson(destination)}",
  "purpose": "${escapeStringForJson(purpose)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'otp_phone_send_otp_phone_send_post',
      apiUrl: '${baseUrl}/otp/phone/send',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class OtpPhoneVerifyOtpPhoneVerifyPostCall {
  Future<ApiCallResponse> call({
    String? destination = '',
    String? purpose = '',
    String? code = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "destination": "${escapeStringForJson(destination)}",
  "purpose": "${escapeStringForJson(purpose)}",
  "code": "${escapeStringForJson(code)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'otp_phone_verify_otp_phone_verify_post',
      apiUrl: '${baseUrl}/otp/phone/verify',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class GetRegistrationTokenRegistrationTokenPostCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? phone = '',
    String? purpose = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "phone": "${escapeStringForJson(phone)}",
  "purpose": "${escapeStringForJson(purpose)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'get_registration_token_registration_token_post',
      apiUrl: '${baseUrl}/registration-token',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class RegisterWithTokenRegisterPostCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? fname = '',
    String? lname = '',
    String? password = '',
    String? confirmPassword = '',
    String? dob = '',
    String? gender = '',
    String? timezone = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "registration_token": "${escapeStringForJson(token)}",
  "first_name": "${escapeStringForJson(fname)}",
  "last_name": "${escapeStringForJson(lname)}",
  "password": "${escapeStringForJson(password)}",
  "confirm_password": "${escapeStringForJson(confirmPassword)}",
  "date_of_birth": "${escapeStringForJson(dob)}",
  "gender": "${escapeStringForJson(gender)}",
  "timezone": "${escapeStringForJson(timezone)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'register_with_token_register_post',
      apiUrl: '${baseUrl}/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListTimezonesTimezonesGetCall {
  Future<ApiCallResponse> call({
    String? search = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'list_timezones_timezones_get',
      apiUrl: '${baseUrl}/timezones',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'search': search,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? label(dynamic response) => (getJsonField(
        response,
        r'''$[:].label''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class LoginAuthLoginPostCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    bool? rememberMe,
    String? role = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}",
  "remember_me": ${rememberMe},
  "role": "${escapeStringForJson(role)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login_auth_login_post',
      apiUrl: '${baseUrl}/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LogoutAuthLogoutPostCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? refreshToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "access_token": "${escapeStringForJson(accessToken)}",
  "refresh_token": "${escapeStringForJson(refreshToken)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'logout_auth_logout_post',
      apiUrl: '${baseUrl}/auth/logout',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RefreshTokenAuthRefreshPostCall {
  Future<ApiCallResponse> call({
    String? refreshToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
"${escapeStringForJson(refreshToken)}"''';
    return ApiManager.instance.makeApiCall(
      callName: 'refresh_token_auth_refresh_post',
      apiUrl: '${baseUrl}/auth/refresh',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateMyPasswordMePasswordPutCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
    String? via = '',
    String? code = '',
    String? newPassword = '',
    String? confirmPassword = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "via": "${escapeStringForJson(via)}",
  "code": "${escapeStringForJson(code)}",
  "new_password": "${escapeStringForJson(newPassword)}",
  "confirm_password": "${escapeStringForJson(confirmPassword)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update_my_password_me_password_put',
      apiUrl: '${baseUrl}/me/password',
      callType: ApiCallType.PUT,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateMyPhoneMePhonePutCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
    String? newPhone = '',
    String? code = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "new_phone": "${escapeStringForJson(newPhone)}",
  "code": "${escapeStringForJson(code)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update_my_phone_me_phone_put',
      apiUrl: '${baseUrl}/me/phone',
      callType: ApiCallType.PUT,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PasswordResetRequestPasswordResetRequestPostCall {
  Future<ApiCallResponse> call({
    String? destination = '',
    String? via = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "destination": "${escapeStringForJson(destination)}",
  "via": "${escapeStringForJson(via)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'password_reset_request_password_reset_request_post',
      apiUrl: '${baseUrl}/password-reset/request',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PasswordResetConfirmPasswordResetConfirmPostCall {
  Future<ApiCallResponse> call({
    String? destination = '',
    String? via = '',
    String? code = '',
    String? newPassword = '',
    String? confirmNewPassword = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "destination": "${escapeStringForJson(destination)}",
  "via": "${escapeStringForJson(via)}",
  "code": "${escapeStringForJson(code)}",
  "new_password": "${escapeStringForJson(newPassword)}",
  "confirm_password": "${escapeStringForJson(confirmNewPassword)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'password_reset_confirm_password_reset_confirm_post',
      apiUrl: '${baseUrl}/password-reset/confirm',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMyProfileClientsMeGetCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get_my_profile_clients_me_get',
      apiUrl: '${baseUrl}/clients/me',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? customID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.custom_id''',
      ));
  String? fname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.first_name''',
      ));
  String? lname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.last_name''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  String? phoneNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.contact_number''',
      ));
  String? dob(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.date_of_birth''',
      ));
  String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gender''',
      ));
  String? timeZone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timezone''',
      ));
  String? profilePicture(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.profile_picture''',
      ));
}

class UpdateProfileClientsMePatchCall {
  Future<ApiCallResponse> call({
    String? fname = '',
    String? lname = '',
    String? gender = '',
    String? dob = '',
    String? timezone = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "first_name": "${escapeStringForJson(fname)}",
  "last_name": "${escapeStringForJson(lname)}",
  "gender": "${escapeStringForJson(gender)}",
  "date_of_birth": "${escapeStringForJson(dob)}",
  "timezone": "${escapeStringForJson(timezone)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update_profile_clients_me_patch',
      apiUrl: '${baseUrl}/clients/me',
      callType: ApiCallType.PATCH,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadProfilePictureClientsMeProfilePicturePutCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
    FFUploadedFile? file,
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'upload_profile_picture_clients_me_profile_picture_put',
      apiUrl: '${baseUrl}/clients/me/profile-picture',
      callType: ApiCallType.PUT,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteProfilePictureClientsMeProfilePictureDeleteCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'delete_profile_picture_clients_me_profile_picture_delete',
      apiUrl: '${baseUrl}/clients/me/profile-picture',
      callType: ApiCallType.DELETE,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchPractitionersClientsPractitionersSearchGetCall {
  Future<ApiCallResponse> call({
    String? fullname = '',
    String? email = '',
    String? phone = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'search_practitioners_clients_practitioners_search_get',
      apiUrl: '${baseUrl}/clients/practitioners/search',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'fullname': fullname,
        'email': email,
        'phone': phone,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  String? fname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].first_name''',
      ));
  String? lname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].last_name''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].email''',
      ));
  String? contactNum(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].contact_number''',
      ));
  String? profilePicture(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].profile_picture''',
      ));
  List? everyPrac(dynamic response) => getJsonField(
        response,
        r'''$.*''',
        true,
      ) as List?;
}

class GetMyProfilePractitionersMeGetCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get_my_profile_practitioners_me_get',
      apiUrl: '${baseUrl}/practitioners/me',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? fname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.first_name''',
      ));
  String? lname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.last_name''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  String? contactNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.contact_number''',
      ));
  String? dob(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.date_of_birth''',
      ));
  String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gender''',
      ));
  String? timezone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timezone''',
      ));
  String? profilePicture(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.profile_picture''',
      ));
  String? registrationDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.registration_date''',
      ));
}

class UpdatePractitionerProfilePractitionersMePatchCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
    String? fname = '',
    String? lname = '',
    String? gender = '',
    String? dob = '',
    String? timezone = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "first_name": "${escapeStringForJson(fname)}",
  "last_name": "${escapeStringForJson(lname)}",
  "gender": "${escapeStringForJson(gender)}",
  "date_of_birth": "${escapeStringForJson(dob)}",
  "timezone": "${escapeStringForJson(timezone)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update_practitioner_profile_practitioners_me_patch',
      apiUrl: '${baseUrl}/practitioners/me',
      callType: ApiCallType.PATCH,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadProfilePicturePractitionersMeProfilePicturePutCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
    FFUploadedFile? file,
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'upload_profile_picture_practitioners_me_profile_picture_put',
      apiUrl: '${baseUrl}/practitioners/me/profile-picture',
      callType: ApiCallType.PUT,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteProfilePicturePractitionersMeProfilePictureDeleteCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName:
          'delete_profile_picture_practitioners_me_profile_picture_delete',
      apiUrl: '${baseUrl}/practitioners/me/profile-picture',
      callType: ApiCallType.DELETE,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchClientsPractitionersClientsSearchGetCall {
  Future<ApiCallResponse> call({
    String? fullname = '',
    String? email = '',
    String? phone = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'search_clients_practitioners_clients_search_get',
      apiUrl: '${baseUrl}/practitioners/clients/search',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'fullname': fullname,
        'email': email,
        'phone': phone,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  String? fname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].first_name''',
      ));
  String? lname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].last_name''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].email''',
      ));
  String? contactNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].contact_number''',
      ));
  String? dob(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].date_of_birth''',
      ));
  String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].gender''',
      ));
  String? timezone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].timezone''',
      ));
  String? registrationDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].registration_date''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].status''',
      ));
  String? profilePicture(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].profile_picture''',
      ));
}

class SearchLinkedClientsForPractitionerCall {
  Future<ApiCallResponse> call({
    String? fullname = '',
    String? email = '',
    String? phone = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Search linked clients for practitioner',
      apiUrl: '${baseUrl}/practitioners/clients/search-linked',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'fullname': fullname,
        'email': email,
        'phone': phone,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  String? fname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].first_name''',
      ));
  String? lname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].last_name''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].email''',
      ));
  String? contactNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].contact_number''',
      ));
  String? dob(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].date_of_birth''',
      ));
  String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].gender''',
      ));
  String? timezone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].timezone''',
      ));
  String? registrationDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].registration_date''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].status''',
      ));
  String? profilePicture(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].profile_picture''',
      ));
}

class RegisterClientByPractitionerPractitionersPractitionerClientsPostCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
    String? fname = '',
    String? lname = '',
    String? email = '',
    String? contactNumber = '',
    String? dob = '',
    String? gender = '',
    String? timezone = '',
    String? password = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "first_name": "${escapeStringForJson(fname)}",
  "last_name": "${escapeStringForJson(lname)}",
  "email": "${escapeStringForJson(email)}",
  "contact_number": "${escapeStringForJson(contactNumber)}",
  "date_of_birth": "${escapeStringForJson(dob)}",
  "gender": "${escapeStringForJson(gender)}",
  "timezone": "${escapeStringForJson(timezone)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'register_client_by_practitioner_practitioners_practitioner_clients_post',
      apiUrl: '${baseUrl}/practitioners/practitioner/clients',
      callType: ApiCallType.POST,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListMyClientsPractitionersMeClientsGetCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'list_my_clients_practitioners_me_clients_get',
      apiUrl: '${baseUrl}/practitioners/me/clients',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? clientID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  String? fname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].first_name''',
      ));
  String? lname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].last_name''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].email''',
      ));
  String? contactNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].contact_number''',
      ));
  String? profilePicture(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].profile_picture''',
      ));
  List? everyClient(dynamic response) => getJsonField(
        response,
        r'''$.*''',
        true,
      ) as List?;
}

class RequestLinkLinksRequestPostCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
    String? destination = '',
    String? reason = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "destination": "${escapeStringForJson(destination)}",
  "reason": "${escapeStringForJson(reason)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'request_link_links_request_post',
      apiUrl: '${baseUrl}/links/request',
      callType: ApiCallType.POST,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMyPendingLinksLinksGetCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get_my_pending_links_links__get',
      apiUrl: '${baseUrl}/links/',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? linkID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  String? clientID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].client.id''',
      ));
  String? clientFirstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].client.first_name''',
      ));
  String? clientEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].client.email''',
      ));
  String? clientContactNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].client.contact_number''',
      ));
  String? pracID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].practitioner.id''',
      ));
  String? pracFirstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].practitioner.first_name''',
      ));
  String? pracEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].practitioner.email''',
      ));
  String? pracContactNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].practitioner.contact_number''',
      ));
  String? requestedBy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].requested_by''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].status''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].created_at''',
      ));
  String? expiresAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].expires_at''',
      ));
  List? everythingPending(dynamic response) => getJsonField(
        response,
        r'''$.*''',
        true,
      ) as List?;
}

class GetActiveLinksLinksActiveGetCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get_active_links_links_active_get',
      apiUrl: '${baseUrl}/links/active',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? linkID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  String? clientID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].client.id''',
      ));
  String? clientFirstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].client.first_name''',
      ));
  String? clientEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].client.email''',
      ));
  String? clientContactNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].client.contact_number''',
      ));
  String? pracID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].practitioner.id''',
      ));
  String? pracName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].practitioner.first_name''',
      ));
  String? pracEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].practitioner.email''',
      ));
  String? pracContactNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].practitioner.contact_number''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].created_at''',
      ));
  List? everythingActive(dynamic response) => getJsonField(
        response,
        r'''$.*''',
        true,
      ) as List?;
  bool? clientAccepted(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].client_accepted''',
      ));
  bool? pracAccepted(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].practitioner_accepted''',
      ));
}

class AcceptLinkLinksLinkIdAcceptPostCall {
  Future<ApiCallResponse> call({
    String? linkId = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'accept_link_links__link_id__accept_post',
      apiUrl: '${baseUrl}/links/${linkId}/accept',
      callType: ApiCallType.POST,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RejectLinkLinksLinkIdRejectPostCall {
  Future<ApiCallResponse> call({
    String? linkId = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'reject_link_links__link_id__reject_post',
      apiUrl: '${baseUrl}/links/${linkId}/reject',
      callType: ApiCallType.POST,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteLinkLinksLinkIdDeleteCall {
  Future<ApiCallResponse> call({
    String? linkId = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'delete_link_links__link_id__delete',
      apiUrl: '${baseUrl}/links/${linkId}',
      callType: ApiCallType.DELETE,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateMetricMetricsPostCall {
  Future<ApiCallResponse> call({
    String? clientIdentifier = '',
    String? xAccessToken = '',
    double? heightCm,
    double? weightKg,
    double? chestCm,
    double? hipCm,
    double? waistCm,
    String? activityLevel = '',
    double? heartRate,
    double? systolicBp,
    double? diastolicBp,
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "height_cm": ${heightCm},
  "weight_kg": ${weightKg},
  "chest_cm": ${chestCm},
  "hip_cm": ${hipCm},
  "waist_cm": ${waistCm},
  "activity_level": "${escapeStringForJson(activityLevel)}",
  "heart_rate": ${heartRate},
  "systolic_bp": ${systolicBp},
  "diastolic_bp": ${diastolicBp}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create_metric_metrics__post',
      apiUrl: '${baseUrl}/metrics/?client_identifier=${clientIdentifier}',
      callType: ApiCallType.POST,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListMetricsMetricsGetCall {
  Future<ApiCallResponse> call({
    String? fromDate,
    String? toDate,
    String? clientIdentifier = '',
    String? xAccessToken = '',
    String? metricId = '',
  }) async {
    fromDate ??= '';
    toDate ??= '';
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'list_metrics_metrics__get',
      apiUrl: '${baseUrl}/metrics/',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'from_date': fromDate,
        'to_date': toDate,
        'client_identifier': clientIdentifier,
        'id': metricId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<double>? height(dynamic response) => (getJsonField(
        response,
        r'''$[:].height_cm''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? weight(dynamic response) => (getJsonField(
        response,
        r'''$[:].weight_kg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? chest(dynamic response) => (getJsonField(
        response,
        r'''$[:].chest_cm''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? hip(dynamic response) => (getJsonField(
        response,
        r'''$[:].hip_cm''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? waist(dynamic response) => (getJsonField(
        response,
        r'''$[:].waist_cm''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<String>? activityLevel(dynamic response) => (getJsonField(
        response,
        r'''$[:].activity_level''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? heartRate(dynamic response) => (getJsonField(
        response,
        r'''$[:].heart_rate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? systolicBP(dynamic response) => (getJsonField(
        response,
        r'''$[:].systolic_bp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? diastolicBP(dynamic response) => (getJsonField(
        response,
        r'''$[:].diastolic_bp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<double>? waistToHipRatio(dynamic response) => (getJsonField(
        response,
        r'''$[:].waist_to_hip_ratio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<String>? waistToHipEstimation(dynamic response) => (getJsonField(
        response,
        r'''$[:].waist_to_hip_estimation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<double>? waistToHeightRatio(dynamic response) => (getJsonField(
        response,
        r'''$[:].waist_to_height_ratio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<String>? waistToHeightEstimation(dynamic response) => (getJsonField(
        response,
        r'''$[:].waist_to_height_estimation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<double>? bmi(dynamic response) => (getJsonField(
        response,
        r'''$[:].bmi''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<String>? bmiClassification(dynamic response) => (getJsonField(
        response,
        r'''$[:].bmi_classification''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<double>? bmr(dynamic response) => (getJsonField(
        response,
        r'''$[:].bmr''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? tee(dynamic response) => (getJsonField(
        response,
        r'''$[:].tee''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? fluidReq(dynamic response) => (getJsonField(
        response,
        r'''$[:].fluid_requirements''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? ibw(dynamic response) => (getJsonField(
        response,
        r'''$[:].ideal_body_weight''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<String>? bPCategory(dynamic response) => (getJsonField(
        response,
        r'''$[:].bp_category''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? heartRateCondition(dynamic response) => (getJsonField(
        response,
        r'''$[:].heart_rate_condition''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdDate(dynamic response) => (getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? updatedAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].updated_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? everything(dynamic response) => getJsonField(
        response,
        r'''$.*''',
        true,
      ) as List?;
}

class PatchMetricMetricsMetricIdPatchCall {
  Future<ApiCallResponse> call({
    String? metricId = '',
    String? clientIdentifier = '',
    String? xAccessToken = '',
    double? heightCm,
    double? weightKg,
    double? chestCm,
    double? hipCm,
    double? waistCm,
    String? activityLevel = '',
    double? heartRate,
    double? systolicBp,
    double? diastolicBp,
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "height_cm": ${heightCm},
  "weight_kg": ${weightKg},
  "chest_cm": ${chestCm},
  "hip_cm": ${hipCm},
  "waist_cm": ${waistCm},
  "activity_level": "${escapeStringForJson(activityLevel)}",
  "heart_rate": ${heartRate},
  "systolic_bp": ${systolicBp},
  "diastolic_bp": ${diastolicBp}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'patch_metric_metrics__metric_id__patch',
      apiUrl:
          '${baseUrl}/metrics/${metricId}?client_identifier=${clientIdentifier}',
      callType: ApiCallType.PATCH,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteMetricMetricsMetricIdDeleteCall {
  Future<ApiCallResponse> call({
    String? metricId = '',
    String? clientIdentifier = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'delete_metric_metrics__metric_id__delete',
      apiUrl: '${baseUrl}/metrics/${metricId}',
      callType: ApiCallType.DELETE,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'client_identifier': clientIdentifier,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ExportMetricsReportMetricsExportPostCall {
  Future<ApiCallResponse> call({
    bool? download,
    bool? emailSelf,
    bool? emailOther,
    String? clientIdentifier = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'export_metrics_report_metrics_export_post',
      apiUrl:
          '${baseUrl}/metrics/export?download=${download}&email_self=${emailSelf}&email_other=${emailOther}&client_identifier=${clientIdentifier}',
      callType: ApiCallType.POST,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllGaugeChartsGaugeMetricsGaugeChartsGetCall {
  Future<ApiCallResponse> call({
    String? clientIdentifier = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get_all_gauge_charts_gauge_metrics_gauge_charts_get',
      apiUrl: '${baseUrl}/gauge/metrics/gauge-charts',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'client_identifier': clientIdentifier,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? heartRate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gauge_charts.heart_rate''',
      ));
  String? bmi(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gauge_charts.bmi''',
      ));
  String? diastolicBP(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gauge_charts.diastolic_bp''',
      ));
  String? systolicBP(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gauge_charts.systolic_bp''',
      ));
  String? waistToHeight(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gauge_charts.waist_to_height_ratio''',
      ));
  String? waistToHip(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gauge_charts.waist_to_hip_ratio''',
      ));
}

class GetGaugeChartGaugeMetricsGaugeChartsFilenameGetCall {
  Future<ApiCallResponse> call({
    String? filename = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get_gauge_chart_gauge_metrics_gauge_charts__filename__get',
      apiUrl: '${baseUrl}/gauge/metrics/gauge-charts/${filename}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'filename': filename,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ScatterPlotsScatterMetricsPlotsGetCall {
  Future<ApiCallResponse> call({
    String? fromDate = '',
    String? toDate = '',
    String? clientIdentifier = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'scatter_plots_scatter_metrics_plots_get',
      apiUrl: '${baseUrl}/scatter/metrics/plots',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'from_date': fromDate,
        'to_date': toDate,
        'client_identifier': clientIdentifier,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetScatterPlotScatterMetricsPlotsFilenameGetCall {
  Future<ApiCallResponse> call({
    String? filename = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get_scatter_plot_scatter_metrics_plots__filename__get',
      apiUrl: '${baseUrl}/scatter/metrics/plots/${filename}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'filename': filename,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GeneratePdfReportPdfGeneratePdfReportGetCall {
  Future<ApiCallResponse> call({
    String? startDate = '',
    String? endDate = '',
    String? clientIdentifier = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'generate_pdf_report_pdf_generate_pdf_report_get',
      apiUrl: '${baseUrl}/pdf/generate-pdf-report',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'start_date': startDate,
        'end_date': endDate,
        'client_identifier': clientIdentifier,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? downloadURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.download_url''',
      ));
  String? fileName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.pdf_filename''',
      ));
}

class DeactivateRequestMeDeactivateRequestPostCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deactivate_request_me_deactivate_request_post',
      apiUrl: '${baseUrl}/me/deactivate/request',
      callType: ApiCallType.POST,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeactivateConfirmMeDeactivateConfirmPostCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
    String? fullName = '',
    String? email = '',
    String? phone = '',
    String? emailOTP = '',
    String? phoneOTP = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "full_name": "${escapeStringForJson(fullName)}",
  "email": "${escapeStringForJson(email)}",
  "phone": "${escapeStringForJson(phone)}",
  "email_otp": "${escapeStringForJson(emailOTP)}",
  "phone_otp": "${escapeStringForJson(phoneOTP)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deactivate_confirm_me_deactivate_confirm_post',
      apiUrl: '${baseUrl}/me/deactivate/confirm',
      callType: ApiCallType.POST,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReactivateRequestReactivateRequestPostCall {
  Future<ApiCallResponse> call({
    String? fullName = '',
    String? email = '',
    String? phone = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "full_name": "${escapeStringForJson(fullName)}",
  "email": "${escapeStringForJson(email)}",
  "phone": "${escapeStringForJson(phone)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'reactivate_request_reactivate_request_post',
      apiUrl: '${baseUrl}/reactivate/request',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReactivateConfirmReactivateConfirmPostCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? phone = '',
    String? emailOTP = '',
    String? phoneOTP = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "phone": "${escapeStringForJson(phone)}",
  "email_otp": "${escapeStringForJson(emailOTP)}",
  "phone_otp": "${escapeStringForJson(phoneOTP)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'reactivate_confirm_reactivate_confirm_post',
      apiUrl: '${baseUrl}/reactivate/confirm',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SyncfusionCall {
  Future<ApiCallResponse> call({
    String? metricName = '',
    String? startDate = '',
    String? endDate = '',
    String? clientIdentifier = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Syncfusion',
      apiUrl: '${baseUrl}/metrics/graph',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'metric_name': metricName,
        'start_date': startDate,
        'end_date': endDate,
        'client_identifier': clientIdentifier,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? xAxis(dynamic response) => (getJsonField(
        response,
        r'''$.x_axis''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<double>? yAxis(dynamic response) => (getJsonField(
        response,
        r'''$.y_axis''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class CheckPractitionerAvailabilityCall {
  Future<ApiCallResponse> call({
    String? practitionerId = '',
    String? startTime = '',
    String? endTime = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Check Practitioner Availability',
      apiUrl: '${baseUrl}/appointments/availability/check',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'practitioner_id': practitionerId,
        'start_time': startTime,
        'end_time': endTime,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateANewAppointmentSlotCall {
  Future<ApiCallResponse> call({
    String? clientId = '',
    String? practitionerId = '',
    String? startTime = '',
    String? endTime = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "client_id": "${escapeStringForJson(clientId)}",
  "practitioner_id": "${escapeStringForJson(practitionerId)}",
  "start_time": "${escapeStringForJson(startTime)}",
  "end_time": "${escapeStringForJson(endTime)}",
  "reminder_minutes_before_start": [
    0
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create a new appointment slot',
      apiUrl: '${baseUrl}/appointments/create',
      callType: ApiCallType.POST,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? appointmentID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? clientID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.client_id''',
      ));
  String? pracID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.practitioner_id''',
      ));
  String? startTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.start_time''',
      ));
  String? endTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.end_time''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.created_at''',
      ));
}

class CancelAnAppointmentSlotCall {
  Future<ApiCallResponse> call({
    String? appointmentId = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "appointment_id": "${escapeStringForJson(appointmentId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cancel an appointment slot',
      apiUrl: '${baseUrl}/appointments/cancel',
      callType: ApiCallType.POST,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ViewMyAppointmentsCall {
  Future<ApiCallResponse> call({
    String? statusFilter = '',
    bool? upcomingOnly,
    String? xAccessToken = '',
    String? clientId,
  }) async {
    clientId ??= '';
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'View my appointments',
      apiUrl: '${baseUrl}/appointments/my',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'status_filter': statusFilter,
        'upcoming_only': upcomingOnly,
        'client_id': clientId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? appointmentID(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? clientID(dynamic response) => (getJsonField(
        response,
        r'''$[:].client_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? pracID(dynamic response) => (getJsonField(
        response,
        r'''$[:].practitioner_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? startTime(dynamic response) => (getJsonField(
        response,
        r'''$[:].start_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? endTime(dynamic response) => (getJsonField(
        response,
        r'''$[:].end_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? everything(dynamic response) => getJsonField(
        response,
        r'''$.*''',
        true,
      ) as List?;
}

class PractitionerAcceptAppointmentCall {
  Future<ApiCallResponse> call({
    String? appointmentId = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Practitioner Accept Appointment',
      apiUrl: '${baseUrl}/appointments/${appointmentId}/accept',
      callType: ApiCallType.POST,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'appointment_id': appointmentId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PractitionerRejectAppointmentCall {
  Future<ApiCallResponse> call({
    String? appointmentId = '',
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Practitioner Reject Appointment',
      apiUrl: '${baseUrl}/appointments/${appointmentId}/accept',
      callType: ApiCallType.POST,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {
        'appointment_id': appointmentId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBookedAppointmentSlotsCall {
  Future<ApiCallResponse> call({
    String? xAccessToken = '',
  }) async {
    final baseUrl = NewAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Booked Appointment Slots',
      apiUrl: '${baseUrl}/appointments/appointments/booked',
      callType: ApiCallType.GET,
      headers: {
        'X-Access-Token': '${xAccessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? appointmentID(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? clientID(dynamic response) => (getJsonField(
        response,
        r'''$[:].client_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? pracID(dynamic response) => (getJsonField(
        response,
        r'''$[:].practitioner_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? startTime(dynamic response) => (getJsonField(
        response,
        r'''$[:].start_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? endTime(dynamic response) => (getJsonField(
        response,
        r'''$[:].end_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? everyAppointment(dynamic response) => getJsonField(
        response,
        r'''$.*''',
        true,
      ) as List?;
}

/// End New APIs Group Code

class GraphCall {
  static Future<ApiCallResponse> call({
    String? startDate = '',
    String? endDate = '',
    String? metricName = '',
    String? userEmail = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Graph',
      apiUrl: 'http://127.0.0.1:8000/auth/metrics/graph',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'start_date': startDate,
        'end_date': endDate,
        'metric_name': metricName,
        'user_email': userEmail,
        'access_token': accessToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? xAxis(dynamic response) => (getJsonField(
        response,
        r'''$.x_axis''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? yAxis(dynamic response) => (getJsonField(
        response,
        r'''$.y_axis''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class LocalLoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? role = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user": {
    "email": "${email}",
    "password": "${password}"
  },
  "role": "${role}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LocalLogin',
      apiUrl: 'http://127.0.0.1:8000/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? accessToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
}

class TestCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Test',
      apiUrl: 'http://127.0.0.1:8000/test',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  HealthChronoAuthUser? initialUser;
  HealthChronoAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(HealthChronoAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
        ),
        FFRoute(
          name: HomeScreenWidget.routeName,
          path: HomeScreenWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HomeScreen')
              : HomeScreenWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: SignUpWidget.routeName,
          path: SignUpWidget.routePath,
          builder: (context, params) => SignUpWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            contact: params.getParam(
              'contact',
              ParamType.String,
            ),
            sessionID: params.getParam(
              'sessionID',
              ParamType.String,
            ),
            role: params.getParam(
              'role',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SettingsWidget.routeName,
          path: SettingsWidget.routePath,
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: HealthMetricsDashboardWidget.routeName,
          path: HealthMetricsDashboardWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HealthMetricsDashboard')
              : HealthMetricsDashboardWidget(
                  fromViewMetrics: params.getParam(
                    'fromViewMetrics',
                    ParamType.bool,
                  ),
                ),
        ),
        FFRoute(
          name: RemindersandNotificationsScreenWidget.routeName,
          path: RemindersandNotificationsScreenWidget.routePath,
          builder: (context, params) => RemindersandNotificationsScreenWidget(),
        ),
        FFRoute(
          name: UserProfileScreenWidget.routeName,
          path: UserProfileScreenWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'UserProfileScreen')
              : UserProfileScreenWidget(),
        ),
        FFRoute(
          name: DeviceSyncScreenWidget.routeName,
          path: DeviceSyncScreenWidget.routePath,
          builder: (context, params) => DeviceSyncScreenWidget(),
        ),
        FFRoute(
          name: ErrorScreenWidget.routeName,
          path: ErrorScreenWidget.routePath,
          builder: (context, params) => ErrorScreenWidget(),
        ),
        FFRoute(
          name: ForgotpasswordWidget.routeName,
          path: ForgotpasswordWidget.routePath,
          builder: (context, params) => ForgotpasswordWidget(
            fromPrivacyAndSecurity: params.getParam(
              'fromPrivacyAndSecurity',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: HealthmetricsformWidget.routeName,
          path: HealthmetricsformWidget.routePath,
          builder: (context, params) => HealthmetricsformWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            practitionerID: params.getParam(
              'practitionerID',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: PrivacyAndSecurityWidget.routeName,
          path: PrivacyAndSecurityWidget.routePath,
          builder: (context, params) => PrivacyAndSecurityWidget(),
        ),
        FFRoute(
          name: ResetPasswordWidget.routeName,
          path: ResetPasswordWidget.routePath,
          builder: (context, params) => ResetPasswordWidget(
            emailORphone: params.getParam(
              'emailORphone',
              ParamType.String,
            ),
            method: params.getParam(
              'method',
              ParamType.String,
            ),
            isEmailSelected: params.getParam(
              'isEmailSelected',
              ParamType.bool,
            ),
            isPhoneSelected: params.getParam(
              'isPhoneSelected',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: PractitionerDashboardWidget.routeName,
          path: PractitionerDashboardWidget.routePath,
          builder: (context, params) => PractitionerDashboardWidget(),
        ),
        FFRoute(
          name: SignUpAuthenticationWidget.routeName,
          path: SignUpAuthenticationWidget.routePath,
          builder: (context, params) => SignUpAuthenticationWidget(),
        ),
        FFRoute(
          name: ClientDetailsAtPractitionerSideWidget.routeName,
          path: ClientDetailsAtPractitionerSideWidget.routePath,
          builder: (context, params) => ClientDetailsAtPractitionerSideWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            phoneNumber: params.getParam(
              'phoneNumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RegisterClientfromPractitionerWidget.routeName,
          path: RegisterClientfromPractitionerWidget.routePath,
          builder: (context, params) => RegisterClientfromPractitionerWidget(),
        ),
        FFRoute(
          name: ClientHealthDashboardAtPSWidget.routeName,
          path: ClientHealthDashboardAtPSWidget.routePath,
          builder: (context, params) => ClientHealthDashboardAtPSWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            userID: params.getParam(
              'userID',
              ParamType.String,
            ),
            gender: params.getParam(
              'gender',
              ParamType.String,
            ),
            age: params.getParam(
              'age',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ViewProfileWidget.routeName,
          path: ViewProfileWidget.routePath,
          builder: (context, params) => ViewProfileWidget(),
        ),
        FFRoute(
          name: SignUpAdminWidget.routeName,
          path: SignUpAdminWidget.routePath,
          builder: (context, params) => SignUpAdminWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            contact: params.getParam(
              'contact',
              ParamType.String,
            ),
            emailOTP: params.getParam(
              'emailOTP',
              ParamType.String,
            ),
            phoneOTP: params.getParam(
              'phoneOTP',
              ParamType.String,
            ),
            sessionID: params.getParam(
              'sessionID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LoginAdminWidget.routeName,
          path: LoginAdminWidget.routePath,
          builder: (context, params) => LoginAdminWidget(),
        ),
        FFRoute(
          name: SignUpCopyWidget.routeName,
          path: SignUpCopyWidget.routePath,
          builder: (context, params) => SignUpCopyWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            contact: params.getParam(
              'contact',
              ParamType.String,
            ),
            sessionID: params.getParam(
              'sessionID',
              ParamType.String,
            ),
            role: params.getParam(
              'role',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: HealthdashboardWidget.routeName,
          path: HealthdashboardWidget.routePath,
          builder: (context, params) => HealthdashboardWidget(),
        ),
        FFRoute(
          name: Dashboard1Widget.routeName,
          path: Dashboard1Widget.routePath,
          builder: (context, params) => Dashboard1Widget(),
        ),
        FFRoute(
          name: ViewMetricsWidget.routeName,
          path: ViewMetricsWidget.routePath,
          builder: (context, params) => ViewMetricsWidget(),
        ),
        FFRoute(
          name: EditHealthmetricsRecordWidget.routeName,
          path: EditHealthmetricsRecordWidget.routePath,
          builder: (context, params) => EditHealthmetricsRecordWidget(
            recordID: params.getParam(
              'recordID',
              ParamType.String,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            selectedDate: params.getParam(
              'selectedDate',
              ParamType.DateTime,
            ),
            fromViewMetricsPage: params.getParam(
              'fromViewMetricsPage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ViewMetricsHistoryWidget.routeName,
          path: ViewMetricsHistoryWidget.routePath,
          builder: (context, params) => ViewMetricsHistoryWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            selectedDate: params.getParam(
              'selectedDate',
              ParamType.DateTime,
            ),
            fromViewMetricsPage: params.getParam(
              'fromViewMetricsPage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ViewAllMetricsOfEachRecordWidget.routeName,
          path: ViewAllMetricsOfEachRecordWidget.routePath,
          builder: (context, params) => ViewAllMetricsOfEachRecordWidget(
            recordID: params.getParam(
              'recordID',
              ParamType.String,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DraftWidget.routeName,
          path: DraftWidget.routePath,
          builder: (context, params) => DraftWidget(),
        ),
        FFRoute(
          name: HealthMetricsGraphsWidget.routeName,
          path: HealthMetricsGraphsWidget.routePath,
          builder: (context, params) => HealthMetricsGraphsWidget(
            metricName: params.getParam(
              'metricName',
              ParamType.String,
            ),
            userID: params.getParam(
              'userID',
              ParamType.String,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            gender: params.getParam(
              'gender',
              ParamType.String,
            ),
            age: params.getParam(
              'age',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: HealthMetricsGraphsCopyWidget.routeName,
          path: HealthMetricsGraphsCopyWidget.routePath,
          builder: (context, params) => HealthMetricsGraphsCopyWidget(
            metricName: params.getParam(
              'metricName',
              ParamType.String,
            ),
            userID: params.getParam(
              'userID',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: DraftofGraphWidget.routeName,
          path: DraftofGraphWidget.routePath,
          builder: (context, params) => DraftofGraphWidget(
            metricName: params.getParam(
              'metricName',
              ParamType.String,
            ),
            userID: params.getParam(
              'userID',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: DemoedHealthGraphsWidget.routeName,
          path: DemoedHealthGraphsWidget.routePath,
          builder: (context, params) => DemoedHealthGraphsWidget(
            metricName: params.getParam(
              'metricName',
              ParamType.String,
            ),
            userID: params.getParam(
              'userID',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: HealthMetricsGraphsChoiceChipsWidget.routeName,
          path: HealthMetricsGraphsChoiceChipsWidget.routePath,
          builder: (context, params) => HealthMetricsGraphsChoiceChipsWidget(
            metricName: params.getParam(
              'metricName',
              ParamType.String,
            ),
            userID: params.getParam(
              'userID',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: HealthMetricsGraphsChartsWidget.routeName,
          path: HealthMetricsGraphsChartsWidget.routePath,
          builder: (context, params) => HealthMetricsGraphsChartsWidget(
            metricName: params.getParam(
              'metricName',
              ParamType.String,
            ),
            userID: params.getParam(
              'userID',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: HealthMetricsGraphsCopy2Widget.routeName,
          path: HealthMetricsGraphsCopy2Widget.routePath,
          builder: (context, params) => HealthMetricsGraphsCopy2Widget(
            metricName: params.getParam(
              'metricName',
              ParamType.String,
            ),
            userID: params.getParam(
              'userID',
              ParamType.int,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PractitionerProfileScreenWidget.routeName,
          path: PractitionerProfileScreenWidget.routePath,
          builder: (context, params) => PractitionerProfileScreenWidget(),
        ),
        FFRoute(
          name: HealthMetricsGraphsFinalWidget.routeName,
          path: HealthMetricsGraphsFinalWidget.routePath,
          builder: (context, params) => HealthMetricsGraphsFinalWidget(
            metricName: params.getParam(
              'metricName',
              ParamType.String,
            ),
            userID: params.getParam(
              'userID',
              ParamType.int,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            gender: params.getParam(
              'gender',
              ParamType.String,
            ),
            age: params.getParam(
              'age',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: HomeScreenFinalWidget.routeName,
          path: HomeScreenFinalWidget.routePath,
          builder: (context, params) => HomeScreenFinalWidget(),
        ),
        FFRoute(
          name: HealthmetricsformFinalWidget.routeName,
          path: HealthmetricsformFinalWidget.routePath,
          builder: (context, params) => HealthmetricsformFinalWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: EditHealthmetricsRecordFinalWidget.routeName,
          path: EditHealthmetricsRecordFinalWidget.routePath,
          builder: (context, params) => EditHealthmetricsRecordFinalWidget(
            recordID: params.getParam(
              'recordID',
              ParamType.int,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            selectedDate: params.getParam(
              'selectedDate',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: BookAppointmentWidget.routeName,
          path: BookAppointmentWidget.routePath,
          builder: (context, params) => BookAppointmentWidget(
            userID: params.getParam(
              'userID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AppointmentsWidget.routeName,
          path: AppointmentsWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Appointments')
              : AppointmentsWidget(),
        ),
        FFRoute(
          name: AppointmentsCopyWidget.routeName,
          path: AppointmentsCopyWidget.routePath,
          builder: (context, params) => AppointmentsCopyWidget(),
        ),
        FFRoute(
          name: PractitionerAppointmentsWidget.routeName,
          path: PractitionerAppointmentsWidget.routePath,
          builder: (context, params) => PractitionerAppointmentsWidget(),
        ),
        FFRoute(
          name: ClientHealthDashboardAtPSCopyWidget.routeName,
          path: ClientHealthDashboardAtPSCopyWidget.routePath,
          builder: (context, params) => ClientHealthDashboardAtPSCopyWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            userID: params.getParam(
              'userID',
              ParamType.String,
            ),
            gender: params.getParam(
              'gender',
              ParamType.String,
            ),
            age: params.getParam(
              'age',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: LinksWidget.routeName,
          path: LinksWidget.routePath,
          builder: (context, params) => LinksWidget(),
        ),
        FFRoute(
          name: PractitionerLinksWidget.routeName,
          path: PractitionerLinksWidget.routePath,
          builder: (context, params) => PractitionerLinksWidget(),
        ),
        FFRoute(
          name: AppointmentsCopy2Widget.routeName,
          path: AppointmentsCopy2Widget.routePath,
          builder: (context, params) => AppointmentsCopy2Widget(),
        ),
        FFRoute(
          name: AppointmentsNewFinalWidget.routeName,
          path: AppointmentsNewFinalWidget.routePath,
          builder: (context, params) => AppointmentsNewFinalWidget(),
        ),
        FFRoute(
          name: PractitionerAppointmentsNewFinalWidget.routeName,
          path: PractitionerAppointmentsNewFinalWidget.routePath,
          builder: (context, params) =>
              PractitionerAppointmentsNewFinalWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/image_copy.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}

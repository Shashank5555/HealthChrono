import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/api_requests/api_manager.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _loginAccessToken = '';
  String get loginAccessToken => _loginAccessToken;
  set loginAccessToken(String value) {
    _loginAccessToken = value;
  }

  String _role = '';
  String get role => _role;
  set role(String value) {
    _role = value;
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
  }

  bool _hasLoadedBefore = false;
  bool get hasLoadedBefore => _hasLoadedBefore;
  set hasLoadedBefore(bool value) {
    _hasLoadedBefore = value;
  }

  final _userDetailsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> userDetails({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _userDetailsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDetailsCache() => _userDetailsManager.clear();
  void clearUserDetailsCacheKey(String? uniqueKey) =>
      _userDetailsManager.clearRequest(uniqueKey);

  final _metricsDetailsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> metricsDetails({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _metricsDetailsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMetricsDetailsCache() => _metricsDetailsManager.clear();
  void clearMetricsDetailsCacheKey(String? uniqueKey) =>
      _metricsDetailsManager.clearRequest(uniqueKey);

  final _scatterPlotsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> scatterPlots({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _scatterPlotsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearScatterPlotsCache() => _scatterPlotsManager.clear();
  void clearScatterPlotsCacheKey(String? uniqueKey) =>
      _scatterPlotsManager.clearRequest(uniqueKey);
}

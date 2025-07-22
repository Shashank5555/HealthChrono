import '/auth/custom_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future authCheck(BuildContext context) async {
  if (getCurrentTimestamp < currentAuthTokenExpiration!) {
    return;
  }
}

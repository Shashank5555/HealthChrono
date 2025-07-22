import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class HealthChronoAuthUser {
  HealthChronoAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<HealthChronoAuthUser> healthChronoAuthUserSubject =
    BehaviorSubject.seeded(HealthChronoAuthUser(loggedIn: false));
Stream<HealthChronoAuthUser> healthChronoAuthUserStream() =>
    healthChronoAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);

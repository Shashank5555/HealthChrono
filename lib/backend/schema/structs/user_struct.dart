// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? email,
    String? role,
    String? createdTime,
    bool? biometricVerification,
  })  : _email = email,
        _role = role,
        _createdTime = createdTime,
        _biometricVerification = biometricVerification;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "created_time" field.
  String? _createdTime;
  String get createdTime => _createdTime ?? '';
  set createdTime(String? val) => _createdTime = val;

  bool hasCreatedTime() => _createdTime != null;

  // "biometric_verification" field.
  bool? _biometricVerification;
  bool get biometricVerification => _biometricVerification ?? false;
  set biometricVerification(bool? val) => _biometricVerification = val;

  bool hasBiometricVerification() => _biometricVerification != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        email: data['email'] as String?,
        role: data['role'] as String?,
        createdTime: data['created_time'] as String?,
        biometricVerification: data['biometric_verification'] as bool?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'role': _role,
        'created_time': _createdTime,
        'biometric_verification': _biometricVerification,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.String,
        ),
        'biometric_verification': serializeParam(
          _biometricVerification,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.String,
          false,
        ),
        biometricVerification: deserializeParam(
          data['biometric_verification'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        email == other.email &&
        role == other.role &&
        createdTime == other.createdTime &&
        biometricVerification == other.biometricVerification;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([email, role, createdTime, biometricVerification]);
}

UserStruct createUserStruct({
  String? email,
  String? role,
  String? createdTime,
  bool? biometricVerification,
}) =>
    UserStruct(
      email: email,
      role: role,
      createdTime: createdTime,
      biometricVerification: biometricVerification,
    );

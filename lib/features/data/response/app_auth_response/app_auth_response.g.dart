// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutAuthResponse _$LogoutAuthResponseFromJson(Map<String, dynamic> json) =>
    LogoutAuthResponse(
      json['isLoggedOut'] as bool?,
    )
      ..status = json['status'] as int?
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$LogoutAuthResponseToJson(LogoutAuthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'message': instance.message,
      'code': instance.code,
      'isLoggedOut': instance.isLoggedOut,
    };

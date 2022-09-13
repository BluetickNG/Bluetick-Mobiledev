// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signupservices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpServices _$SignUpServicesFromJson(Map<String, dynamic> json) =>
    SignUpServices(
      json['email'] as String,
      json['fullname'] as String,
      json['role'] as String,
      json['password1'],
      json['password2'],
    );

Map<String, String> _$SignUpServicesToJson(SignUpServices instance) =>
    <String, String>{
      'fullname': instance.fullname,
      'role': instance.role,
      'password1': instance.password1,
      'password2': instance.password2,
    };

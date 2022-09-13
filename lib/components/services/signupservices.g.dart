// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signupservices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpServices _$SignUpServicesFromJson(Map<String, dynamic> json) =>
    SignUpServices(
      json['fullname'] as String,
      json['role'] as String,
      json['password'],
      json['confirmpassword'],
    );

Map<String, String> _$SignUpServicesToJson(SignUpServices instance) =>
    <String, String>{
      'fullname': instance.fullname,
      'role': instance.role,
      'password': instance.password,
      'confirmpassword': instance.confirmpassword,
    };

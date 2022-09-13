import 'package:json_annotation/json_annotation.dart';

part 'invsignup_services.g.dart';

@JsonSerializable()

class InvSignUpServices{
  final String email;
  final String link;

  InvSignUpServices(this.email, this.link);

  factory InvSignUpServices.fromJson(Map<String, String> json) => _$InvSignUpServicesFromJson(json);

  Map<String, String>toJson()=> _$InvSignUpServicesToJson(this);
}



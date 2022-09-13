import 'package:json_annotation/json_annotation.dart';

part 'signupservices.g.dart';

@JsonSerializable()

class SignUpServices{
    final String fullname;
    final String role;
    final password;
    final confirmpassword;
    SignUpServices(this.fullname, this.role, this.password, this.confirmpassword);

    factory SignUpServices.fromJson(Map<String, String> json) => _$SignUpServicesFromJson(json);

    Map<String, String>toJson()=> _$SignUpServicesToJson(this);
}
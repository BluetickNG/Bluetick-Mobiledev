import 'package:json_annotation/json_annotation.dart';

part 'signupservices.g.dart';

@JsonSerializable()

class SignUpServices{
    final String email;
    final String fullname;
    final String role;
    final password1;
    final password2;
    SignUpServices(this.email, this.fullname, this.role, this.password1, this.password2);

    factory SignUpServices.fromJson(Map<String, String> json) => _$SignUpServicesFromJson(json);

    Map<String, String>toJson()=> _$SignUpServicesToJson(this);
}
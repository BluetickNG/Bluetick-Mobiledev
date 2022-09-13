import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bluetick/components/services/invsignup_services.dart';
import '../controller/signUpController.dart';
import '../services/signupservices.dart';



final invitationProvider =
FutureProvider.family((ref, Map<String, String> value) {
  final invTData = InvSignUpServices.fromJson(value);
  invSignUpController().postData(invTData);
  return invTData;
});

final signUpProvider =
FutureProvider.autoDispose.family((ref, Map<String, String> value) {
  final signUpData = SignUpServices.fromJson(value);
  SignUpController().postData(signUpData);
  return signUpData;
});

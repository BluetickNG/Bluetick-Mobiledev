import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../services/invsignup_services.dart';
import '../services/constant.dart';
import 'dart:convert';

import '../services/signupservices.dart';


class invSignUpController {
  List? data;

  //SignUpController();

  Future postData(invData) async {
    try {
      Request request =
      http.Request('POST', Uri.parse('${BASE_URL}/signemail'));
      final InvService = InvSignUpServices(invData.email, invData.link);

      request.body = '${InvService.toJson()}';

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return 'success';
      } else {
        ////
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future fetchData() async {
    Uri url = Uri.https(BASE_URL, '/signemail');
    var request = await http.get(url);

    if (request.statusCode == 200) {
      var jsonResponse = jsonDecode(request.body) as Map<String, String>;
      InvSignUpServices data = InvSignUpServices.fromJson(jsonResponse);
      String email = data.email;
      String link = data.link;
    } else {}
  }
}
class SignUpController {

  //SignUpController();

  Future postData(signUpData) async {
    try {
      Request request =
      http.Request('POST', Uri.parse('${BASE_URL}/signup'));
      final service = SignUpServices(signUpData.email, signUpData.fullname, signUpData.role, signUpData.password, signUpData.confirmPassword);
      request.body = '${service.toJson()}';

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return 'success';
      } else {
        ////
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future fetchData() async {
    Uri url = Uri.https(BASE_URL, '/signup');
    var request = await http.get(url);

    if (request.statusCode == 200) {
      var jsonResponse = jsonDecode(request.body) as Map<String, String>;
      SignUpServices data = SignUpServices.fromJson(jsonResponse);
    } else {}
  }
}

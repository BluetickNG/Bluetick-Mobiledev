import 'dart:convert';
import 'dart:io';

import 'package:bluetick/components/services/api_models/admin_signupresponse.dart';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/forgot_password_body.dart';
import 'package:bluetick/components/services/constant.dart';
import 'package:bluetick/components/states/login_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class forgotPasswordRepo extends StateNotifier<LoginState> {
  Reader reader;
  forgotPasswordRepo(this.reader) : super(LoginState());

  void checkingIsLoading() {
    state = state.update(!state.isLoading);
  }

  Future<Either<ErrorModel, AdminSignupresponse>> forgotpassrequest(
      ForgotPasswordBody forgotPasswordBody) async {
    state = state.update(true);

    try {
      var response = await http.post(
        Uri.parse('$BASE_URL/forgotpass'),
        body: jsonEncode(forgotPasswordBody.toBody()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == HttpStatus.ok) {
        var decodedResponse = jsonDecode(response.body);
        var responseGotten = AdminSignupresponse.fromResponse(decodedResponse);
        return Right(responseGotten);
      } else {
        return Left(
          ErrorModel(
              message: {'message': '${jsonDecode(response.body)['message']}'},
              code: response.statusCode),
        );
      }
    } on SocketException {
      return Left(ErrorModel(
          message: {'message': 'Sorry, you don\'t have internet connection'},
          code: null));
    } catch (e) {
      return Left(ErrorModel(message: {'message': e.toString()}, code: 400));
    } finally {
      state = state.update(false);
    }
  }
}

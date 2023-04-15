import 'dart:convert';
import 'package:api_repo/api_services/api_response.dart';
import 'package:api_repo/repo/sign_in_repo_post.dart';
import 'package:get/get.dart';

class SignInViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;
  late SignInResponseModel response;
  Future<void> signInViewModel(SignInRequestModel model) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    print("model ---------- ${jsonEncode(model.toJson())}");
    try {
      print('trsp==RegisterResponseModel=>');
      response = await SignInRepo().signInRepo(model.toJson());
      print('trsp==RegisterResponseModel=>${response}');

      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());
      print(".........   $e");
    }
    update();
  }
}

class SignInRequestModel {
  String? email;
  String? password;

  SignInRequestModel({this.email, this.password});

  SignInRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

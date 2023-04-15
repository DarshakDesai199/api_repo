import 'package:api_repo/api_services/api_response.dart';
import 'package:api_repo/repo/exp_repo_get.dart';
import 'package:get/get.dart';

class ExperienceViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> getExperienceLevel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ExperienceLevelResModel response =
          await ExperienceRepo().experienceRepo();
      _apiResponse = ApiResponse.complete(response);
    } catch (error) {
      print(".........>$error");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}

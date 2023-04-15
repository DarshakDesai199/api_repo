import 'package:api_repo/api_services/api_response.dart';
import 'package:api_repo/repo/get_store_repo.dart';
import 'package:get/get.dart';

class GetStoreViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;
  late List<GetStoreResponseModel> response;
  // dynamic response;
  Future<void> getStoreDetails() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      response = await GetStoreRepo().getStoresRepo();
      print('trsp==getStoreViewModel=>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());
      print(".........   $e");
    }
    update();
  }
}

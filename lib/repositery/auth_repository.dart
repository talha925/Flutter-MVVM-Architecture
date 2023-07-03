import 'package:mvvm/data/network/network_api_sevices.dart';
import 'package:mvvm/res/app_url.dart';

import '../data/network/base_api_services.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginApiUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.signUpApiUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

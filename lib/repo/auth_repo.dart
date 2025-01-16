
import 'package:fc_news/helper/network/base_api_services.dart';
import 'package:fc_news/helper/network/network_api_services.dart';
import 'package:fc_news/res/api_url.dart';
import 'package:flutter/foundation.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> authApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse("${ApiUrl.authApi}$data", );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during loginApi: $e');
      }
      rethrow;
    }
  }
  Future<dynamic> registerApi(dynamic data) async {
    print(data);
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.registerApi,data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during registerApi: $e');
      }
      rethrow;
    }
  }
  Future<dynamic> otpApi(dynamic phone) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse("${ApiUrl.sendOtp}mobile=$phone&digit=6&mode=test");
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during otpApi: $e');
      }
      rethrow;
    }
  }
  Future<dynamic> verifyOtpApi(dynamic phone,dynamic otp) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse("${ApiUrl.verifyOtp}mobile=$phone&otp=$otp");
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during verifyOtpApi: $e');
      }
      rethrow;
    }
  }
}
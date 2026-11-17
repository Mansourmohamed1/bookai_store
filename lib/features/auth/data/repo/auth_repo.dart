import 'package:bookai_store/core/services/dio/apis.dart';
import 'package:bookai_store/core/services/dio/dio_provider.dart';
import 'package:bookai_store/core/services/local/shared_pref.dart';
import 'package:bookai_store/features/auth/data/model/auth_params.dart';
import 'package:bookai_store/features/auth/data/model/auth_response/auth_response.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  static Future<AuthResponse?> login(AuthParams authParams) async {
    try {
      var response = await DioProvider.postApi(
        endpoint: Apis.login,
        data: authParams.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return _mapAuthResponse(response);
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }

  static Future<AuthResponse?> register(AuthParams authParams) async {
    try {
      var response = await DioProvider.postApi(
        endpoint: Apis.register,
        data: authParams.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return _mapAuthResponse(response);
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }

  static AuthResponse? _mapAuthResponse(Response<dynamic> response) {
    try {
      var authResponse = AuthResponse.fromJson(response.data);
      SharedPref.setUserData(authResponse.data?.user);
      SharedPref.setToken(authResponse.data?.token);
      return authResponse;
    } on Exception catch (_) {
      return null;
    }
  }
}

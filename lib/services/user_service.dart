import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:municipality_app/constants/apis.dart';
import 'package:municipality_app/constants/shared_preferences_constants.dart';
import 'package:municipality_app/models/signup_model.dart';
import 'package:municipality_app/models/user.dart';
import 'package:municipality_app/models/user_credentials.dart';
import 'package:municipality_app/utils/http_utils.dart';
import 'package:municipality_app/utils/shared_preferences_util.dart';

class UserService {
  late HttpUtil _httpUtil;
  UserService() {
    _httpUtil = HttpUtil();
  }
  Future<User?> autoSignIn() async {
    String? refreshToken = await SharedPreferencesUtil.getString(
        SharedPreferencesConstants.REFRESH_TOKEN);
    String? token =
        await SharedPreferencesUtil.getString(SharedPreferencesConstants.JWT);

    try {
      if (refreshToken != null &&
          refreshToken.trim() != '' &&
          token != null &&
          token.trim() != '') {
        dynamic response = await _httpUtil.makeRequest(
          type: RequestType.post,
          path: Apis.REFRESH_TOKEN,
          timeoutSeconds: 5,
          data: {
            "refreshToken": refreshToken,
            "token": token,
          },
        );
        return _handleUserAuthResponse(response);
      }
      return null;
    } catch (exp) {
      return null;
    }
  }

  Future<User?> signUp({required SignUpModel signUpModel}) async {
    try {
      print(">>>>>>1");
      print(signUpModel.toJson());

      dynamic response = await _httpUtil.makeRequest(
        type: RequestType.post,
        path: Apis.SIGNUP_USER,
        data: signUpModel.toJson(),
      );
      return User.fromJson({}
        ..addAll(response)
        ..addAll(response['citizen']));
    } catch (exp) {
      print(exp);
      return null;
    }
  }

  Future<User?> _handleUserAuthResponse(Map response) async {
    Map<String, dynamic> payload = JwtDecoder.decode(response['token'] ?? '');

    await SharedPreferencesUtil.setString(
      SharedPreferencesConstants.JWT,
      response['token'],
    );
    await SharedPreferencesUtil.setString(
      SharedPreferencesConstants.REFRESH_TOKEN,
      response['refreshToken'],
    );

    User user = User.fromJson({}
      ..addAll(response['user'])
      ..addAll(response['user']['citizen'] ?? {})
      ..addAll({'IsApproved': payload['IsApproved']}));

    return user;
  }

  Future<User?> signIn({required UserCredentials credentials}) async {
    dynamic response = await _httpUtil.makeRequest(
      type: RequestType.post,
      path: Apis.SIGN_IN,
      data: credentials.toJson(),
    );

    return _handleUserAuthResponse(response);
  }

  Future<void> logout() async {
    await SharedPreferencesUtil.clear();
  }

  Future<bool> changePassword(Map<String, String> inputs) async {
    try {
      await _httpUtil.makeRequest(
        type: RequestType.put,
        path: Apis.CHANGE_PASSWORD,
        data: inputs,
      );
      await SharedPreferencesUtil.setString(
        SharedPreferencesConstants.PASSWORD,
        inputs['newPassword'] ?? '',
      );

      return true;
    } catch (exp) {
      print(exp);
      return false;
    }
  }

  Future<bool> forgotPassword(Map<String, String> inputs) async {
    try {
      await _httpUtil.makeRequest(
        type: RequestType.put,
        path: Apis.FORGOT_PASSWORD,
        data: inputs,
      );
      await SharedPreferencesUtil.setString(
        SharedPreferencesConstants.PASSWORD,
        inputs['newPassword'] ?? '',
      );

      return true;
    } catch (exp) {
      print(exp);
      return false;
    }
  }

  Future<User?> verifyUser({
    required String idNumber,
    required String pinCode,
  }) async {
    dynamic response = await _httpUtil.makeRequest(
      type: RequestType.post,
      path: Apis.VERIFY_CODE,
      data: {
        "idNumber": idNumber,
        "code": pinCode,
      },
    );
    return _handleUserAuthResponse(response);
  }

  Future<bool> resendVerificationCode(
    String idNumber,
  ) async {
    try {
      await _httpUtil.makeRequest(
        type: RequestType.post,
        path: 'user/GenerateVerificationCode/$idNumber',
      );
      return true;
    } catch (exp) {
      print(exp);
      return false;
    }
  }

  Future<bool> updateUserProfile({
    XFile? profileImage,
    String? email,
    String? address,
  }) async {
    try {
      Map<String, dynamic> bodyData = {};
      if (profileImage != null) {
        bodyData['ProfilePicture'] = await MultipartFile.fromFile(
          profileImage.path,
          filename: profileImage.name,
        );
      }
      bodyData['email'] = email;
      bodyData['AddressLine1'] = address;

      final dynamic data = await _httpUtil.makeRequest(
        path: Apis.UPDATE_USER_PROFILE,
        type: RequestType.put,
        data: FormData.fromMap(bodyData),
      );
      return true;
    } catch (exp) {
      return false;
    }
  }
}

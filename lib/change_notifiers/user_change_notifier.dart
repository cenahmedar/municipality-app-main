import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipality_app/models/signup_model.dart';
import 'package:municipality_app/models/user.dart';
import 'package:municipality_app/models/user_credentials.dart';
import 'package:municipality_app/services/user_service.dart';

class UserChangeNotifier extends ChangeNotifier {
  StreamController<User?> _userController = StreamController<User?>.broadcast();
  Stream<User?> get user => _userController.stream;
  late UserService _userService;
  UserChangeNotifier() {
    _userService = UserService();
  }
  void setUser(User? user) {
    _userController.add(user);
  }

  Future<bool> userLogin({required UserCredentials credentials}) async {
    try {
      User? user = await _userService.signIn(credentials: credentials);
      setUser(user);
      return true;
    } catch (exp) {
      setUser(null);
      return false;
    }
  }

  Future<User?> signupUser({required SignUpModel signUpModel}) async {
    try {
      User? user = await _userService.signUp(signUpModel: signUpModel);
      setUser(user);
      return user;
    } catch (exp) {
      setUser(null);
      return null;
    }
  }

  Future<void> autoSignin() async {
    try {
      User? user = await _userService.autoSignIn();
      setUser(user);
    } catch (exp) {
      setUser(null);
    }
  }

  Future<void> logout() async {
    try {
      await _userService.logout();
      setUser(null);
    } catch (exp) {
      setUser(null);
    }
  }

  Future<bool> verifyUser({
    required String idNumber,
    required String pinCode,
    bool setUserFlag = true,
  }) async {
    try {
      User? user =
          await _userService.verifyUser(idNumber: idNumber, pinCode: pinCode);
      if (setUserFlag) {
        setUser(user);
      }

      return true;
    } catch (exp) {
      setUser(null);
      return false;
    }
  }

  Future<User?> updateUserProfile({
    required User user,
    XFile? profileImage,
    String? email,
    String? address,
  }) async {
    try {
      await _userService.updateUserProfile(
        profileImage: profileImage,
        email: email,
        address: address,
      );
      User _newUser = user;
      _newUser.email = email;
      _newUser.addressLine1 = address;
      setUser(_newUser);
      return _newUser;
    } catch (exp) {
      return null;
    }
  }
}

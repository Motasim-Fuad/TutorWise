import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user_model.dart';

class UserPreferences {
  static const _keyToken = 'token';
  static const _keyUserType = 'userType';
  static const _keyIsLogin = 'isLogin';
  static const _keyStudentId = 'studentId';

  Future<bool> saveUser(UserModel user) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString(_keyToken, user.token);
      await sp.setString(_keyUserType, user.userType);
      await sp.setBool(_keyIsLogin, user.isLogin);



      if (kDebugMode) {
        print("Saving user -> token: ${user.token}, userType: ${user.userType},");
      }

      return true;
    } catch (e) {
      if (kDebugMode) {
        print("Error saving user data: $e");
      }
      return false;
    }
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    final token = sp.getString(_keyToken) ?? '';
    final userType = sp.getString(_keyUserType) ?? '';
    final isLogin = sp.getBool(_keyIsLogin) ?? false;
    final hasStudentId = sp.containsKey(_keyStudentId);
    final studentId = hasStudentId ? sp.getInt(_keyStudentId) : null;

    if (kDebugMode) {
      print("Loaded studentId: $studentId");
    }


    return UserModel(
      token: token,
      userType: userType,
      isLogin: isLogin,
    );


  }

  Future<void> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove(_keyToken);
    await sp.remove(_keyUserType);
    await sp.remove(_keyIsLogin);
    await sp.remove(_keyStudentId);
  }
}


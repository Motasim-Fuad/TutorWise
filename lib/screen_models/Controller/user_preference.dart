import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user_model.dart';

class UserPreferences {
  static const _keyToken = 'token';
  static const _keyUserType = 'userType';
  static const _keyIsLogin = 'isLogin';
  static const _keyUserName = 'username';

  Future<bool> saveUser(UserModel user) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString(_keyToken, user.token);
      await sp.setString(_keyUserName, user.userName);
      await sp.setString(_keyUserType, user.userType);
      await sp.setBool(_keyIsLogin, user.isLogin);

      if (kDebugMode) {
        print("Saving user -> token: ${user.token}, userType: ${user.userType}, userName: ${user.userName}");
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
    final userName = sp.getString(_keyUserName) ?? '';

    return UserModel(
      token: token,
      userType: userType,
      isLogin: isLogin,
      userName: userName,
    );
  }

  Future<void> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove(_keyToken);
    await sp.remove(_keyUserType);
    await sp.remove(_keyIsLogin);
    await sp.remove(_keyUserName);  // Ensure userName is also removed
  }
}



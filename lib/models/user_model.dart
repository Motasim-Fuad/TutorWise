class UserModel {
  final String token;
  final String userType;
  final bool isLogin;


  UserModel({
    required this.token,
    required this.userType,
    required this.isLogin,

  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      userType: json['userType'],
      isLogin: json['isLogin'],

    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'userType': userType,
    'isLogin': isLogin,

  };
}

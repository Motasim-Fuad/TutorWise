class UserModel {
  final String token;
  final String userType;
  final bool isLogin;
  final String userName;


  UserModel({
    required this.token,
    required this.userType,
    required this.isLogin,
    required this.userName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      userType: json['userType'],
      isLogin: json['isLogin'],
      userName: json['username'],

    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'userType': userType,
    'isLogin': isLogin,
    'username':userName,
  };
}

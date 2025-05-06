class UserModel {
  final String token;
  final String userType;
  final bool isLogin;
  final int? studentId;

  UserModel({
    required this.token,
    required this.userType,
    required this.isLogin,
    required this.studentId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      userType: json['userType'],
      isLogin: json['isLogin'],
      studentId: json['studentId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'userType': userType,
    'isLogin': isLogin,
    'studentId': studentId,
  };
}

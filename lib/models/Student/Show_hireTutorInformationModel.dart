class HireTutorInformationModel {
  final int id;
  final String? classOrLevel;
  final String fullName;
  final String subject;
  final String daysPerWeek;
  final String chargePerMonth;
  final String tutorIWillTeach;
  final String profileDescription;
  final String profileHeadline;
  final String? location;
  final String collegeName;
  final String collegeCgpa;
  final String universityName;
  final String universityCgpa;
  final String profilePicture;
  final DateTime tutorJoinedDate;
  final bool isProTutor;
  final bool isVerified;

  HireTutorInformationModel({
    required this.id,
    this.classOrLevel,
    required this.fullName,
    required this.subject,
    required this.daysPerWeek,
    required this.chargePerMonth,
    required this.tutorIWillTeach,
    required this.profileDescription,
    required this.profileHeadline,
    this.location,
    required this.collegeName,
    required this.collegeCgpa,
    required this.universityName,
    required this.universityCgpa,
    required this.profilePicture,
    required this.tutorJoinedDate,
    required this.isProTutor,
    required this.isVerified,
  });

  factory HireTutorInformationModel.fromJson(Map<String, dynamic> json) {
    return HireTutorInformationModel(
      id: json['id'],
      classOrLevel: json['class_or_level'],
      fullName: json['full_name'],
      subject: json['subject'],
      daysPerWeek: json['days_per_week'],
      chargePerMonth: json['charge_per_month'],
      tutorIWillTeach: json['tutor_i_will_teach'],
      profileDescription: json['profile_description'],
      profileHeadline: json['profile_headline'],
      location: json['location'],
      collegeName: json['college_name'],
      collegeCgpa: json['college_cgpa'],
      universityName: json['university_name'],
      universityCgpa: json['university_cgpa'],
      profilePicture: json['profile_picture'],
      tutorJoinedDate: DateTime.parse(json['tutor_joined_date']),
      isProTutor: json['is_pro_tutor'],
      isVerified: json['is_verified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'class_or_level': classOrLevel,
      'full_name': fullName,
      'subject': subject,
      'days_per_week': daysPerWeek,
      'charge_per_month': chargePerMonth,
      'tutor_i_will_teach': tutorIWillTeach,
      'profile_description': profileDescription,
      'profile_headline': profileHeadline,
      'location': location,
      'college_name': collegeName,
      'college_cgpa': collegeCgpa,
      'university_name': universityName,
      'university_cgpa': universityCgpa,
      'profile_picture': profilePicture,
      'tutor_joined_date': tutorJoinedDate.toIso8601String(),
      'is_pro_tutor': isProTutor,
      'is_verified': isVerified,
    };
  }
}

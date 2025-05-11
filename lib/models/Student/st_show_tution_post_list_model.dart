class TutionPostResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<TutionPostItem> results;

  TutionPostResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory TutionPostResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return TutionPostResponse(
      count: data['count'] ?? 0,
      next: data['next'],
      previous: data['previous'],
      results: data['results'] != null
          ? List<TutionPostItem>.from(
        data['results'].map((x) => TutionPostItem.fromJson(x)),
      )
          : [],
    );
  }


}

class TutionPostItem {
  final int id;
  final String? profilePicture;
  final String? jobTitle;
  final bool? isActive;
  final String? educationalLevelChoices;
  final String? curriculum;
  final String? daysPerWeek;
  final String? budgetAmount;
  final dynamic additionalComment;
  final dynamic subject;
  final String? gender;
  final String? lessonType;

  TutionPostItem({
    required  this.id,
    this.profilePicture,
    this.jobTitle,
    this.isActive,
    this.educationalLevelChoices,
    this.curriculum,
    this.daysPerWeek,
    this.budgetAmount,
    this.additionalComment,
    this.subject,
    this.gender,
    this.lessonType,
  });

  factory TutionPostItem.fromJson(Map<String, dynamic> json) {
    return TutionPostItem(
      id: json['id'] ?? 0,
      profilePicture: json['profile_picture'] ?? '',
      jobTitle: json['job_title'] ?? '',
      isActive: json['is_active'] ?? false,
      educationalLevelChoices: json['educational_level_choices'] ?? '',
      curriculum: json['curriculum'] ?? '',
      daysPerWeek: json['days_per_week'] ?? '',
      budgetAmount: json['budget_amount']?.toString() ?? '',
      subject: json['subject'] is List ? List<String>.from(json['subject']) : [json['subject']?.toString() ?? ''],
      additionalComment: json['additional_comment'] is List ? List<String>.from(json['additional_comment']) : [json['additional_comment']?.toString() ?? ''],
      gender: json['gender'] ?? '',
      lessonType: json['lesson_type'] ?? '',
    );
  }

}

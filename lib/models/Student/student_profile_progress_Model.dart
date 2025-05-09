class StudentProfileProgressBarModel {
  final int completion;

  StudentProfileProgressBarModel({required this.completion});

  factory StudentProfileProgressBarModel.fromJson(Map<String, dynamic> json) {
    return StudentProfileProgressBarModel(
      completion: json['profile_complete_percentage'] ?? 0,
    );
  }
}


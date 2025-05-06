class StudentProfileModel {
  final int completion;

  StudentProfileModel({required this.completion});

  factory StudentProfileModel.fromJson(Map<String, dynamic> json) {
    return StudentProfileModel(completion: json['completion'] ?? 0);
  }
}

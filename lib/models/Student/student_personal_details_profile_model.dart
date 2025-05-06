class StudentLocationModel {
  final int id;
  final String name;

  StudentLocationModel({required this.id, required this.name});

  factory StudentLocationModel.fromJson(dynamic json) {
    if (json is List && json.length >= 2) {
      return StudentLocationModel(
        id: int.parse(json[0]),
        name: json[1],
      );
    } else if (json is Map<String, dynamic>) {
      return StudentLocationModel(
        id: int.parse(json['id'].toString()),
        name: json['name'],
      );
    } else {
      throw FormatException("Invalid format for location data: $json");
    }
  }

}

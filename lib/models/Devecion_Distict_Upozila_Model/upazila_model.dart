class Upazila {
  final int id;
  final int districtId;
  final String name;
  final String bnName;

  Upazila({
    required this.id,
    required this.districtId,
    required this.name,
    required this.bnName,
  });

  factory Upazila.fromJson(Map<String, dynamic> json) {
    return Upazila(
      id: int.parse(json['id']),
      districtId: int.parse(json['district_id']),
      name: json['name'],
      bnName: json['bn_name'],
    );
  }
}

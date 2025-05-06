class Division {
  final int id;
  final String name;
  final String bnName;

  Division({required this.id, required this.name, required this.bnName});

  factory Division.fromList(List<dynamic> json) {
    return Division(
      id: int.parse(json[0]),
      name: json[1],
      bnName: json[2],
    );
  }
}

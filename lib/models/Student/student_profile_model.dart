class StudentProfileModel {
  int? id;
  String? customizedUserId;
  String? studentPhone;
  String? profilePicture;
  String? fullName;
  String? address;
  String? location;
  String? divisionId;
  String? districtId;
  String? upazilaId;
  String? district;
  String? division;
  String? upazila;
  String? nidcardNumber;
  String? nidcardPicture;
  String? gender;
  int? user;

  StudentProfileModel(
      {this.id,
        this.customizedUserId,
        this.studentPhone,
        this.profilePicture,
        this.fullName,
        this.address,
        this.location,
        this.divisionId,
        this.districtId,
        this.upazilaId,
        this.district,
        this.division,
        this.upazila,
        this.nidcardNumber,
        this.nidcardPicture,
        this.gender,
        this.user});

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customizedUserId = json['customized_user_id'];
    studentPhone = json['student_phone'];
    profilePicture = json['profile_picture'];
    fullName = json['full_name'];
    address = json['address'];
    location = json['location'];
    divisionId = json['division_id'];
    districtId = json['district_id'];
    upazilaId = json['upazila_id'];
    district = json['district'];
    division = json['division'];
    upazila = json['upazila'];
    nidcardNumber = json['nidcard_number'];
    nidcardPicture = json['nidcard_picture'];
    gender = json['gender'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customized_user_id'] = this.customizedUserId;
    data['student_phone'] = this.studentPhone;
    data['profile_picture'] = this.profilePicture;
    data['full_name'] = this.fullName;
    data['address'] = this.address;
    data['location'] = this.location;
    data['division_id'] = this.divisionId;
    data['district_id'] = this.districtId;
    data['upazila_id'] = this.upazilaId;
    data['district'] = this.district;
    data['division'] = this.division;
    data['upazila'] = this.upazila;
    data['nidcard_number'] = this.nidcardNumber;
    data['nidcard_picture'] = this.nidcardPicture;
    data['gender'] = this.gender;
    data['user'] = this.user;
    return data;
  }
}

class DoctorDetail {
  String name, address, phoneNo, status, speciality, openingHour, closingHour;

  DoctorDetail(
      {this.name,
      this.address,
      this.phoneNo,
      this.status,
      this.speciality,
      this.openingHour,
      this.closingHour});

  DoctorDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    phoneNo = json['phoneNo'];
    status = json['status'];
    speciality = json['speciality'];
    openingHour = json['openingHour'];
    closingHour = json['closingHour'];
  }
}

class UserModel {
  String? email;
  String? wrool;
  String? uid;
  String? fullName;
  String? number;
  String? location;
  String? apartment;
  int? houses;
  DateTime? date;

// receiving data
  UserModel(
      {this.uid,
      this.email,
      this.wrool,
      this.fullName,
      this.number,
      this.location,
      this.apartment,
      this.houses,
      this.date});
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      wrool: map['wrool'],
      apartment: map['apartment'],
      date: map['date'],
      fullName: map['fullName'],
      location: map['location'],
      houses: map['houses'],
      number: map['number'],
    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'wrool': wrool,
      'fullName': fullName,
      'number': number,
      'location': location,
      'apartment': apartment,
      'houses': houses,
      'date': date
    };
  }
}

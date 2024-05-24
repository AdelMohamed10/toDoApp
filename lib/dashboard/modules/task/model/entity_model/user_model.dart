import 'dart:typed_data';

class UserModel {
  final String? fname;
  final String? lname;
  final String? email;
  final String? password;
  final int? id;

  UserModel({this.fname, this.lname, this.email, this.password, this.id});

  UserModel.fromJson(Map<String, dynamic> json)
      : fname = json['fname'],
        lname = json['lname'],
        email = json['email'],
        password = json['password'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {
      'fname': fname,
      'lname': lname,
      'email': email,
      'password': password,
      'id': id,
    };
  }
}

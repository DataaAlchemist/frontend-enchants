import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String userid;
  final String name;
  final String email;
  final String password;
  final String createdAt;
  final String updatedAt;
  final int v;

  const User({
    required this.id,
    required this.userid,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  @override
  List<Object?> get props =>
      [id, userid, name, email, password, createdAt, updatedAt, v];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      userid: json['userid'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}

class UserModel {
  final String name;
  final String email;
  final String dateOfBirth;
  final String onBehalf;

  UserModel({
    required this.name,
    required this.email,
    required this.dateOfBirth,
    required this.onBehalf,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'dateOfBirth': dateOfBirth,
      'onBehalf': onBehalf,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      onBehalf: map['onBehalf'] ?? '',
    );
  }
} 
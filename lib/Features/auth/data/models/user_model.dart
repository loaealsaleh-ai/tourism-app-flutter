class UserModel {
  final int id;
  final String username;
  final String email;
  final int? roleId;
  final String? emailVerifiedAt;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.roleId,
    this.emailVerifiedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      roleId: json['role_id'],
      emailVerifiedAt: json['email_verified_at'],
    );
  }
}

class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.createdAt,
    required this.profileImage,
    required this.role,
    required this.roleId,
    required this.isBanned,
  });

  final int id;
  final String username;
  final String email;
  final DateTime? createdAt;
  final dynamic profileImage;
  final String role;
  final dynamic roleId;
  final int isBanned;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id:
          json["id"] is String
              ? int.tryParse(json["id"]) ?? 0
              : json["id"] ?? 0,
      username: json["username"]?.toString() ?? "",
      email: json["email"]?.toString() ?? "",
      createdAt:
          json["created_at"] != null
              ? DateTime.tryParse(json["created_at"].toString())
              : null,
      profileImage: json["profile_image"],
      role: json["role"]?.toString() ?? "",
      roleId: json["role_id"],
      isBanned:
          json["is_banned"] is String
              ? int.tryParse(json["is_banned"]) ?? 0
              : json["is_banned"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "created_at": createdAt?.toIso8601String(),
    "profile_image": profileImage,
    "role": role,
    "role_id": roleId,
    "is_banned": isBanned,
  };



    UserModel copyWith({
    int? id,
    String? username,
    String? email,
    DateTime? createdAt,
    dynamic profileImage,
    String? role,
    dynamic roleId,
    int? isBanned,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      profileImage: profileImage ?? this.profileImage,
      role: role ?? this.role,
      roleId: roleId ?? this.roleId,
      isBanned: isBanned ?? this.isBanned,
    );
  }

}

class UpdateProfileModel {
  final String username;
  final String email;

  UpdateProfileModel({
    required this.username,
    required this.email,
  });
  Map<String, dynamic> toJson(int id ) => {
        'user_id': id,
        'name': username,
        'email': email,
      };

 

  UpdateProfileModel copyWith({
    String? username,
    String? email,
    String? profileImage,
  }) {
    return UpdateProfileModel(
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

}

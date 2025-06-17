class ChangePasswordModel {
  final String currentPassword;
  final String newPassword;

  ChangePasswordModel({
    required this.currentPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toJson(int id ) => {
          "user_id": id,
        'new_password': currentPassword,
        'old_password': newPassword,
      };

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      currentPassword: json['current_password'] ?? '',
      newPassword: json['new_password'] ?? '',
    );
  }

  ChangePasswordModel copyWith({
    String? currentPassword,
    String? newPassword,
    String? confirmPassword,
  }) {
    return ChangePasswordModel(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
    );
  }

}

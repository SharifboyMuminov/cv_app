class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String imageUrl;
  final String phoneNum;
  final String role;
  final String refreshToken;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.imageUrl,
    required this.phoneNum,
    required this.role,
    required this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String? ?? "",
      fullName: json['full_name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
      phoneNum: json['phone_number'] as String? ?? "",
      role: json['role'] as String? ?? "",
      refreshToken: json['refresh_token'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'image_url': imageUrl,
      'phone_num': phoneNum,
      'role': role,
      'refresh_token': refreshToken,
    };
  }

  factory UserModel.innit() {
    return UserModel(
      id: "",
      fullName: "",
      email: "",
      imageUrl: "",
      phoneNum: "",
      role: "",
      refreshToken: "",
    );
  }
}

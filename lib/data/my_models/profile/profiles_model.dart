class ProfileModel {
  final String network;
  final String username;
  final String url;

  ProfileModel({
    required this.network,
    required this.url,
    required this.username,
  });

  ProfileModel copyWith({
    String? network,
    String? username,
    String? url,
  }) {
    return ProfileModel(
      network: network ?? this.network,
      url: url ?? this.url,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toJson() {
    return {"network": network, "username": username, "url": url};
  }
}

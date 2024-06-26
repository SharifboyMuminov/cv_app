import 'package:cv_app/data/my_models/location/location_model.dart';
import 'package:cv_app/data/my_models/profile/profiles_model.dart';

class BasicsModel {
  final String name;
  final String label;
  final String image;
  final String email;
  final String phone;
  final String url;
  final String summary;
  final LocationModel location;
  final List<ProfileModel> profiles;

  BasicsModel({
    required this.name,
    required this.location,
    required this.url,
    required this.summary,
    required this.email,
    required this.phone,
    required this.image,
    required this.label,
    required this.profiles,
  });

  BasicsModel copyWith({
    String? name,
    String? label,
    String? image,
    String? email,
    String? phone,
    String? url,
    String? summary,
    LocationModel? location,
    List<ProfileModel>? profiles,
  }) {
    return BasicsModel(
      name: name ?? this.name,
      location: location ?? this.location,
      url: url ?? this.url,
      summary: summary ?? this.summary,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      label: label ?? this.label,
      profiles: profiles ?? this.profiles,
    );
  }

  factory BasicsModel.initial() {
    return BasicsModel(
      name: "",
      location: LocationModel.initial(),
      url: '',
      summary: "",
      email: "",
      phone: "",
      image: "",
      label: "",
      profiles: [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "label": label,
      "image": image,
      "email": email,
      "phone": phone,
      "location": location.toJson(),
      "url": url,
      "summary": summary,
      "profiles": profiles.map((toElement) => toElement.toJson()).toList(),
    };
  }
}

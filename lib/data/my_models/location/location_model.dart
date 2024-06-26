class LocationModel {
  final String city;
  final String countryCode;
  final String region;

  LocationModel(
      {required this.city, required this.countryCode, required this.region});

  LocationModel copyWith({
    String? city,
    String? countryCode,
    String? region,
  }) {
    return LocationModel(
      city: city ?? this.city,
      countryCode: countryCode ?? this.countryCode,
      region: region ?? this.region,
    );
  }

  Map<String, dynamic> toJson() {
    return {"city": city, "countryCode": countryCode, "region": region};
  }
}

class InterestModel {
  final String name;
  final List<String> keywords;

  InterestModel({required this.name, required this.keywords});

  InterestModel copyWith({
    String? name,
    List<String>? keywords,
  }) {
    return InterestModel(
      name: name ?? this.name,
      keywords: keywords ?? this.keywords,
    );
  }

  factory InterestModel.initial() {
    return InterestModel(
      name: "",
      keywords: [],
    );
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "keywords": keywords};
  }
}

class SkillModel {
  final String name;
  final String level;
  final List<String> keywords;

  SkillModel({
    required this.name,
    required this.keywords,
    required this.level,
  });

  SkillModel copyWith({
    String? name,
    String? level,
    List<String>? keywords,
  }) {
    return SkillModel(
      name: name ?? this.name,
      keywords: keywords ?? this.keywords,
      level: level ?? this.level,
    );
  }

  factory SkillModel.initial() {
    return SkillModel(name: "", keywords: [], level: "");
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "level": level, "keywords": keywords};
  }
}

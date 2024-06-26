class SoftSkillModel {
  final String name;

  SoftSkillModel({required this.name});

  SoftSkillModel copyWith({String? name}) {
    return SoftSkillModel(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {"name": name};
  }
}

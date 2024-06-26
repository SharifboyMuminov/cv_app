class SoftSkillModel {
  final String name;

  SoftSkillModel({required this.name});

  SoftSkillModel copyWith({String? name}) {
    return SoftSkillModel(
      name: name ?? this.name,
    );
  }

  factory SoftSkillModel.initial(){
    return SoftSkillModel(name: '');
  }

  Map<String, dynamic> toJson() {
    return {"name": name};
  }
}

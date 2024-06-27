class LanguageModel {
  final String langName;
  final double level;

  LanguageModel({required this.langName, required this.level});

  Map<String, dynamic> toJson() {
    return {'langName': langName, 'level': level};
  }

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
        langName: json['langName'] as String? ?? "",
        level: json['level'] as double? ?? 0.0);
  }
}

class LanguageModel {
  final String language;
  final String fluency;

  LanguageModel({required this.fluency, required this.language});

  LanguageModel copyWith() {
    return LanguageModel(
      fluency: fluency,
      language: language,
    );
  }

  Map<String, dynamic> toJson() {
    return {"language": language, "fluency": fluency};
  }
}

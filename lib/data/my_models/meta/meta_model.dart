class MetaModel {
  final String template;
  final String lang;

  MetaModel({required this.lang, required this.template});

  MetaModel copyWith({
    String? template,
    String? lang,
  }) {
    return MetaModel(
      lang: lang ?? this.lang,
      template: template ?? this.template,
    );
  }

  factory MetaModel.initial() {
    return MetaModel(lang: "en", template: "classic");
  }

  Map<String, dynamic> toJson() {
    return {"template": template, "lang": lang};
  }
}

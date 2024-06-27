class MetaModel {
  final String template;

  MetaModel({required this.template});



  factory MetaModel.initial() {
    return MetaModel(template: "");
  }

  Map<String, dynamic> toJson() {
    return {"template": template, "lang": "en"};
  }
}

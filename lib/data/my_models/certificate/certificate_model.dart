class CertificateModel {
  final String title;
  final String issuer;

  CertificateModel({required this.title, required this.issuer});

  CertificateModel copyWith({
    String? title,
    String? issuer,
  }) {
    return CertificateModel(
      title: title ?? this.title,
      issuer: issuer ?? this.issuer,
    );
  }

  factory CertificateModel.initial() {
    return CertificateModel(
      title: "",
      issuer: "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "date": null,
      "issuer": issuer,
      "score": "",
      "url": null
    };
  }
}

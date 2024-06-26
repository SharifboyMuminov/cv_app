class CertificatesModel {
  final String title;
  final String issuer;

  CertificatesModel({required this.title, required this.issuer});

  CertificatesModel copyWith({
    String? title,
    String? issuer,
  }) {
    return CertificatesModel(
      title: title ?? this.title,
      issuer: issuer ?? this.issuer,
    );
  }

  factory CertificatesModel.initial() {
    return CertificatesModel(
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

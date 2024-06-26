class WorkModel {
  final String position;
  final String company;
  final String startDate;
  final String summary;
  final String location;

  WorkModel({
    required this.position,
    required this.company,
    required this.location,
    required this.startDate,
    required this.summary,
  });

  WorkModel copyWith({
    String? position,
    String? company,
    String? startDate,
    String? summary,
    String? location,
  }) {
    return WorkModel(
      position: position ?? this.position,
      company: company ?? this.company,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      summary: summary ?? this.summary,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "position": position,
      "company": company,
      "startDate": startDate,
      "summary": summary,
      "location": location,
      "highlights": []
    };
  }
}

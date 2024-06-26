class EducationModel {
  final String institution;
  final String area;
  final String studyType;
  final String location;
  final String startDate;
  final String endDate;
  final String score;
  final List<String> courses;

  EducationModel({
    required this.startDate,
    required this.location,
    required this.score,
    required this.area,
    required this.courses,
    required this.endDate,
    required this.institution,
    required this.studyType,
  });

  EducationModel copyWith({
    String? institution,
    String? area,
    String? studyType,
    String? location,
    String? startDate,
    String? endDate,
    String? score,
    List<String>? courses,
  }) {
    return EducationModel(
      startDate: startDate ?? this.startDate,
      location: location ?? this.location,
      score: score ?? this.score,
      area: area ?? this.area,
      courses: courses ?? this.courses,
      endDate: endDate ?? this.endDate,
      institution: institution ?? this.institution,
      studyType: studyType ?? this.studyType,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "institution": institution,
      "area": area,
      "studyType": studyType,
      "location": location,
      "startDate": startDate,
      "endDate": endDate,
      "score": score,
      "courses": courses
    };
  }
}

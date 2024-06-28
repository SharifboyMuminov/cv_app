class ResumeModel {
  final String id;
  final String userID;
  final String filename;
  final String jobTitle;
  final String city;
  final int salary;
  final String jobLocation;

  ResumeModel({
    required this.id,
    required this.userID,
    required this.filename,
    required this.jobTitle,
    required this.city,
    required this.salary,
    required this.jobLocation,
  });

  factory ResumeModel.fromJson(Map<String, dynamic> json) {
    return ResumeModel(
      id: json['id'] as String? ?? "",
      userID: json['userID'] as String? ?? "",
      filename: json['filename'] as String? ?? "",
      jobTitle: json['job_title'] as String? ?? "",
      city: json['city'] as String? ?? "",
      salary: json['salary'] as int? ?? 0,
      jobLocation: json['job_location'] as String? ?? "",
    );
  }
}

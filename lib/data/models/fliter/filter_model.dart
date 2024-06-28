class FilterModel {
  final String jobTitle;
  final String jobLocation;
  final int salaryStart;
  final int salaryEnd;

  FilterModel({
    required this.jobLocation,
    required this.jobTitle,
    required this.salaryEnd,
    required this.salaryStart,
  });
}

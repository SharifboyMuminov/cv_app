class ProjectModel {
  final String name;
  final String description;
  final String url;

  ProjectModel({
    required this.url,
    required this.name,
    required this.description,
  });

  ProjectModel copyWith({
    String? name,
    String? description,
    String? url,
  }) {
    return ProjectModel(
      url: url ?? this.url,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "description": description, "url": url};
  }
}

class Project {
  String? title;
  String? description;

  Project({
    this.title,
    this.description,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        title: json["title"],
        description: json["description"],
      );
}

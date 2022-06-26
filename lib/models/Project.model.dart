class Project {
  String? title;
  String? description;
  String? link;

  Project({this.title, this.description, this.link});

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        title: json["title"],
        description: json["description"],
        link: json["link"],
      );
}

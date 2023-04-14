class Link {
  final Uri uri;
  Link(String url) : uri = Uri.parse(url);

  // from json 
  Link.fromJson(Map<String, dynamic> json) : uri = Uri.parse(json['url']);
}

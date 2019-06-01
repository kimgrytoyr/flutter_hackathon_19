// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';

Project projectFromJson(String str) => Project.fromJson(json.decode(str));

String projectToJson(Project data) => json.encode(data.toJson());

class Project {
  int id;
  String name;
  String description;
  String icon;
  Developer developer;
  List<Link> links;
  List<Screenshot> screenshots;

  Project({
    this.id,
    this.name,
    this.description,
    this.icon,
    this.developer,
    this.links,
    this.screenshots,
  });

  factory Project.fromJson(Map<String, dynamic> json) => new Project(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        icon: json["icon"],
        developer: Developer.fromJson(json["developer"]),
        links: new List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        screenshots: new List<Screenshot>.from(
            json["screenshots"].map((x) => Screenshot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "icon": icon,
        "developer": developer.toJson(),
        "links": new List<dynamic>.from(links.map((x) => x.toJson())),
        "screenshots":
            new List<dynamic>.from(screenshots.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return "Name: ${this.name}";
  }
}

class Developer {
  String name;
  String image;

  Developer({
    this.name,
    this.image,
  });

  factory Developer.fromJson(Map<String, dynamic> json) => new Developer(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}

class Link {
  String title;
  String url;
  String type;

  Link({
    this.title,
    this.url,
    this.type,
  });

  factory Link.fromJson(Map<String, dynamic> json) => new Link(
        title: json["title"],
        url: json["url"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "type": type,
      };
}

class Screenshot {
  String image;
  String description;

  Screenshot({
    this.image,
    this.description,
  });

  factory Screenshot.fromJson(Map<String, dynamic> json) => new Screenshot(
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "description": description,
      };
}

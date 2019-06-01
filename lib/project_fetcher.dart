import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'models/project.dart';

class ProjectFetcher {
  static List<Project> parseProjects(List projects) {
    List<Project> _newList;

    try {
      _newList =
          projects.map<Project>((json) => Project.fromJson(json)).toList();
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
    }

    return _newList;
  }

  static Future<List<Project>> fetchProjects() async {
    var uri = Uri.parse(
        "https://raw.githubusercontent.com/kimgrytoyr/flutter_hackathon_19/master/docs/template.json");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return parseProjects(data);
    } else {
      return List<Project>();
    }
  }
}

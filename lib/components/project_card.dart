import 'package:flutter/material.dart';
import 'package:flutter_hackathon_19/models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard(this.project);

  @override
  Widget build(BuildContext context) {
    // return Container(child: Text(project.name));
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/details', arguments: project);
      },
      child: Card(
        child: Text(project.name),
      ),
    );
  }
}

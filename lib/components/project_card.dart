import 'package:flutter/material.dart';
import 'package:flutter_hackathon_19/models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard(this.project);

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 17, left: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.name,
            style: Theme.of(context).textTheme.headline,
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0, bottom: 16.0),
            child: Text(project.developer.name,
                style: Theme.of(context).textTheme.subhead),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/details',
          arguments: project,
        );
      },
      child: Card(
        elevation: 2,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  _buildHeader(context),
                ],
              ),
              Expanded(
                child: Hero(
                  tag: '0_${project.screenshots[0].image}',
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: FractionalOffset.topCenter,
                        image: NetworkImage(project.screenshots[0].image),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.0, 0.35],
                          colors: [
                            Colors.black.withAlpha(40),
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

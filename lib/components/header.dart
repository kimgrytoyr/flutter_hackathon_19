import 'package:flutter/material.dart';
import 'package:flutter_hackathon_19/models/project.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: 'icon_${project.id}',
            child: Image.network(
              project.icon,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Hero(
                    tag: 'name_${project.id}',
                    child: Text(
                      project.name,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ),
                ),
                Expanded(
                  child: Hero(
                    tag: 'developer_${project.id}',
                    child: Text(
                      project.developer.name,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

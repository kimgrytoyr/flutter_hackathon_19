import 'package:flutter/material.dart';
import 'package:flutter_hackathon_19/components/header.dart';
import 'package:flutter_hackathon_19/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key, this.project}) : super(key: key);
  final Project project;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final Project project = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        children: <Widget>[
          Header(project: project),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            height: 350.0,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: _getScreenshots(project),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(project.description),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Text("Download links",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _getLinks(project),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getScreenshots(project) {
    var index = 0;
    List<Widget> screenshots = project.screenshots.map<Widget>((s) {
      return Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onTap: () => _launchURL(s.image),
            child: Hero(
              tag: '${index++}_${s.image}',
              child: Image.network(s.image),
            ),
          ));
    }).toList();

    return screenshots;
  }

  List<Widget> _getLinks(project) {
    List<Widget> links = project.links.map<Widget>((l) {
      return Container(
        padding: EdgeInsets.only(bottom: 10.0),
        width: 150.0,
        child: GestureDetector(
          onTap: () {
            _launchURL(l.url);
          },
          child: Image.asset('assets/images/${l.type}.png'),
        ),
      );
    }).toList();

    return links;
  }
}

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

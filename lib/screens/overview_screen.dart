import 'package:flutter/material.dart';
import 'package:flutter_hackathon_19/components/project_card.dart';
import 'package:flutter_hackathon_19/models/project.dart';

import '../project_fetcher.dart';

class OverviewPage extends StatefulWidget {
  OverviewPage({Key key, this.title, this.projectId, this.icon})
      : super(key: key);
  final String title;
  final String projectId;
  final String icon;
  final List<dynamic> screenshots = [{}];

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  Future<List<Project>> _projectsFuture;

  @override
  void initState() {
    super.initState();

    _projectsFuture = ProjectFetcher.fetchProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: FutureBuilder<List<Project>>(
        future: _projectsFuture,
        builder: (BuildContext context, AsyncSnapshot<List<Project>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data == null || snapshot.data.length == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ProjectCard(snapshot.data[0]),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              heroTag: 'hero-left',
              child: Icon(Icons.star_border),
              onPressed: () {},
            ),
            FloatingActionButton(
              heroTag: 'hero-middle',
              child: Icon(Icons.open_in_browser),
              onPressed: () {},
            ),
            FloatingActionButton(
              heroTag: 'hero-right',
              child: Icon(Icons.arrow_forward),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

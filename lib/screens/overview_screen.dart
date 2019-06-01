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
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<Project>>(
                future: _projectsFuture,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Project>> snapshot) {
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

                  return ProjectCard(snapshot.data[0]);
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/details',
            arguments: Project(name: "Project Name"),
          );
          ProjectFetcher.fetchProjects();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

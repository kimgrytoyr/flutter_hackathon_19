import 'package:flutter/material.dart';
import 'package:flutter_hackathon_19/components/project_card.dart';
import 'package:flutter_hackathon_19/models/project.dart';

import '../project_fetcher.dart';

class OverviewPage extends StatefulWidget {
  OverviewPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  Future<List<Project>> _projectsFuture;
  int currentIndex;

  @override
  void initState() {
    super.initState();

    currentIndex = 0;
    _projectsFuture = ProjectFetcher.fetchProjects();
  }

  Widget _buildBody(dynamic data) {
    var index = currentIndex;

    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ProjectCard(data[index]),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: 'hero-left',
                  child: Icon(Icons.arrow_back),
                  onPressed: currentIndex == 0
                      ? null
                      : () {
                          if (index > 0) {
                            setState(() {
                              currentIndex--;
                            });
                          }
                        },
                ),
                FloatingActionButton(
                  heroTag: 'hero-right',
                  child: Icon(Icons.arrow_forward),
                  onPressed: index == data.length - 1
                      ? null
                      : () {
                          if (index < data.length - 1) {
                            setState(() {
                              currentIndex++;
                            });
                          }
                        },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
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

          return _buildBody(snapshot.data);
        },
      ),
    );
  }
}

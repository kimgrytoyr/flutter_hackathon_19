import 'package:flutter/material.dart';
import 'package:flutter_hackathon_19/screens/details_screen.dart';
import 'package:flutter_hackathon_19/screens/overview_screen.dart';

import 'models/project.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flinder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => OverviewPage(title: 'Flinder'),
        '/details': (context) => DetailsPage(),
      },
    );
  }
}

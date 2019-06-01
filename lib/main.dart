import 'package:flutter/material.dart';
import 'package:flutter_hackathon_19/screens/details_screen.dart';
import 'package:flutter_hackathon_19/screens/overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutteriffic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            headline: TextStyle(
              inherit: true,
              fontWeight: FontWeight.bold,
            ),
            subhead: TextStyle(inherit: true)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => OverviewPage(title: 'Flutteriffic'),
        '/details': (context) => DetailsPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'compassApp.dart';

void main() => runApp(Compass());

class Compass extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MaterialApp(
      darkTheme: ThemeData.dark(),

      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Compass'),
          centerTitle: true,
        ),
        body: CompassApp(),
        backgroundColor: Colors.black38,
      )
  );
}



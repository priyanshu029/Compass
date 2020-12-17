import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'compassPainter.dart';

class CompassApp extends StatefulWidget {

  CompassApp({Key key}) : super(key: key);

  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<CompassApp> {

  double _heading = 0;

  String get _readout => _heading.toStringAsFixed(0)+ '°';

  @override
  void initState() {

    super.initState();
    FlutterCompass.events.listen(_onData);
  }

  void _onData(double x) => setState(() { _heading = x; });

  final TextStyle _style = TextStyle(
    color: Colors.lightBlue,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {

    return CustomPaint(
        foregroundPainter: CompassPainter(angle: _heading),
        child: Center(child: Text(_readout, style: _style))
    );
  }
}
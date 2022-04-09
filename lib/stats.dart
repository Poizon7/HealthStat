import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:health_stat/weekly_hours.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StatPage(title: 'Statistics'),
    );
  }
}

class StatPage extends StatefulWidget {
  const StatPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StatPage> createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(children: [
              const Text(
                "Gym Stats",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              hoursTrained(context)
            ]),
          ),
          hoursTrained(context)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'about.dart';
import 'gratitude.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _howAreYou = "...";

  void _openPageGratitude(
      {required BuildContext context, bool fullscreenDialog = false}) async {
    final String _gratitudeResponse = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => Gratitude(
          radioGroupValue: -1,
          key: UniqueKey(),
        ),
      ),
    );
    _howAreYou = _gratitudeResponse ?? '';
  }

  void _openPageAbout(
      {required BuildContext context, bool fullscreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => About(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => _openPageAbout(
              context: context,
              fullscreenDialog: true,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Grateful for: $_howAreYou',
            style: TextStyle(fontSize: 32.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openPageGratitude(context: context),
        tooltip: 'About',
        child: Icon(Icons.sentiment_satisfied),
      ),
    );
  }
}

class GratitudePage extends StatelessWidget {
  final String selectedValue;

  GratitudePage({required Key key, required this.selectedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
                value: 'Option A',
                groupValue: selectedValue,
                onChanged: (value) => Navigator.pop(context, value)),
            Radio(
                value: 'Option B',
                groupValue: selectedValue,
                onChanged: (value) => Navigator.pop(context, value)),
            Radio(
                value: 'Option C',
                groupValue: selectedValue,
                onChanged: (value) => Navigator.pop(context, value)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:microphone/recorder.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Microphone Recorder',
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

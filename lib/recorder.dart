import 'package:flutter/material.dart';
import 'package:microphone/soundRecoder.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
final recorder = SoundRecorder();
class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    recorder.init();
  }


  @override
  void dispose() {
    recorder.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Audio Recorder"),),
      body: Center(
        child: buildStart(),
      ),
    );
  }

  Widget buildStart() {
    final isRecording = recorder.isRecording;
    final icon = isRecording ? Icons.stop : Icons.mic;
    final text = isRecording ? "Stop" : "Start";
    final primary = isRecording ? Colors.red : Colors.white;
    final onPrimary = isRecording ? Colors.white : Colors.black;

    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: primary,
          onPrimary: onPrimary,
        ),
        onPressed: () async {
          final isRecording = await recorder.toggleRecord();
          //isRecording = isRecordingN;
          setState(() {});
        },
        icon: Icon(icon),
        label: Text(text));
  }
}

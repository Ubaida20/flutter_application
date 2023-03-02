import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
import 'package:microphone/soundRecoder.dart';
import 'package:permission_handler/permission_handler.dart';


  final pathToSaveAudio = "audio_example.mp3";
class SoundRecorder{
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecorderInitialized = false;
  bool get isRecording => _audioRecorder!.isRecording;


  Future init() async{
    _audioRecorder = FlutterSoundRecorder();

    final status = await Permission.microphone.request();
    if(status!= PermissionStatus.granted){
      throw RecordingPermissionException("Microphone Permission not Granted");
    }
    await _audioRecorder!.openAudioSession();
    _isRecorderInitialized = true;
  }


  void dispose()
  {
    if(!_isRecorderInitialized) return;
    _audioRecorder!.closeAudioSession();
    _audioRecorder=null;
    _isRecorderInitialized = false;
  }

  Future _record() async{
    if(!_isRecorderInitialized) return;
    await _audioRecorder!.startRecorder(toFile: pathToSaveAudio);
  }


  Future _stop() async{
    if(!_isRecorderInitialized) return;
    await _audioRecorder!.stopRecorder();
  }


  Future toggleRecord() async{
    if(_audioRecorder!.isStopped){
      await _record();
    }else{
      await _stop();
    }
  }
}
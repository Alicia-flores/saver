import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_sound/flutter_sound.dart';

class GrabacionDeAudioPage extends StatefulWidget {
  @override
  _GrabacionDeAudioPageState createState() => _GrabacionDeAudioPageState();
}

class _GrabacionDeAudioPageState extends State<GrabacionDeAudioPage> {
  late FlutterSoundPlayer _audioPlayer;
  AudioRecorder _audioRecorder = AudioRecorder();
  late String _filePath = '';
  bool _isRecording = false;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = FlutterSoundPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grabación de Audio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _isRecording
                ? Text('Grabando...')
                : IconButton(
                    icon: Icon(Icons.mic),
                    iconSize: 48.0,
                    onPressed: () {
                      _isRecording
                          ? stopRecording()
                          : startRecording();
                    },
                  ),
            SizedBox(height: 20),
            _filePath.isNotEmpty
                ? Column(
                    children: [
                      Text('Reproducir Grabación'),
                      IconButton(
                        icon: Icon(
                          _isPlaying ? Icons.stop : Icons.play_arrow,
                        ),
                        iconSize: 48.0,
                        onPressed: () {
                          _isPlaying
                              ? stopPlaying()
                              : playRecording();
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          deleteRecording();
                        },
                        child: Text('Borrar Audio'),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                sendRecording();
              },
              child: Text('Enviar Audio'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> startRecording() async {
    try {
      String path = await _audioRecorder.startRecorder();
      setState(() {
        _filePath = path;
        _isRecording = true;
      });
    } catch (e) {
      print("Error al iniciar la grabación: $e");
    }
  }

  Future<void> stopRecording() async {
    try {
      await _audioRecorder.stopRecorder();
      setState(() {
        _isRecording = false;
      });
    } catch (e) {
      print("Error al detener la grabación: $e");
    }
  }

  Future<void> playRecording() async {
    try {
      if (_filePath.isNotEmpty) {
        await _audioPlayer.startPlayer(
          fromURI: _filePath,
          codec: Codec.pcm16WAV,
        );
        setState(() {
          _isPlaying = true;
        });
      } else {
        print("Error: _filePath está vacío");
      }
    } catch (e) {
      print("Error al reproducir la grabación: $e");
    }
  }

  Future<void> stopPlaying() async {
    try {
      await _audioPlayer.stopPlayer();
      setState(() {
        _isPlaying = false;
      });
    } catch (e) {
      print("Error al detener la reproducción: $e");
    }
  }

  void sendRecording() async {
    try {
      if (_filePath.isNotEmpty) {
       
        print('Enviando archivo: $_filePath');


            } else {
        print('Error: No hay archivo para enviar.');
      }
    } catch (e) {
      print('Error al enviar el archivo: $e');
      
    }
  }

  void deleteRecording() {
    setState(() {
      _filePath = '';
      _isPlaying = false;
    });
  }
}

class AudioRecorder {
  FlutterSoundRecorder _audioRecorder;

  AudioRecorder() : _audioRecorder = FlutterSoundRecorder();

  String _filePath = '';
  bool _isRecording = false;

  Future<String> startRecorder() async {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    _filePath = appDirectory.path + '/audio_recording.wav';

    await _audioRecorder.startRecorder(
      toFile: _filePath,
      codec: Codec.pcm16WAV,
    );

    _isRecording = true;

    return _filePath;
  }

  Future<void> stopRecorder() async {
    if (_isRecording) {
      await _audioRecorder.stopRecorder();
      _isRecording = false;
    }
  }
}

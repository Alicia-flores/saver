import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:video_player/video_player.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  MyApp({required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GrabarVideosPage(camera: camera),
    );
  }
}

class GrabarVideosPage extends StatefulWidget {
  final CameraDescription camera;

  GrabarVideosPage({required this.camera});

  @override
  _GrabarVideosPageState createState() => _GrabarVideosPageState();
}

class _GrabarVideosPageState extends State<GrabarVideosPage> {
  late File _video;
  late VideoPlayerController _videoPlayerController;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _video = File('');
    _videoPlayerController = VideoPlayerController.asset('assets/placeholder_video.mp4');
  }

  Future<void> _pickVideo(ImageSource source) async {
    final pickedFile = await picker.pickVideo(source: source);

    if (pickedFile != null) {
      setState(() {
        _video = File(pickedFile.path);
        _videoPlayerController = VideoPlayerController.file(_video)
          ..initialize().then((_) {
            _videoPlayerController.play();
          });
      });
    } else {
      print('No video selected.');
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video')),
      body: Center(
        child: _video.path.isEmpty
            ? Text('No video selected.')
            : AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => _pickVideo(ImageSource.camera),
            child: Icon(Icons.videocam),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => _pickVideo(ImageSource.gallery),
            child: Icon(Icons.video_library),
          ),
        ],
      ),
    );
  }
}

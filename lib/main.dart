import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CameraController? controller;
  final AudioRecorder recorder = AudioRecorder();

  @override
  void initState() {
    super.initState();
    setup();
  }

  Future<void> setup() async {
    await Permission.camera.request();
    await Permission.microphone.request();

    controller = CameraController(
      cameras.first,
      ResolutionPreset.medium,
    );

    await controller!.initialize();

    setState(() {});
  }

  Future<void> takePhoto() async {
    if (controller == null || !controller!.value.isInitialized) return;

    final file = await controller!.takePicture();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Saved: ${file.path}")),
    );
  }

  Future<void> startRecording() async {
    if (await recorder.hasPermission()) {
      await recorder.start();
    }
  }

  Future<void> stopRecording() async {
    final path = await recorder.stop();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Audio: $path")),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    recorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Demo"),
      ),
      body: Column(
        children: [
          Expanded(
            child: CameraPreview(controller!),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: takePhoto,
                child: const Text("Photo"),
              ),
              ElevatedButton(
                onPressed: startRecording,
                child: const Text("Record"),
              ),
              ElevatedButton(
                onPressed: stopRecording,
                child: const Text("Stop"),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

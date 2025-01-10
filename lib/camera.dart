import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraButton extends StatefulWidget {
  const CameraButton({super.key});

  @override
  State<CameraButton> createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  final ImagePicker _picker = ImagePicker();
  File? _capturedImage;

  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _capturedImage = File(image.path);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Photo saved at: ${image.path}")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No photo captured")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "camera",
        onPressed: _openCamera,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),
      body: Center(
        child: _capturedImage != null
            ? Image.file(_capturedImage!)
            : const Text(
                "No image captured",
                style: TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}

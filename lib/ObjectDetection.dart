import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:bio2/paints/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'custom widgets/customText.dart';
import 'custom widgets/default_button.dart';

class ObjectDetection extends StatefulWidget {
  ObjectDetection({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ObjectDetectionState createState() => _ObjectDetectionState();
}

class _ObjectDetectionState extends State<ObjectDetection> {
  File? _image;
  Uint8List? _imageData;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future sendImage() async {
    if (_image == null) {
      print('No image selected.');
      return;
    }

    // Replace this URL with the API endpoint that expects an image file
    final url = Uri.parse('http://192.168.1.8:8000/detectAD');

    try {
      final request = http.MultipartRequest('POST', url);
      request.files
          .add(await http.MultipartFile.fromPath('image', _image!.path));
      final response = await request.send();

      if (response.statusCode == 200) {
        final bytes = await response.stream.toBytes();
        setState(() {
          _imageData = bytes;
        });
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          // toolbarHeight: 90,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: CustomText(
            "Dectection",
            textColor: AppColor.balck2,
            fontSize: 20,
            fontweight: FontWeight.w500,
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_imageData != null)
                Image.memory(
                  _imageData!,
                  height: 200,
                ),
              if (_image != null)
                Image.file(
                  _image!,
                  height: 200,
                ),
              const SizedBox(height: 16),
              DefaultMaterialButton(
                onPressed: () {
                  getImage();
                },
                text: "Upload Image",
                textColor: AppColor.white,
                fontSize: 16,
                radius: 1000,
                background: AppColor.forthFont,
              ),
              const SizedBox(height: 16),
              DefaultMaterialButton(
                onPressed: () {
                  sendImage();
                },
                text: "Get Result",
                textColor: AppColor.white,
                fontSize: 16,
                radius: 1000,
                background: AppColor.successColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../provider/connect.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String base64Image = '';
  String imagePath = "";
  String fileName = "";
  final picker = ImagePicker();

  String uploadEndPoint = con + 'testFormData';

  void upload() {
    http.post(Uri.parse(uploadEndPoint), body: {
      "testdot": base64Image,
      "name": fileName,
    }).then((result) {
      //setStatus(result.statusCode == 200 ? result.body : errMessage);
    }).catchError((error) {
      // setStatus(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker & Image Cropper"),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue.shade700),
                ),
                onPressed: () async {
                  final pickedFile =
                      await picker.getImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    File? croppedFile = await ImageCropper.cropImage(
                      sourcePath: pickedFile.path,
                      aspectRatioPresets: [
                        CropAspectRatioPreset.square,
                        CropAspectRatioPreset.ratio3x2,
                        CropAspectRatioPreset.original,
                        CropAspectRatioPreset.ratio4x3,
                        CropAspectRatioPreset.ratio16x9
                      ],
                      androidUiSettings: AndroidUiSettings(
                        toolbarTitle: 'BK TECH Image Crop',
                        toolbarColor: Colors.blue[700],
                        toolbarWidgetColor: Colors.white,
                        activeControlsWidgetColor: Colors.blue[900],
                        initAspectRatio: CropAspectRatioPreset.original,
                        lockAspectRatio: false,
                      ),
                      iosUiSettings: IOSUiSettings(
                        minimumAspectRatio: 1.0,
                      ),
                    );
                    if (croppedFile != null) {
                      setState(() {
                        imagePath = croppedFile.path;
                        base64Image =
                            base64Encode(croppedFile.readAsBytesSync());
                        String fileName = croppedFile.path.split('/').last;
                        print(fileName);
                      });
                    }
                  }
                },
                child: Text("Select Image"),
              ),
            ),
            imagePath != ""
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Image.file(File(imagePath)),
                  )
                : Container(
                    child: Text("No image selected"),
                  ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue.shade700),
              ),
              onPressed: () {
                // ignore: unnecessary_statements
                upload;
              },
              child: Text("Upload Product Image"),
            ),
          ],
        ),
      ),
    );
  }
}

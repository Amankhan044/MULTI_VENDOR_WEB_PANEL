import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImagePickerProvider with ChangeNotifier {
  dynamic _image;
  dynamic get image => _image;

  dynamic pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    if (result != null) {
      _image = result.files.first.bytes;
      notifyListeners();
    }
  }
}

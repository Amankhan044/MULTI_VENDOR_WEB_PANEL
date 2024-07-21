import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ImagePickerProvider with ChangeNotifier {
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  dynamic _image;
  dynamic get image => _image;

  String? _fileName;
  String? get fileName => _fileName;

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    if (result != null) {
      _image = result.files.first.bytes;
      _fileName = result.files.first.name;
      notifyListeners();
    }
  }

  Future<String?> _uploadBannerToStorage(dynamic image) async {
    Reference ref = _firebaseStorage.ref().child('Banners').child(_fileName!);

    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapShot = await uploadTask;
    String downLoadUrl = await snapShot.ref.getDownloadURL();
    return downLoadUrl;
  }

  Future<void> uploadToFirestore() async {
    EasyLoading.show(status: 'loading...');
    if (_image != null) {
      String? imageUrl = await _uploadBannerToStorage(_image!);
      await _firebaseFirestore.collection('banners').doc(_fileName).set({
        'image': imageUrl,
      }).whenComplete(() {
        EasyLoading.dismiss();
        _image = null;
        notifyListeners();
      });
    }
  }
}

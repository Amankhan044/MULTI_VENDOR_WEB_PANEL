import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CategoryImagePickerProvider with ChangeNotifier {
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  dynamic _image;
  dynamic get image => _image;

  String? _fileName;
  String? get fileName => _fileName;

  String? _categoryName;
  String? get categoryName => _categoryName;
  set categoryName(String? value) {
    _categoryName = value;
    notifyListeners();
  }

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

  Future<String?> uploadCategoryBannerToStorage(dynamic image) async {
    try {
      Reference ref =
          _firebaseStorage.ref().child('CategoryImages').child(_fileName!);
      UploadTask uploadTask = ref.putData(image);
      TaskSnapshot snapShot = await uploadTask;
      String downloadUrl = await snapShot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  Future<void> uploadCategory() async {
    if (_formKey.currentState!.validate()) {
      if (_image != null) {
        EasyLoading.show(status: 'Uploading...');
        String? imageUrl = await uploadCategoryBannerToStorage(_image);
        await _firebaseFirestore.collection('categories').doc(_fileName).set({
          'image': imageUrl,
          'CategoryName': categoryName,
        }).whenComplete(() {
          EasyLoading.dismiss();
          _image = null;
          _formKey.currentState!.reset();
          notifyListeners();
        });
      } else {
        print("No image selected");
      }
    } else {
      print("Form validation failed");
    }
  }
}

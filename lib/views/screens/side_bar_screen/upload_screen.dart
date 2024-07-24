import 'package:flutter/material.dart';
import 'package:multi_vendor_web_panel/model/upload_imagepicker_provider.dart';
import 'package:multi_vendor_web_panel/views/screens/side_bar_screen/widget/banners_widget.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatelessWidget {
  UploadScreen({super.key});

  static const String routeName = '\Upload';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Upload Banners',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Consumer<ImagePickerProvider>(
                  builder: (BuildContext context, ImagePickerProvider value,
                      Widget? child) {
                    return Column(
                      children: [
                        Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              border: Border.all(color: Colors.grey.shade800),
                              borderRadius: BorderRadius.circular(14)),
                          child: value.image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.memory(
                                    value.image,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Center(
                                  child: Text('Upload Image'),
                                ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Consumer<ImagePickerProvider>(
                          builder:
                              (BuildContext context, value, Widget? child) {
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.yellow.shade900),
                                onPressed: () {
                                  value.pickImage();
                                },
                                child: Text(
                                  'Upload Image',
                                  style: TextStyle(color: Colors.white),
                                ));
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Consumer<ImagePickerProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.yellow.shade900),
                      onPressed: () {
                        value.uploadToFirestore();
                      },
                      child: Text(
                        'save',
                        style: TextStyle(color: Colors.white),
                      ));
                },
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Banners",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          BannersWidget()
        ],
      ),
    );
  }
}

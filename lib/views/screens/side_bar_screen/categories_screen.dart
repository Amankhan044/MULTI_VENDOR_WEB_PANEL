import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multi_vendor_web_panel/views/screens/side_bar_screen/widget/category_widget.dart';
import 'package:provider/provider.dart';
import 'package:multi_vendor_web_panel/model/category_imagepicker.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const String routeName = '\Categories';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<CategoryImagePickerProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return Form(
            key: value.formKey,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Category',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
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
                                : const Center(
                                    child: Text('Category'),
                                  ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.yellow.shade900),
                              onPressed: () {
                                value.pickImage();
                              },
                              child: const Text(
                                'Upload Image',
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 180,
                        child: TextFormField(
                          onChanged: (v) {
                            value.categoryName = v;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please category must not be empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Enter Category Name"),
                              hintText: 'Enter Category Name'),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.yellow.shade900),
                        onPressed: () {
                          value.uploadCategory();
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                  CategortWidget() 
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class VendorScreen extends StatelessWidget {
  const VendorScreen({super.key});
  static const String routeName = '\Vendors';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Manage vendors',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
      );
  }
}
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multi_vendor_web_panel/model/category_imagepicker.dart';
import 'package:multi_vendor_web_panel/model/upload_imagepicker_provider.dart';
import 'package:multi_vendor_web_panel/views/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAtT2MZ-pmzXpC7n4EtlFfFqHN2TopSX_E",
          projectId: "my-store-79012",
          storageBucket: "my-store-79012.appspot.com",
          messagingSenderId: "830327029793",
          appId: "1:830327029793:web:7b0edb290e00c34ff7e360"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImagePickerProvider()),
        ChangeNotifierProvider(create: (_) => CategoryImagePickerProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}

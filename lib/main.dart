import 'package:flutter/material.dart';
import 'flie_upload_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      home: FileUploadScreen(),
    );
  }
}

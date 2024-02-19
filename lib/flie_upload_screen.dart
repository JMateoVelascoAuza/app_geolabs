import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class FileUploadScreen extends StatelessWidget {
  Future<void> _uploadFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = result.files.first;

      final request = http.MultipartRequest(
        'POST',
        Uri.parse('https://tu-servidor.com/upload'),
      );

      request.files.add(http.MultipartFile.fromBytes(
        'file',
        file.bytes!,
        filename: file.name,
      ));

      final response = await request.send();

      if (response.statusCode == 200) {
        print('Archivo subido exitosamente');
      } else {
        print('Error al subir el archivo');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subir Archivos'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _uploadFile,
          child: Text('Seleccionar Archivo'),
        ),
      ),
    );
  }
}

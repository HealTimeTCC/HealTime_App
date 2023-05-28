import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LogicDrawer {
  static Future<void> addImageProfile(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    print('Entrou aqui');
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);

  }
}
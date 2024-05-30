import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../localization/app_localization.dart';

class PhotoUploadScreen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // İşlem yapılacak.
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _pickImage,
        child: Text(AppLocalizations.of(context).getTranslate("upload_photo")),
      ),
    );
  }
}

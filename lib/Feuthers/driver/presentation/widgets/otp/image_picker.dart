import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  final void Function(List<XFile>) onImagesPicked;

  const ImagePickerWidget({super.key, required this.onImagesPicked});

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> pickedImages = await picker.pickMultiImage();
    onImagesPicked(pickedImages);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _pickImages,
          child: const Text('Pick Images'),
        ),
      ],
    );
  }
}

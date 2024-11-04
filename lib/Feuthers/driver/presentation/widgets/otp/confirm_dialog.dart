import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/otp/image_picker.dart';

import 'otp_input.dart';

class ConfirmationDialog extends StatelessWidget {
  final List<TextEditingController> otpControllers;
  final void Function(List<XFile>) onImagesPicked;
  final VoidCallback onSubmit;

  const ConfirmationDialog(
      {super.key,
      required this.otpControllers,
      required this.onImagesPicked,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Delivery'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OTPInput(otpControllers: otpControllers),
          const SizedBox(height: 10),
          ImagePickerWidget(onImagesPicked: onImagesPicked),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')),
        ElevatedButton(onPressed: onSubmit, child: const Text('Submit')),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class OTPInput extends StatelessWidget {
  final List<TextEditingController> otpControllers;

  const OTPInput({super.key, required this.otpControllers});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Container(
          width: 40,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: TextField(
            controller: otpControllers[index],
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(counterText: ''),
            textAlign: TextAlign.center,
          ),
        );
      }),
    );
  }
}

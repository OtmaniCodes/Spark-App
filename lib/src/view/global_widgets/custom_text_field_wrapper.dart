import 'package:flutter/material.dart';

class MyTextFieldWrapper extends StatelessWidget {
  final Widget kiddo;
  final double? givenHeight;
  const MyTextFieldWrapper({Key? key, required this.kiddo, this.givenHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.givenHeight ?? 52,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Color(0x45d1d1d6),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: this.kiddo
    );
  }
}

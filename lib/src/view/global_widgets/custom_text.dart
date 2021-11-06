import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String txt;
  final Color? txtClr;
  final double? fSize;
  final double? txtHeight;
  final TextAlign? alignment;
  final FontWeight? boldness;
  final double? charSpacing;

  const MyText({
    Key? key,
    required this.txt,
    this.txtHeight,
    this.fSize,
    this.txtClr,
    this.alignment,
    this.boldness,
    this.charSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.txt,
      textAlign: alignment,
      style: defaulTS.copyWith(
        fontWeight: this.boldness,
        color: this.txtClr ?? Palette.kWhiteClr,
        height: this.txtHeight,
        fontSize: this.fSize ?? 18,
        letterSpacing: this.charSpacing ?? 0,
      ),
    );
  }
}

import 'package:anas_cars/src/utils/palette.dart';
import 'package:flutter/material.dart';

class MyCustomContainer extends StatelessWidget {
  final Widget kiddo;
  final EdgeInsetsGeometry? givenPadd;
  final EdgeInsetsGeometry? givenMarg;
  final Border? giveBorder;
  const MyCustomContainer({
    Key? key,
    required this.kiddo,
    this.givenPadd,
    this.givenMarg,
    this.giveBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: this.givenPadd ?? EdgeInsets.all(8.0),
        margin: this.givenMarg,
        
        decoration: BoxDecoration(
          border: this.giveBorder,
          borderRadius: BorderRadius.circular(15.0),
          color: Palette.kWhiteClr,
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: this.kiddo);
  }
}

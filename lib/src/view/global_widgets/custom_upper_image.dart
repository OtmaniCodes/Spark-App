import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:flutter/material.dart';

class MyUpperImage extends StatelessWidget {
  final String img;
  final String titleTxt;
  const MyUpperImage({Key? key, required this.img, required this.titleTxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(this.img),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Palette.kTransPurpleClr,
          ),
          alignment: Alignment(-0.80, -0.75),
          child: Text(
            this.titleTxt.toUpperCase(),
            style: TextStyle(
                fontSize: 28,
                color: Palette.kWhiteClr,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

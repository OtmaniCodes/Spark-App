import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text.dart';

class MyPlaceHolder extends StatelessWidget {
  final String text;
  const MyPlaceHolder({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 85),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(KNoHistoryIco),
          MEDIUM_VSPACING,
          MyText(
            txt: text,
            fSize: 16,
            txtClr: const Color(0xba514d4d),
            alignment: TextAlign.center,
          ),
          MEDIUM_VSPACING,
          MyCustomButton(
            kiddo: MyText(txt: "Order now"),
            onPressed: () => Navigator.pushNamed(context, "/orderPricing"),
            gradientColors: [Palette.kLightOrangeClr, Palette.kDarkOrangeClr],
            gradientStops: [0.0, 1.0],
            gradientStart: Alignment.centerLeft,
            gradientEnd: Alignment.centerRight,
          ),
        ],
      ),
    );
  }
}

import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_button.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCustomButton(
      kiddo: MyText(txt: "Create an account" ),
      onPressed: ()=>Navigator.pushNamed(context, "/register"),
      gradientColors: [
        Palette.kLightOrangeClr,
        Palette.kDarkOrangeClr
      ],
      gradientStops: [0.0, 1.0],
      gradientStart: Alignment.centerLeft,
      gradientEnd: Alignment.centerRight,
    );
  }
}

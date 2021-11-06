import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_button.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCustomButton(
      kiddo: MyText(txt: "Login"),
      onPressed: () => Navigator.pushNamed(context, "/login"),
      buttonShadow: [
        BoxShadow(
          color: const Color(0x8c0482ff),
          offset: Offset(0, 7),
          blurRadius: 22,
        ),
      ],
      gradientColors: [
        Palette.kPurpleClr,
        Palette.kPurpleShade1Clr,
        Palette.kLightBlueClr
      ],
      gradientStops: [0.0, 0.234, 1.0],
      gradientStart: Alignment(-0.75, 0.0),
      gradientEnd: Alignment(2.78, 1.0),
    );
  }
}

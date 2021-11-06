import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/screenNavigator");
      },
      child: MyText(
        txt: "skip for now >",
        txtClr: Palette.kLightGreyClr,
        fSize: 14,
      ),
    );
  }
}

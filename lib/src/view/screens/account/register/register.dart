import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_button.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text_field_wrapper.dart';
import 'package:anas_cars/src/view/global_widgets/custom_upper_image.dart';
import 'package:flutter/material.dart';

import 'local_widgets/register_info_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: MyUpperImage(
                img: KCroWelconeCarImg,
                titleTxt: "create\naccount",
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: RegisterInfoForm(),
          ),
        ],
      ),
    );
  }
}

import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/view/global_widgets/custom_upper_image.dart';
import 'package:flutter/material.dart';

import 'local_widgets/login_info_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: MyUpperImage(
              img: KWelconeCarImg,
              titleTxt: "log in",
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LoginInfoForm(),
          ),
        ],
      ),
    );
  }
}

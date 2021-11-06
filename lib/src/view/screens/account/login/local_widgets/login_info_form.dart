import 'package:anas_cars/src/providers/authtencation_provider.dart';
import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_button.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text_field_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginInfoForm extends StatefulWidget {
  const LoginInfoForm({Key? key}) : super(key: key);

  @override
  _LoginInfoFormState createState() => _LoginInfoFormState();
}

class _LoginInfoFormState extends State<LoginInfoForm> {
  // text fields controllers
  TextEditingController _emailFieldController = TextEditingController();
  TextEditingController _passwordFieldController = TextEditingController();

  // text fields nodes
  FocusNode _emailFieldNode = FocusNode();
  FocusNode _passwordFieldNode = FocusNode();

  @override
  void dispose() {
    _emailFieldController.dispose();
    _passwordFieldController.dispose();
    _emailFieldNode.dispose();
    _passwordFieldNode.dispose();
    super.dispose();
  }

  bool passwordVisible = false;
  bool isLoading = false;

  loginUser() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final bool emailValid = _emailFieldController.text.isNotEmpty &&
        _emailFieldController.text.trim() != '';
    final bool passwordValid = _passwordFieldController.text.isNotEmpty &&
        _passwordFieldController.text.trim() != '';
    if (emailValid && passwordValid) {
      setState(() => isLoading = true);
      authProvider
          .signIn(
            email: _emailFieldController.text.trim(),
            password: _passwordFieldController.text.trim(),
          )
          .then((val) => showRegisterFeedBack(val));
    } else {
      print("don't leave any text field empty plz");
    }
  }

  void showRegisterFeedBack(bool val) {
    _passwordFieldNode.unfocus();
    setState(() => isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      
      SnackBar(
        backgroundColor: Palette.kWhiteShade1Clr,
        content: MyText(
          txt: val ? 'You\'re signed in!' : 'Oops! Something went wrong.',
          txtClr: Palette.kBlackClr,
        ),
      ),
    );
    if (val) Navigator.pushReplacementNamed(context, "/root");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.71,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Palette.kWhiteClr,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LARGE_VSPACING,
                MyTextFieldWrapper(
                  kiddo: TextField(
                    controller: _emailFieldController,
                    focusNode: _emailFieldNode,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(hintText: "Email"),
                    onSubmitted: (text) {
                      _passwordFieldNode.requestFocus();
                    },
                  ),
                ),
                AVERAGE_VSPACING,
                MyTextFieldWrapper(
                  kiddo: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _passwordFieldController,
                          focusNode: _passwordFieldNode,
                          cursorColor: Colors.black,
                          obscureText: !passwordVisible,
                          decoration: InputDecoration(
                            hintText: "Password",
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            setState(() => passwordVisible = !passwordVisible),
                        child: Image.asset(
                            passwordVisible ? KEyeOpenIco : KEyeClosedIco),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 39.0),
              ],
            ),
            Column(
              children: [
                isLoading
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: CircularProgressIndicator(
                            color: Palette.kDarkPurpleClr),
                      )
                    : Container(),
                MyCustomButton(
                  kiddo: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(txt: "Log in"),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: 30,
                          color: Palette.kWhiteClr,
                        )
                      ],
                    ),
                  ),
                  onPressed: () => loginUser(),
                  gradientColors: [
                    Palette.kPurpleClr,
                    Palette.kPurpleShade1Clr,
                    Palette.kLightBlueClr
                  ],
                  gradientStops: [0.0, 0.234, 1.0],
                  gradientStart: Alignment(-0.75, 0.0),
                  gradientEnd: Alignment(2.78, 1.0),
                ),
                MEDIUM_VSPACING,
                Text("forgot your password?"),
                MEDIUM_VSPACING
              ],
            ),
          ],
        ),
      ),
    );
  }
}

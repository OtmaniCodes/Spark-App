import 'package:anas_cars/src/providers/authtencation_provider.dart';
import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_button.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text_field_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RegisterInfoForm extends StatefulWidget {
  const RegisterInfoForm({Key? key}) : super(key: key);

  @override
  _RegisterInfoFormState createState() => _RegisterInfoFormState();
}

class _RegisterInfoFormState extends State<RegisterInfoForm> {
  // text fields controllers
  TextEditingController _emailFieldController = TextEditingController();
  TextEditingController _countryFieldController = TextEditingController();
  TextEditingController _phoneNoFieldController = TextEditingController();
  TextEditingController _passwordFieldController = TextEditingController();

  // text fields nodes
  FocusNode _emailFieldNode = FocusNode();
  FocusNode _countryFieldNode = FocusNode();
  FocusNode _phoneNoFieldNode = FocusNode();
  FocusNode _passwordFieldNode = FocusNode();

  @override
  void dispose() {
    _emailFieldController.dispose();
    _countryFieldController.dispose();
    _phoneNoFieldController.dispose();
    _passwordFieldController.dispose();
    _emailFieldNode.dispose();
    _countryFieldNode.dispose();
    _phoneNoFieldNode.dispose();
    _passwordFieldNode.dispose();
    super.dispose();
  }

  bool passwordVisible = false;
  bool isLoading = false;

  registerUser() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final bool emailValid = _emailFieldController.text.isNotEmpty && _emailFieldController.text.trim() != ''; 
    final bool passwordValid = _passwordFieldController.text.isNotEmpty && _passwordFieldController.text.trim() != ''; 
    // final bool phoneNoValid = _phoneNoFieldController.text.isNotEmpty && _phoneNoFieldController.text.trim() != ''; 
    if(emailValid && passwordValid){
      setState(() => isLoading = true);
    authProvider.signUp(
      email: _emailFieldController.text.trim(),
      password: _passwordFieldController.text.trim(),
    ).then((val) => showRegisterFeedBack(val));}
    else{
      print("sth wrong with email/password/phoneNo fields");
    }
  }

  void showRegisterFeedBack(bool val) {
    _passwordFieldNode.unfocus();
    setState(() => isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Palette.kWhiteShade1Clr,
        content: MyText(
          txt: val
              ? 'Your account is created successfuly!'
              : 'Oops! Something went wrong.',
          txtClr: Palette.kBlackClr,
        ),
      ),
    );
    if(val) Navigator.pushReplacementNamed(context, "/root");
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
                      _countryFieldNode.requestFocus();
                    },
                  ),
                ),
                AVERAGE_VSPACING,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: MyTextFieldWrapper(
                        kiddo: TextField(
                          controller: _countryFieldController,
                          focusNode: _countryFieldNode,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(hintText: "Oman"),
                          onSubmitted: (text) {
                            _phoneNoFieldNode.requestFocus();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      flex: 2,
                      child: MyTextFieldWrapper(
                        kiddo: TextField(
                          controller: _phoneNoFieldController,
                          focusNode: _phoneNoFieldNode,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              hintText: "Phone Number",
                              hintStyle: TextStyle(color: Color(0x8079797A))),
                          onSubmitted: (text) {
                            _passwordFieldNode.requestFocus();
                          },
                        ),
                      ),
                    ),
                  ],
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
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'By creating an account you agree to out ',
                          style: TextStyle(color: Palette.kBlackClr)),
                      TextSpan(
                        text: 'terms and conditions',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
              isLoading ?  Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: CircularProgressIndicator(color: Palette.kDarkPurpleClr),
                ) : Container(),
                MyCustomButton(
                  
                  kiddo: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(txt: "Creare an account"),
                        const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: 30,
                          color: Palette.kWhiteClr,
                        )
                      ],
                    ),
                  ),
                  onPressed: ()=>registerUser(),
                  gradientColors: [
                    Palette.kPurpleClr,
                    Palette.kPurpleShade1Clr,
                    Palette.kLightBlueClr
                  ],
                  gradientStops: [0.0, 0.234, 1.0],
                  gradientStart: Alignment(-0.75, 0.0),
                  gradientEnd: Alignment(2.78, 1.0),
                ),
                MEDIUM_VSPACING
              ],
            ),
          ],
        ),
      ),
    );
  }
}

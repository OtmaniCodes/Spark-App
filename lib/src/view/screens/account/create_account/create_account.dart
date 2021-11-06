import 'package:flutter/material.dart';
import 'package:anas_cars/src/drawer_configuration.dart';
import 'package:anas_cars/src/providers/app_sizing_provider.dart';
import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:provider/provider.dart';
import './local_widgets/login_button.dart';
import './local_widgets/register_button.dart';
import './local_widgets/skipButton.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appSizingProv = Provider.of<AppSizingProv>(context);
    return DrawerConfig(
      widget: WillPopScope(
        onWillPop: () {
          if (appSizingProv.isDrwerMenuOpen) {
            appSizingProv.closeDrawerMenu();
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
          backgroundColor: Palette.kDarkPurpleClr,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                !(appSizingProv.isDrwerMenuOpen)
                    ? appSizingProv.openDrawerMenu()
                    : appSizingProv.closeDrawerMenu();
              },
              child: appSizingProv.isDrwerMenuOpen
                  ? Icon(Icons.arrow_back_ios)
                  : Image.asset(KMenu1Ico),
            ),
            actions: [
              GestureDetector(
                onTap: () {},
                child: Image.asset(KBubbleIco),
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset(KSavedIco),
              ),
              SizedBox(
                width: 50,
              )
            ],
          ),
          body: Container(
            child: Stack(
              children: [
                Image.asset(
                  KWelconeCarImg,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.21, 0.46),
                      end: Alignment(0.21, 0.0),
                      colors: [Palette.kDarkPurpleClr, const Color(0x0f555c7a)],
                      stops: [0.0, 1.0],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LoginButton(),
                        AVERAGE_VSPACING,
                        RegisterButton(),
                        SMALL_VSPACING,
                        SkipButton(),
                        SMALL_VSPACING
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

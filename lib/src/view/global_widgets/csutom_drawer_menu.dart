import 'package:anas_cars/src/providers/authtencation_provider.dart';
import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawerMenu extends StatefulWidget {
  MyDrawerMenu({Key? key}) : super(key: key);

  @override
  _MyDrawerMenuState createState() => _MyDrawerMenuState();
}

class _MyDrawerMenuState extends State<MyDrawerMenu> {
  final List<String> txts = [
    "Home",
    "Missions",
    "notifications",
    "Language",
    "Terms & conditions"
  ];

  final List<String> icons = [
    KHomeIco,
    KMissionsIco,
    KNotificationsIco,
    KLangIco,
    KTermsIco
  ];

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Container(
        color: Color(0xFF1C1E28),
        alignment: Alignment.centerLeft,
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              6,
              (index) => index == 0
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10.0,bottom: 50),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                     children: [
                        Container(
                          child: Center(
                            child: Text(
                              "A",
                              style: defaulTS.copyWith(
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment(0.0, -1.0),
                              end: Alignment(0.0, 1.0),
                              colors: [
                                const Color(0xff8300ff),
                                const Color(0xff565aff)
                              ],
                              stops: [0.0, 1.0],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              authProvider.getCurrentUser?.displayName ?? 'Guest',
                              style: defaulTS.copyWith(
                                fontWeight: FontWeight.w500,
                                height: 0.77,
                              ),
                            ),
                            TINY_VSPACING,
                             Text(
                              authProvider.getCurrentUser?.email ?? 'guest@gmail.com',
                              style: defaulTS.copyWith(
                                fontSize: 14,
                                color: const Color(0xb5ffffff),
                                letterSpacing: 0.196,
                                height: 1.071,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 40.0),
                         Image.asset(KSettings2Ico),],
                      ),
                    )
                  : Material(
                      color: Palette.kTransparentClr,
                      child: InkWell(
                        onTap: () {
                          setState(() => currentIndex = index - 1);
                        },
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getMenuSection(
                                  txts[index - 1], icons[index - 1], index - 1),
                              Divider(
                                height: 0,
                                thickness: 1.1,
                                color: Color(0xFF707070),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
        ),
      ),
    );
  }

  int currentIndex = 0;

  Widget getMenuSection(txt, icon, index) {
    bool isOn = currentIndex == index;
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          height: isOn ? 40 : 0,
          width: 3,
          decoration: BoxDecoration(
            color: const Color(0xFFFF9053),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 25, top: 20, bottom: 20),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            AnimatedOpacity(
               duration: Duration(milliseconds: 400),
              opacity: isOn ? 0.0 : 1.0,
              child: Image.asset(
                icon,
                color: Palette.kWhiteClr,
              ),
            ),
            const SizedBox(width: 20.0),
            Text(
              txt,
              style: defaulTS.copyWith(
                letterSpacing: 0.54,
                fontWeight: FontWeight.w500,
                height: 1.46,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

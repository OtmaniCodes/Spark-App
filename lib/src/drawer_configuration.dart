import 'package:anas_cars/src/providers/app_sizing_provider.dart';
import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/csutom_drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerConfig extends StatelessWidget {
  final Widget widget;
  const DrawerConfig({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appSizingProv = Provider.of<AppSizingProv>(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        MyDrawerMenu(),
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            appSizingProv.isDrwerMenuOpen
                ? getStackedScreens()
                : SizedBox.shrink(),
            AnimatedContainer(
              transform: Matrix4.translationValues(
                  appSizingProv.getXoffSet, appSizingProv.getYoffSet, 0)
                ..scale(appSizingProv.getScaleFactor),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      appSizingProv.isDrwerMenuOpen ? 30.0 : 0.0),
                  child: widget),
            ),
          ],
        ),
      ],
    );
  }

  getStackedScreens() {
    return Stack(
      children: [
        Container(
          transform: Matrix4.translationValues(290, 87, 0)..scale(0.7),
          child: Opacity(
            opacity: 0.5,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(
                     30.0 ),
                child: IgnorePointer(ignoring: true, child: widget)),
          ),
        ),
        Container(
          transform: Matrix4.translationValues(280, 111, 0)..scale(0.6),
          child: Opacity(
            opacity: 0.25,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    30.0 ),
                child: IgnorePointer(ignoring: true, child: widget)),
          ),
        ),
      ],
    );
  }
}


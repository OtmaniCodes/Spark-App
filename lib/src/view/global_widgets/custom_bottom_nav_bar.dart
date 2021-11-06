import 'package:anas_cars/src/providers/screen_index_provider.dart';
import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  final List<String> itemIcons = [KHomeIco, KQuotesIco, KProfileIco];
  final List<String> itemTitles = ["Home", "Offers", "Profile"];
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double myHeight = 62.0;
    final indexScreenProvider = Provider.of<ScreenIndexProv>(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(offset: Offset(0, 3), blurRadius: 6),
        ],
        color: Palette.kWhiteClr,
      ),
      height: myHeight,
      width: screenWidth,
      child: Row(
        children: List.generate(
          3,
          (index) => GestureDetector(
            onTap: () => indexScreenProvider.setScreenIndex = index,
            child: ClipPath(
              clipper: BottomNavItemClipper(bottomNavItemIndex: index),
              child: Container(
                height: myHeight,
                width: screenWidth / 3,
                color: !(indexScreenProvider.getScreenIndex == index)
                    ? Palette.kWhiteClr
                    : Palette.kOrangeShade1Clr.withOpacity(0.09),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      itemIcons[index],
                      color: !(indexScreenProvider.getScreenIndex == index)
                          ? Palette.kBlackClr
                          : Palette.kOrangeShade1Clr,
                    ),
                    const SizedBox(width: 8.0),
                    MyText(
                      txt: itemTitles[index],
                      fSize: 16,
                      txtClr: !(indexScreenProvider.getScreenIndex == index)
                          ? Palette.kBlackClr
                          : Palette.kOrangeShade1Clr,
                      boldness: FontWeight.w500,
                      alignment: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavItemClipper extends CustomClipper<Path> {
  final int? bottomNavItemIndex;
  BottomNavItemClipper({this.bottomNavItemIndex});
  @override
  Path getClip(Size size) {
    Path path = Path();
    switch (bottomNavItemIndex) {
      case 0:
        path.lineTo(0, size.height);
        path.lineTo(size.width * 0.85, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(0, 0);
        break;
      case 1:
        path.moveTo(size.width, 0);

        path.lineTo(size.width * 0.85, size.height);
        path.lineTo(0, size.height);
        path.lineTo(size.width * 0.15, 0);
        path.lineTo(size.width, 0);
        break;
      case 2:
        path.moveTo(size.width, 0);

        path.lineTo(size.width, size.height);
        path.lineTo(0, size.height);
        path.lineTo(size.width * 0.15, 0);
        path.lineTo(size.width, 0);
        break;
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

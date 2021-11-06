import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_container.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CarPricingPart4 extends StatefulWidget {
  const CarPricingPart4({Key? key}) : super(key: key);

  @override
  _CarPricingPart4State createState() => _CarPricingPart4State();
}

class _CarPricingPart4State extends State<CarPricingPart4> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MEDIUM_VSPACING,
              MyText(
                txt: 'Enter your car specifications?',
                alignment: TextAlign.left,
                txtClr: const Color(0xff2b2d3d),
                boldness: FontWeight.w500,
              ),
              MEDIUM_VSPACING,
              MyCustomContainer(
                givenPadd: EdgeInsets.all(20.0),
                kiddo: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyText(
                      txt: 'How many slenders your car have ?',
                      fSize: 16,
                      txtClr: Palette.kBlackClr,
                      txtHeight: 1.5,
                    ),
                    SMALL_VSPACING,
                    Row(
                      children: [
                        [0, '4'],
                        [1, '6'],
                        [2, '8']
                      ].map((e) => getSlenderBox(e)).toList(),
                    ),
                    MEDIUM_VSPACING,
                    MyText(
                      txt: 'Car specs',
                      fSize: 16,
                      txtClr: Palette.kBlackClr,
                      txtHeight: 1.5,
                    ),
                    SMALL_VSPACING,
                    Row(
                      children: [
                        [0, "USA"],
                        [1, "GCC"]
                      ].map((e) => getSlenderBox(e)).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int currentIndex = 0;

  Widget getSlenderBox(List e) {
    return GestureDetector(
      onTap: () {
        setState(() => currentIndex = e[0]);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
        child: MyText(
          txt: e[1],
          fSize: 16,
          txtClr:
              currentIndex == e[0] ? Color(0xff5c4cff) : Palette.kLightGreyClr,
          txtHeight: 1.5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0x125c4cff),
        ),
      ),
    );
  }
}

import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_button.dart';
import 'package:anas_cars/src/view/global_widgets/custom_container.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class OrderCarCard extends StatelessWidget {
  const OrderCarCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCustomContainer(
      givenPadd: const EdgeInsets.all(30),
      givenMarg: const EdgeInsets.symmetric(horizontal: 20),
      kiddo: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyText(
            txt: 'Order car free parts pricing',
            txtClr: Palette.kBlackClr,
            boldness: FontWeight.w500,
            alignment: TextAlign.center,
          ),
          AVERAGE_VSPACING,
          MyText(
            txt: 'You can submit car parts you need for your car and we will match you with the best offers',
            fSize: 14,
            txtClr: Palette.kBlackClr,
            txtHeight: 1.71,
            alignment: TextAlign.center,
          ),
          MEDIUM_VSPACING,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: MyCustomButton(
              kiddo: MyText(
                txt: 'Start now',
                fSize: 16,
                boldness: FontWeight.w500,
                txtHeight: 1.5,
                alignment: TextAlign.center,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/orderPricing");
              },
              gradientColors: [Palette.kLightOrangeClr, Palette.kDarkOrangeClr],
              gradientStops: [0.0, 1.0],
              gradientStart: Alignment.centerLeft,
              gradientEnd: Alignment.centerRight,
            ),
          ),
        ],
      ),
    );
  }
}

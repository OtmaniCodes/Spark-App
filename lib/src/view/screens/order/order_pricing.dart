import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_container.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'local_widgets/favorite_car_card.dart';

class OrderPricingScreen extends StatelessWidget {
  const OrderPricingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        backgroundColor: Palette.kDarkPurpleClr,
        title: MyText(
          txt: 'Order car Pricing',
          fSize: 20,
          charSpacing: -0.48,
          boldness: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MEDIUM_VSPACING,
            MyText(
              txt: 'order car part pricing for ...',
              txtClr: const Color(0xff2b2d3d),
              boldness: FontWeight.w500,
            ),
            MEDIUM_VSPACING,
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/carPartPricing");
              },
              child: MyCustomContainer(
                givenPadd: const EdgeInsets.all(25.0),
                kiddo: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      txt: 'New car ',
                      fSize: 16,
                      txtClr: Palette.kBlackClr,
                      boldness: FontWeight.w500,
                      txtHeight: 1.5,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 30,
                      color: Palette.kWhiteShade2Clr,
                    )
                  ],
                ),
              ),
            ),
            MEDIUM_VSPACING,
            MyText(
              txt: 'Or select a car from your favorites',
              txtClr: Palette.kGreyShade4Clr,
              boldness: FontWeight.w500,
            ),
            MEDIUM_VSPACING,
            FavoriteCarCard()
          ],
        ),
      ),
    );
  }
}

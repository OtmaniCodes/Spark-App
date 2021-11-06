import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/utils/scroll_behavior.dart';
import 'package:anas_cars/src/view/global_widgets/custom_container.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text_field_wrapper.dart';
import 'package:flutter/material.dart';

class CarPricingPart2 extends StatelessWidget {
  CarPricingPart2({Key? key}) : super(key: key);

  final List brandsData = [
    {"image": KCarModel1, "name": "Nissan"}
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: double.infinity,
          height: 78,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
          decoration: BoxDecoration(
            color: Palette.kWhiteClr,
          ),
          child: MyTextFieldWrapper(
            kiddo: Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration:
                        InputDecoration(hintText: "Searsh car brand name"),
                    onSubmitted: (text) {
                      print(text);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image.asset(KSearchIco),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              MEDIUM_VSPACING,
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: MyText(
                  txt: 'What is your car Brand?',
                  alignment: TextAlign.left,
                  txtClr: Palette.kGreyShade4Clr,
                  boldness: FontWeight.w500,
                ),
              ),
              MEDIUM_VSPACING,
              ScrollConfiguration(
                behavior: MyScrollBehavior(),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(
                      right: 20.0, left: 20.0, bottom: 15),
                  crossAxisSpacing: 12.5,
                  mainAxisSpacing: 12.5,
                  childAspectRatio: 1,
                  crossAxisCount: 4,
                  children: List.generate(
                    30,
                    (index) => getBrandCard(brandsData[0]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getBrandCard(Map data) {
    return GestureDetector(
      onDoubleTap: () {
        print("tapped");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              data["image"],
              height: 42,
            ),
            MyText(
              txt: 'Nissan',
              fSize: 14,
              txtClr: Palette.kGreyShade4Clr,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Palette.kWhiteClr,
          border: Border.all(
            width: 1.0,
            color: const Color(0xfff0f0f1),
          ),
        ),
      ),
    );
  }
}

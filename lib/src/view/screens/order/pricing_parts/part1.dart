import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_container.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text_field_wrapper.dart';
import 'package:flutter/material.dart';

class CarPricingPart1 extends StatelessWidget {
  const CarPricingPart1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              MEDIUM_VSPACING,
              MyCustomContainer(
                givenPadd: EdgeInsets.all(20.0),
                kiddo: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyText(
                      txt: 'Enter your car chassis number',
                      txtClr: const Color(0xff2b2d3d),
                      boldness: FontWeight.w500,
                    ),
                    SMALL_VSPACING,
                    Container(
                      child: MyText(
                        txt: 'PIC',
                        alignment: TextAlign.center,
                        txtHeight: 1.5,
                      ),
                      height: 183,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xff020b38),
                      ),
                    ),
                    MEDIUM_VSPACING,
                    MyText(
                      txt:
                          'Please enter valid chassis number that consist of 17 litters / numbers',
                      fSize: 14,
                      txtClr: const Color(0x542b2d3d),
                    ),
                    TINY_VSPACING,
                    MyTextFieldWrapper(
                      kiddo: TextField(
                        cursorColor: Colors.black,
                        decoration:
                            InputDecoration(hintText: "ex : KMHTC61C0FU220137"),
                        onSubmitted: (text) {
                          print(text);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 130.0),
          child: MyText(
            txt: 'I Don\'t have it currently',
            alignment: TextAlign.center,
            fSize: 16,
            txtClr: const Color(0x732b2d3d),
          ),
        ),
      ],
    );
  }
}

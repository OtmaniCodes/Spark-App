import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CarModelBox extends StatelessWidget {
  final Map data; // temp data
  const CarModelBox({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Palette.kWhiteClr,
        border: Border.all(width: 1.0, color: Palette.kGreyShade2Clr),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                txt: data["name"],
                fSize: 16,
                txtClr: const Color(0xffff9053),
                txtHeight: 1.5,
              ),
              Row(
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1.5),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(20.0, 20.0)),
                      color: Palette.kGreyShade3Clr,
                    ),
                  ),
                ),
              )
            ],
          ),
          SMALL_VSPACING,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    txt: 'Car name : ${data["car_name"]}',
                    fSize: 14,
                    txtClr: Palette.kBlackClr,
                    txtHeight: 1.71,
                    alignment: TextAlign.center,
                  ),
                  MyText(
                    txt: 'Car model : ${data["car_model"]}',
                    fSize: 14,
                    txtClr: Palette.kBlackClr,
                    txtHeight: 1.71,
                    alignment: TextAlign.center,
                  ),
                ],
              ),
              Image.asset(data["image"])
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_button.dart';
import 'package:anas_cars/src/view/global_widgets/custom_car_model_box.dart';
import 'package:anas_cars/src/view/global_widgets/custom_container.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class FavoriteCarCard extends StatelessWidget {
  FavoriteCarCard({Key? key}) : super(key: key);
  final List<Map<String, String>> carModels = [
    {
      "image": KCarModel1,
      "name": "My best car ever",
      "car_name": "Nissan Altima 2019",
      "car_model": "2H2XA59BWDY987665",
    },
    {
      "image": KCarModel2,
      "name": "Wife car",
      "car_name": "Nissan Altima 2019",
      "car_model": "KD769 tdm7668 xx544",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MyCustomContainer(
      givenPadd: const EdgeInsets.all(30),
      givenMarg: null,
      kiddo: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MyText(
            txt: 'Your favorite cars',
            txtClr: Palette.kBlackClr,
            boldness: FontWeight.w500,
            txtHeight: 1.33,
            alignment: TextAlign.left,
          ),
          AVERAGE_VSPACING,
          Column(
            children: List.generate(
              carModels.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CarModelBox(
                  data: carModels[index],
                ),
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }
}

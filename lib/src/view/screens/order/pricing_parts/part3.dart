import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_container.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text_field_wrapper.dart';
import 'package:flutter/material.dart';

class CarPricingPart3 extends StatefulWidget {
  const CarPricingPart3({Key? key}) : super(key: key);

  @override
  _CarPricingPart3State createState() => _CarPricingPart3State();
}

class _CarPricingPart3State extends State<CarPricingPart3> {
  final List<String> brandModelNames = [
    "Venue",
    "Tucson",
    "Kona Electric",
    "Ionic",
    "Elantra",
    "Nexo"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  txt: 'What is your Nissan car model?',
                  alignment: TextAlign.left,
                  txtClr: const Color(0xff2b2d3d),
                  boldness: FontWeight.w500,
                ),
              ),
              MEDIUM_VSPACING,
              ...brandModelNames.map(
                (modelName) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: getCarModelCard(
                        modelName, brandModelNames.indexOf(modelName)),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  int currentIndex = 0;
  double selectedYear = 2016;

  Widget getCarModelCard(String name, int index) {
    print(index);
    final MyText text = MyText(
      txt: name,
      fSize: 16,
      txtClr: const Color(0xff2b2d3d),
      txtHeight: 1.5,
    );
    bool isExpanded = currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => currentIndex = index);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        height: isExpanded ? 167 : 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Palette.kWhiteClr,
          border: Border.all(
            width: 1.0,
            color: const Color(0xfff0f0f1),
          ),
        ),
        child: ListView(physics: NeverScrollableScrollPhysics(), children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text,
                    isExpanded
                        ? Icon(
                            Icons.check,
                            color: Color(0xFF565AFF),
                          )
                        : Container()
                  ],
                ),
              ),
              LARGE_VSPACING,
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Slider(
                      min: (DateTime.now().year - 7) / 1,
                      max: DateTime.now().year / 1,
                      divisions: 7,
                      inactiveColor: Color(0xFF707070),
                      activeColor: Color(0xFFFF8B52),
                      value: selectedYear,
                      label: "${selectedYear.round()}",
                      onChanged: (double newValue) {
                        setState(
                          () {
                            selectedYear = newValue;
                          },
                        );
                      }),
                  Container(
                    padding: const EdgeInsets.only(bottom: 15, left: 10),
                    child: MyText(
                      txt: 'Car model year ',
                      fSize: 14,
                      txtClr: const Color(0x732b2d3d),
                      charSpacing: 0.14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

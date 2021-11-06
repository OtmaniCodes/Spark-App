import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_container.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text_field_wrapper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CarPricingPart5 extends StatelessWidget {
  CarPricingPart5({Key? key}) : super(key: key);

  final List<String> picturesPaths = [
    KEngine1Img,
    KEngine2Img,
    KEngine3Img,
    KEngine4Img,
    KEngine1Img,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              MEDIUM_VSPACING,
              MyCustomContainer(
                givenPadd: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 15.0),
                kiddo: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyText(
                          txt: 'My best car ever',
                          fSize: 16,
                          txtClr: Palette.kBlackClr,
                          boldness: FontWeight.w500,
                          txtHeight: 1.5,
                        ),
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
                              txt: 'Car model : 2H2XA59BWDY987665',
                              fSize: 16,
                              txtClr: const Color(0x52000000),
                              txtHeight: 1.5,
                            ),
                            MyText(
                              txt: 'Car name : Nissan Altima 2019',
                              fSize: 16,
                              txtClr: const Color(0x52000000),
                              txtHeight: 1.5,
                            ),
                          ],
                        ),
                        Image.asset(KCarModel1)
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              MyCustomContainer(
                givenPadd: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 15.0),
                kiddo: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      txt: 'Car part name',
                      fSize: 16,
                      txtClr: Palette.kBlackClr,
                      boldness: FontWeight.w500,
                      txtHeight: 1.5,
                    ),
                    SMALL_VSPACING,
                    MyTextFieldWrapper(
                      kiddo: TextField(
                        cursorColor: Colors.black,
                        decoration:
                            InputDecoration(hintText: "ex : front part"),
                        onSubmitted: (text) {
                          print(text);
                        },
                      ),
                    ),
                    MEDIUM_VSPACING,
                    MyText(
                      txt: 'Car part pictures ( optional )',
                      fSize: 16,
                      txtClr: Palette.kBlackClr,
                      boldness: FontWeight.w500,
                      txtHeight: 1.5,
                    ),
                    SMALL_VSPACING,
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          ...List.generate(
                            picturesPaths.length,
                            (index) => Positioned(
                              left: 35.0 * index,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 3.0,
                                    color: Palette.kWhiteClr,
                                  ),
                                ),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(picturesPaths[index]),
                                  radius: 49 / 2,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 35.0 * picturesPaths.length,
                            child: GestureDetector(
                              onTap: () {
                                print("add picture");
                              },
                              child: Container(
                                  height: 52,
                                  width: 52,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFEF3EE),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 3.0,
                                      color: Palette.kWhiteClr,
                                    ),
                                  ),
                                  child: Image.asset(KAddPictureIco)),
                            ),
                          )
                        ],
                      ),
                    ),
                    MEDIUM_VSPACING,
                    MyText(
                      txt: 'Details ( if available ) ',
                      fSize: 16,
                      txtClr: Palette.kBlackClr,
                      boldness: FontWeight.w500,
                      txtHeight: 1.5,
                    ),
                    SMALL_VSPACING,
                    MyTextFieldWrapper(
                      givenHeight: 73,
                      kiddo: TextField(
                        cursorColor: Colors.black,
                        maxLines: 5,
                        decoration: InputDecoration(
                            hintText: "ex : front part description or details"),
                        onSubmitted: (text) {
                          print(text);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  print("adding new part");
                },
                child: DottedBorder(
                  color: const Color(0xff5c4cff),
                  dashPattern: [5],
                  strokeWidth: 1.2,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  padding: EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      height: 57,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: MyText(
                        txt: 'Add other part',
                        fSize: 16,
                        txtClr: const Color(0xff5c4cff),
                        boldness: FontWeight.w500,
                        txtHeight: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        MEDIUM_VSPACING
      ],
    );
  }
}

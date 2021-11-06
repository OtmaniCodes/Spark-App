import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarsCarousel extends StatefulWidget {
  const CarsCarousel({Key? key}) : super(key: key);

  @override
  _CarsCarouselState createState() => _CarsCarouselState();
}

class _CarsCarouselState extends State<CarsCarousel> {
  final List<String> carouselImages = [
    KHomeCarsImg,
    KHomeCarsImg,
    KWelconeCarImg,
    KHomeCarsImg,
    KWelconeCarImg,
  ];

  int selectedInd = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Stack(
              children: [
                CarouselSlider(
                  items: carouselImages
                      .map((String img) => getCarouselItem(img))
                      .toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, r) {
                      setState(
                        () {
                          selectedInd = index;
                        },
                      );
                    },
                    height: 250,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(bottom: 35),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          carouselImages.length, (index) => getDot(index)),
                    ),
                  ),
                ),
                Positioned(
                  top: 88,
                  left: 22,
                  child: IgnorePointer(
                    ignoring: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          txt: "cars parts",
                          charSpacing: 0.14,
                          boldness: FontWeight.w500,
                          txtHeight: 1.28,
                        ),
                        TINY_VSPACING,
                        MyText(
                          txt: "Discover your new car\nExperience Now",
                          alignment: TextAlign.start,
                          fSize: 28,
                          boldness: FontWeight.w500,
                          txtHeight: 1.21,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getDot(int index) {
    bool isOn = selectedInd == index;
    return AnimatedContainer(
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 400),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 8,
      width: isOn ? 32 : 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(20.0, 20.0)),
        color: isOn ? Palette.kWhiteShade1Clr : Palette.kGreyShade1Clr,
      ),
    );
  }

  Widget getCarouselItem(String img) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(img),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.06, 1.0),
              end: Alignment(-0.06, -1.0),
              colors: [
                Palette.kPurpleShade2Clr,
                Palette.kPurpleShade3Clr,
                Palette.kPurpleShade4Clr,
              ],
              stops: [0.0, 0.41, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: Palette.kPurpleShade5Clr,
                offset: Offset(8, 0),
                blurRadius: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

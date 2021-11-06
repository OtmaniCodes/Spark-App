import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_button.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';

import 'package:flutter/material.dart';

import './pricing_parts/parts.dart';

class CarPartPricingScreen extends StatefulWidget {
  const CarPartPricingScreen({Key? key}) : super(key: key);

  @override
  _CarPartPricingScreenState createState() => _CarPartPricingScreenState();
}

class _CarPartPricingScreenState extends State<CarPartPricingScreen> {
  late PageController _carPricingPageViewController;
  final List<Widget> pricingPartsScreens = [
    CarPricingPart1(),
    CarPricingPart2(),
    CarPricingPart3(),
    CarPricingPart4(),
    CarPricingPart5(),
  ];
  int _pageViewCurrentIndex = 0;

  @override
  void initState() {
    super.initState();
    _carPricingPageViewController = PageController();
  }

  @override
  void dispose() {
    _carPricingPageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageViewCurrentIndex == 0)
          return Future.value(true);
        else
          goToPrevoiusPart();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 3.0,
          backgroundColor: Palette.kDarkPurpleClr,
          actions: (_pageViewCurrentIndex == 0 || _pageViewCurrentIndex >= 4)
              ? null
              : actionIsOn(),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (_pageViewCurrentIndex == 0)
                Navigator.pop(context);
              else
                goToPrevoiusPart();
            },
          ),
          title: MyText(
            txt: 'Car part pricing',
            fSize: 20,
            charSpacing: -0.48,
            boldness: FontWeight.w500,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _carPricingPageViewController,
                onPageChanged: (pageIndex) {
                  setState(() {
                    _pageViewCurrentIndex = pageIndex;
                  });
                },
                children: pricingPartsScreens,
              ),
            ),
            _pageViewCurrentIndex == 10
                ? Container()
                : MyCustomButton(
                    kiddo: MyText(
                      txt: 4 == _pageViewCurrentIndex ? 'Order now' : 'Next',
                      boldness: FontWeight.w500,
                      txtHeight: 1.5,
                    ),
                    onPressed: () => goToNextPart(),
                    gradientColors: [
                      Palette.kLightOrangeClr,
                      Palette.kDarkOrangeClr
                    ],
                    gradientStops: [0.0, 1.0],
                    gradientStart: Alignment.centerRight,
                    gradientEnd: Alignment.centerLeft,
                    applyRadius: false,
                  )
          ],
        ),
      ),
    );
  }

  void goToNextPart() {
    int index = _pageViewCurrentIndex + 1 >= pricingPartsScreens.length
        ? pricingPartsScreens.length
        : _pageViewCurrentIndex + 1;
    _carPricingPageViewController.animateToPage(index,
        duration: Duration(milliseconds: 600), curve: Curves.ease);
  }

  void goToPrevoiusPart() {
    int index = _pageViewCurrentIndex - 1 <= 0 ? 0 : _pageViewCurrentIndex - 1;
    _carPricingPageViewController.animateToPage(index,
        duration: Duration(milliseconds: 600), curve: Curves.ease);
  }

  List<Widget> actionIsOn() {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              txt: 'Step $_pageViewCurrentIndex/3',
              fSize: 16,
              txtHeight: 1.5,
            ),
            SizedBox(height: 5.0),
            Row(
              children: List.generate(3, (index) => pageActive(index)),
            )
          ],
        ),
      )
    ];
  }

  Widget pageActive(int index) {
    bool isOn = _pageViewCurrentIndex >= index + 1;
    return AnimatedContainer(
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 4,
      width: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(20.0, 20.0)),
        color: isOn ? Color(0xFF5C4CFF) : Color(0xFFDFDEE7),
      ),
    );
  }
}

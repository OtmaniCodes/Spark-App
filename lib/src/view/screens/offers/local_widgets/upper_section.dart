import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class UpperSection extends StatefulWidget {
  const UpperSection({Key? key}) : super(key: key);

  @override
  _UpperSectionState createState() => _UpperSectionState();
}

class _UpperSectionState extends State<UpperSection> {
  ScrollController _scrollController = ScrollController();
  final List<String> picturesPaths = [
    KEngine1Img,
    KEngine2Img,
    KEngine3Img,
    KEngine4Img,
    KEngine1Img,
  ];
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) => AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut,
        width: constrains.maxWidth,
        height: _isExpanded ? 430 : 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                controller: _scrollController,
                children: [
                  Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                txt: 'Part Name',
                                fSize: 16,
                                txtClr: Palette.kBlackClr,
                                boldness: FontWeight.w500,
                                txtHeight: 1.5,
                              ),
                              MyText(
                                txt: 'Nissan altima 2019',
                                fSize: 16,
                                txtClr: const Color(0x59000000),
                                txtHeight: 1.5,
                              ),
                            ],
                          ),
                          Image.asset(KCarModel1)
                        ],
                      ),
                    ),
                  ),
                  SMALL_VSPACING,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyText(
                          txt: 'Published date',
                          fSize: 16,
                          txtClr: Palette.kBlackClr,
                          boldness: FontWeight.w500,
                          txtHeight: 1.5,
                        ),
                        MyText(
                          txt: '05/03/2021',
                          fSize: 16,
                          txtClr: const Color(0x59000000),
                          txtHeight: 1.5,
                        ),
                        SMALL_VSPACING,
                        MyText(
                          txt: 'Attached pictures',
                          fSize: 16,
                          txtClr: Palette.kBlackClr,
                          boldness: FontWeight.w500,
                          txtHeight: 1.5,
                        ),
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
                            ],
                          ),
                        ),
                        SMALL_VSPACING,
                        MyText(
                          txt: 'Description / part info ',
                          fSize: 16,
                          txtClr: Palette.kBlackClr,
                          boldness: FontWeight.w500,
                          txtHeight: 1.5,
                        ),
                        MyText(
                          txt:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam viverra...  varius. Cras sollicitudin ipsum sed leo ullamcorper lacinia. Praesent tempor nec risus nec fermentum. Integer tempor dictum dignissim. Nunc iaculis, eros ut suscipit scelerisque, tellus felis elementum velit, vitae egestas lacus eros id tortor.',
                          fSize: 16,
                          txtClr: const Color(0x59000000),
                          txtHeight: 1.5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                _scrollController.animateTo(0.0,
                    duration: Duration(milliseconds: 100), curve: Curves.ease);
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Container(
                color: Palette.kTransparentClr,
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, bottom: 10, top: 11),
                child: Image.asset(KArrowUpIco),
              ),
            )
          ],
        ),
      ),
    );
  }
}

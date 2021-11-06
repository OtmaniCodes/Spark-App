import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_container.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PartCard extends StatelessWidget {
  final Map data;
  const PartCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/ongoingOffers", arguments: data);
      },
      child: MyCustomContainer(
        givenMarg: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        givenPadd: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        kiddo: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              title: MyText(
                txt: 'Part Name',
                fSize: 16,
                txtClr: Palette.kBlackClr,
                boldness: FontWeight.w500,
                txtHeight: 1.5,
              ),
              subtitle: MyText(
                txt: data['partName'],
                fSize: 16,
                txtClr: const Color(0x59000000),
                txtHeight: 1.5,
              ),
              trailing: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(20.0, 20.0)),
                        color: Palette.kGreyShade3Clr,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getSmallCard(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyText(
                        txt: data["submitedQuotesCount"].toString(),
                        fSize: 24,
                        txtClr: const Color(0xffff9053),
                        boldness: FontWeight.w500,
                      ),
                      MyText(
                        txt: 'Submited quotes',
                        fSize: 14,
                        txtClr: Palette.kBlackClr,
                        txtHeight: 1.71,
                      ),
                    ],
                  ),
                ),
                getSmallCard(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: data['lowestPrice'] == null
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyText(
                            txt: data['lowestPrice'] == null
                                ? "--"
                                : data['lowestPrice'].toString(),
                            fSize: 24,
                            txtClr: const Color(0xff3376F5),
                            boldness: data['lowestPrice'] == null
                                ? FontWeight.bold
                                : FontWeight.w500,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: MyText(
                              txt: 'OMR',
                              fSize: 12,
                              txtClr: const Color(0x40000000),
                              txtHeight: 2,
                            ),
                          ),
                        ],
                      ),
                      MyText(
                        txt: 'Lowest price',
                        fSize: 14,
                        txtClr: Palette.kBlackClr,
                        txtHeight: 1.71,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getSmallCard(Widget child) {
    return Container(
        padding: const EdgeInsets.fromLTRB(15, 15, 30, 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.0),
          color: const Color(0x21ffffff),
          border: Border.all(width: 1.0, color: const Color(0x21707070)),
        ),
        child: child);
  }
}

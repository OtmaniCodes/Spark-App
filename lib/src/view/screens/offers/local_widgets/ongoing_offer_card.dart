import 'package:anas_cars/src/models/ongoing_offer.dart';
import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_container.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class OngoingOfferCard extends StatelessWidget {
  final OngoingOfferModel data;
  const OngoingOfferCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/ongoingQuotes", arguments: data);
      },
      child: MyCustomContainer(
        giveBorder: data.isUsed! ? Border.all(color: Color(0xffff8f52)) : null,
        givenMarg: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        givenPadd: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        kiddo: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              trailing: data.isUsed!
                  ? Container(
                      alignment: Alignment.center,
                      child: MyText(
                        txt: 'best price',
                        fSize: 12,
                      ),
                      width: 75,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffff8f52),
                      ),
                    )
                  : SizedBox.shrink(),
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: MyText(txt: data.name![0]),
              ),
              title: MyText(
                txt: data.name!,
                fSize: 16,
                txtClr: Palette.kBlackClr,
                boldness: FontWeight.w500,
                txtHeight: 1.5,
              ),
              subtitle: MyText(
                txt: data.location!,
                fSize: 16,
                txtClr: const Color(0x59000000),
                txtHeight: 1.5,
              ),
            ),
            SMALL_VSPACING,
            MyText(
              txt: data.description!.length > 90
                  ? data.description!.substring(0, 90) + "..."
                  : data.description!,
              alignment: TextAlign.start,
              fSize: 16,
              txtClr: const Color(0x59000000),
              txtHeight: 1.5,
            ),
            SMALL_VSPACING,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    style: defaulTS.copyWith(
                      fontSize: 16,
                      color: const Color(0xff050505),
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text: 'Condition : ',
                      ),
                      TextSpan(
                        text: data.isUsed! ? "used" : 'new',
                        style: defaulTS.copyWith(
                          color: data.isUsed!
                              ? Color(0xffff8f52)
                              : Color(0xff16792a),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: data.price == null
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyText(
                      txt: data.price == null ? "--" : data.price.toString(),
                      fSize: 24,
                      txtClr:
                          data.isUsed! ? Color(0xffff8f52) : Color(0xff3376F5),
                      boldness: data.price == null
                          ? FontWeight.bold
                          : FontWeight.w500,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: MyText(
                        txt: 'OMR',
                        fSize: 12,
                        txtClr: data.isUsed!
                            ? Color(0xffff8f52)
                            : Color(0xff3376F5),
                        txtHeight: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

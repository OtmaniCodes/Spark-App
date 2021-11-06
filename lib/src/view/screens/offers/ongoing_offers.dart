import 'package:anas_cars/src/models/ongoing_offer.dart';
import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:anas_cars/src/view/global_widgets/custom_container.dart';
import 'package:anas_cars/src/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'local_widgets/ongoing_offer_card.dart';
import 'local_widgets/upper_section.dart';

class OngoingOffersScreen extends StatelessWidget {
  final Map? data;
  OngoingOffersScreen({Key? key, this.data}) : super(key: key);

  final List<Map> fakeData = [
    {
      "name": 'Car Garage LLC',
      "location": 'Wadi Alkabeer',
      "description":
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam viverra...  varius. Cras sollicitudin ipsum sed leo ullamcorper lacinia. Praesent tempor nec risus nec fermentum. Integer tempor dictum dignissim. Nunc iaculis, eros ut suscipit scelerisque, tellus felis elementum velit, vitae egestas lacus eros id tortor. ',
      "isUsed": false,
      "price": 283.0
    },
    {
      "name": 'Car Garage LLC',
      "location": 'Wadi Alkabeer',
      "description":
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam viverra...  varius. Cras sollicitudin ipsum sed leo ullamcorper lacinia. Praesent tempor nec risus nec fermentum. Integer tempor dictum dignissim. Nunc iaculis, eros ut suscipit scelerisque, tellus felis elementum velit, vitae egestas lacus eros id tortor. ',
      "isUsed": true,
      "price": 240.0
    },
    {
      "name": 'Car Garage LLC',
      "location": 'Wadi Alkabeer',
      "description":
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam viverra...  varius. Cras sollicitudin ipsum sed leo ullamcorper lacinia. Praesent tempor nec risus nec fermentum. Integer tempor dictum dignissim. Nunc iaculis, eros ut suscipit scelerisque, tellus felis elementum velit, vitae egestas lacus eros id tortor. ',
      "isUsed": false,
      "price": 283.0
    },
    {
      "name": 'Car Garage LLC',
      "location": 'Wadi Alkabeer',
      "description":
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam viverra...  varius. Cras sollicitudin ipsum sed leo ullamcorper lacinia. Praesent tempor nec risus nec fermentum. Integer tempor dictum dignissim. Nunc iaculis, eros ut suscipit scelerisque, tellus felis elementum velit, vitae egestas lacus eros id tortor. ',
      "isUsed": false,
      "price": 283.0
    },
    {
      "name": 'Car Garage LLC',
      "location": 'Wadi Alkabeer',
      "description":
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam viverra...  varius. Cras sollicitudin ipsum sed leo ullamcorper lacinia. Praesent tempor nec risus nec fermentum. Integer tempor dictum dignissim. Nunc iaculis, eros ut suscipit scelerisque, tellus felis elementum velit, vitae egestas lacus eros id tortor. ',
      "isUsed": false,
      "price": 283.0
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          txt: 'Ongoing offers',
          fSize: 20,
          charSpacing: -0.48,
          boldness: FontWeight.w500,
        ),
        elevation: 3.0,
        backgroundColor: Palette.kDarkPurpleClr,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(KHeartIco),
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset(KShareIco),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(top: 100, bottom: 20),
            itemCount: fakeData.length,
            itemBuilder: (BuildContext context, int index) {
              return OngoingOfferCard(
                  data: OngoingOfferModel.fromJson(fakeData[index]));
            },
          ),
          UpperSection()
        ],
      ),
    );
  }
}

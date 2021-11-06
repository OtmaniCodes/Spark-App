import 'package:anas_cars/src/view/global_widgets/custom_place_holder.dart';
import 'package:anas_cars/src/view/screens/offers/local_widgets/part_card.dart';
import 'package:flutter/material.dart';

class OngoingTab extends StatelessWidget {
  const OngoingTab({Key? key}) : super(key: key);

  Future<List<Map>> getFakeData() async {
    // await Future.delayed(Duration(milliseconds: 400));
    return [
      {
        "partName": "Nissan altima 2019",
        "submitedQuotesCount": 0,
        "lowestPrice": null
      },
      {
        "partName": "Mazda 6 2020",
        "submitedQuotesCount": 14,
        "lowestPrice": 283
      },
      {
        "partName": "Nissan altima 2019",
        "submitedQuotesCount": 15,
        "lowestPrice": 243
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map>>(
      future: this.getFakeData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return (snapshot.data.isNotEmpty && snapshot.data != null)
              ? ListView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PartCard(data: snapshot.data[index]);
                  },
                )
              : MyPlaceHolder(
                  text:
                      "There are no ongoing quotes.\nRequest your first part right now!");
        } else if (snapshot.hasError) {
          print("ERRROR: ${snapshot.error}");
          return Text(snapshot.error.toString());
        }
        return Center(
            child: CircularProgressIndicator(color: const Color(0xffff9053)));
      },
    );
  }
}

import 'package:anas_cars/src/providers/app_sizing_provider.dart';
import 'package:flutter/material.dart';
import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:provider/provider.dart';
import './tabs/history.dart';
import './tabs/ongoing.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appSizingProv = Provider.of<AppSizingProv>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Offers"),
          leading: GestureDetector(
            onTap: () {
               !(appSizingProv.isDrwerMenuOpen)
                  ? appSizingProv.openDrawerMenu()
                  : appSizingProv.closeDrawerMenu();
            },
            child:appSizingProv.isDrwerMenuOpen ? Icon(Icons.arrow_back_ios): Image.asset(KMenu2Ico),
          ),
          backgroundColor: Palette.kDarkPurpleClr,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              width: double.infinity,
              child: TabBar(
                indicatorWeight: 2.0,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 4.0, color: Palette.kDarkOrangeClr,),
                    insets: EdgeInsets.symmetric(horizontal: 10.0)),
                // indicator: BoxDecoration(
          
                //   gradient: LinearGradient(
                //     colors: [Palette.kLightOrangeClr, Palette.kDarkOrangeClr],
                //   ),
                //   borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(10),
                //     topRight: Radius.circular(10),
                //   ),
                // ),
                isScrollable: true,
                tabs: [
                  Tab(
                    text: "Ongoing",
                  ),
                  Tab(
                    text: "History",
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [OngoingTab(), HistoryTab()],
        ),
      ),
    );
  }
}

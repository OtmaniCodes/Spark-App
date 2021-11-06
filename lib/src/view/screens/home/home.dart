import 'package:anas_cars/src/providers/app_sizing_provider.dart';
import 'package:anas_cars/src/providers/authtencation_provider.dart';
import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:provider/provider.dart';
import './local_widgets/order_car_card.dart';
import './local_widgets/favorite_car_card.dart';
import './local_widgets/cars_carousel.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appSizingProv = Provider.of<AppSizingProv>(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 3,
          pinned: true,
          leading: GestureDetector(
            onTap: () {
              !(appSizingProv.isDrwerMenuOpen)
                  ? appSizingProv.openDrawerMenu()
                  : appSizingProv.closeDrawerMenu();
            },
            child: appSizingProv.isDrwerMenuOpen
                ? Icon(Icons.arrow_back_ios)
                : Image.asset(KMenu2Ico),
          ),
          flexibleSpace: LayoutBuilder(builder: (context, constrains) {
            double top = constrains.biggest.height;
            return FlexibleSpaceBar(
              title: AnimatedOpacity(
                opacity: top >= 100 ? 0.0 : 1.0,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
                child: Text("Home"),
              ),
              background: CarsCarousel(),
            );
          }),
          expandedHeight: 226,
          backgroundColor: Palette.kDarkPurpleClr,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  MEDIUM_VSPACING,
                  OrderCarCard(),
                  const SizedBox(height: 20),
                  FavoriteCarCard(),
                  MEDIUM_VSPACING,
                  
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

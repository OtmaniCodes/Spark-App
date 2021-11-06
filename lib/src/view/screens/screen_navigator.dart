import 'package:anas_cars/src/drawer_configuration.dart';
import 'package:anas_cars/src/providers/app_sizing_provider.dart';
import 'package:anas_cars/src/providers/screen_index_provider.dart';
import 'package:anas_cars/src/view/global_widgets/custom_bottom_nav_bar.dart';
import 'package:anas_cars/src/view/screens/home/home.dart';
import 'package:anas_cars/src/view/screens/offers/offers.dart';
import 'package:anas_cars/src/view/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenNavigator extends StatelessWidget {
  ScreenNavigator({Key? key}) : super(key: key);
  final List<Widget> _screens = [HomeScreen(), OffersScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    final indexScreenProvider = Provider.of<ScreenIndexProv>(context);
    final appSizingProv = Provider.of<AppSizingProv>(context);
    return DrawerConfig(
      widget: WillPopScope(
        onWillPop: () {
          if (appSizingProv.isDrwerMenuOpen) {
            appSizingProv.closeDrawerMenu();
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: IndexedStack(
            index: indexScreenProvider.getScreenIndex,
            children: _screens,
          ),
          bottomNavigationBar: MyBottomNavBar(),
        ),
      ),
    );
  }
}

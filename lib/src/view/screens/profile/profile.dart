import 'package:anas_cars/src/providers/app_sizing_provider.dart';
import 'package:anas_cars/src/providers/authtencation_provider.dart';
import 'package:anas_cars/src/providers/screen_index_provider.dart';
import 'package:anas_cars/src/utils/constansts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  logout(authProvider, context) async {
    final indexScreenProvider =
        Provider.of<ScreenIndexProv>(context, listen: false);
    bool val = await authProvider.signOut();
    indexScreenProvider.setScreenIndex = 0;
    print("is signed out: $val");
  }

  @override
  Widget build(BuildContext context) {
    final appSizingProv = Provider.of<AppSizingProv>(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 3,
          pinned: true,
          actions: authProvider.getCurrentUser != null
              ? [
                  IconButton(
                    onPressed: () => logout(authProvider, context),
                    icon: Icon(Icons.logout),
                  )
                ]
              : null,
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
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Profile"),
          ),
          expandedHeight: 100,
          backgroundColor: Color(0xFF1C1E28),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ...List.generate(
              20,
              (index) => Container(
                  padding: const EdgeInsets.all(30),
                  alignment: Alignment.center,
                  child: Text("item $index")))
        ]))
      ],
    );
  }
}

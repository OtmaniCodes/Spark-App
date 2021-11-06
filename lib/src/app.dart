import 'package:anas_cars/src/providers/app_sizing_provider.dart';
import 'package:anas_cars/src/providers/authtencation_provider.dart';
import 'package:anas_cars/src/providers/screen_index_provider.dart';
import 'package:anas_cars/src/providers/theme_provider.dart';
import 'package:anas_cars/src/services/authentication/authentication_services.dart';
import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/routing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anas_cars/src/utils/service_locator.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProv()),
        ChangeNotifierProvider(create: (_) => ScreenIndexProv()),
        ChangeNotifierProvider(create: (_) => AppSizingProv()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          app<AuthServices>().checkUserAuthState(context);
          // AuthServices().checkUserAuthState(context);
          final themeProvider = Provider.of<ThemeProv>(context);
          return MaterialApp(
            title: KAppTitle,
            debugShowCheckedModeBanner: false,
            theme: themeProvider.getTheme,
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: "/",
          );
        },
      ),
    );
  }
}

import 'package:anas_cars/src/models/ongoing_offer.dart';
import 'package:anas_cars/src/view/screens/screens.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routeName = settings.name;
    final routeArgs = settings.arguments;
    late Widget screen;

    switch (routeName) {
      case "/":
        screen = OnBoardingScreen();
        break;
      case "/root":
        screen = RootScreen();
        break;
      case "/screenNavigator":
        screen = ScreenNavigator();
        break;
      case "/home":
        screen = HomeScreen();
        break;
      case "/creatAcount":
        screen = CreateAccountScreen();
        break;
      case "/login":
        screen = LoginScreen();
        break;
      case "/register":
        screen = RegisterScreen();
        break;
      case "/orderPricing":
        screen = OrderPricingScreen();
        break;
      case "/carPartPricing":
        screen = CarPartPricingScreen();
        break;
      case "/offers":
        screen = OffersScreen();
        break;
      case "/ongoingOffers":
        Map offersFakeData = routeArgs as Map;
        screen = OngoingOffersScreen(data: offersFakeData);
        break;
      case "/ongoingQuotes":
        OngoingOfferModel quotesFakeData = routeArgs as OngoingOfferModel;
        screen = OngoingQuotesScreen(data: quotesFakeData);
        break;
      case "/profileScreen":
        screen = ProfileScreen();
        break;
      default:
        screen = ErrorScreen();
    }
    return PageRouteBuilder<void>(
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return screen;
      },
      settings: RouteSettings(name: routeName, arguments: routeArgs),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("no such screen is available"),
        ),
      ),
    );
  }
}

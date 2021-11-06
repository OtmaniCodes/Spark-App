import 'package:anas_cars/src/providers/authtencation_provider.dart';
import 'package:anas_cars/src/services/authentication/authentication_state.dart';
import 'package:anas_cars/src/view/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.getAuthState) {
      case AuthState.SIGNEDIN:
        return ScreenNavigator();
      case AuthState.SIGNEDOUT:
        return CreateAccountScreen();
    }
  }
}

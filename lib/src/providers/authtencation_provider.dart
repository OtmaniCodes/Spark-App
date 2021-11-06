import 'package:anas_cars/src/services/authentication/authentication_services.dart';
import 'package:anas_cars/src/services/authentication/authentication_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final AuthServices _authServices = AuthServices();
  AuthState _authState = AuthState.SIGNEDOUT;
  User? _currentUser;

  //getters
  AuthState get getAuthState => _authState;
  User? get getCurrentUser => _currentUser;

  //setters
  set setAuthState(AuthState val) {
    _authState = val;
    notifyListeners();
  }
  set setCurrentUser(User? val){
    _currentUser = val;
    notifyListeners();
  }

  //functions
  Future<bool> signIn({required String email, required String password}) async {
    bool retVal;
    String result = await _authServices.signInWithEmailAndPassword(email, password);
    if (result == "success") {
      retVal = true;
    } else {
      retVal = false;
    }
    return retVal;
  }

   Future<bool> signUp({required String email, required String password}) async {
    bool retVal;
    String result = await _authServices.signUpWithEmailAndPassword(email, password);
    if (result == "success") {
      retVal = true;
    } else {
      retVal = false;
    }
    return retVal;
  }

  Future<bool> signOut() async {
    bool retVal;
    String result = await _authServices.signOut();
    if (result == "success") {
      retVal = true;
    } else {
      retVal = false;
    }
    return retVal;
  }
}

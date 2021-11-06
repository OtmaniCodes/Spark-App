import 'package:anas_cars/src/providers/authtencation_provider.dart';
import 'package:anas_cars/src/services/authentication/authentication_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void checkUserAuthState(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    _auth.authStateChanges().listen(
      (User? user) {
        print("user is $user");
        if (user == null) {
          authProvider.setAuthState = AuthState.SIGNEDOUT;
        } else {
          authProvider.setAuthState = AuthState.SIGNEDIN;
        }
        authProvider.setCurrentUser = user;
      },
    );
  }

  void _forceReload() {
    _auth.currentUser!.reload();
  }

  signInWithEmailAndPassword(String email, String password) async {
    String retVal = "error";
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      retVal = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print("unknown error: $e");
    }
    return retVal;
  }

  signUpWithEmailAndPassword(String email, String password) async {
    String retVal = "error";
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      retVal = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print("unknown error: $e");
    }
    return retVal;
  }

  signOut() async {
    String retVal = "error";
    try {
      await _auth.signOut();
      // _forceReload();
      retVal = "success";
    } catch (e) {
      print("unknown error: $e");
    }
    return retVal;
  }
}

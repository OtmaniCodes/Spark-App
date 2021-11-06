import 'package:flutter/cupertino.dart';

class ScreenIndexProv with ChangeNotifier{
  int _index = 0;

  //getters
  int get getScreenIndex => _index;

  //setters
  set setScreenIndex(int val){
    _index = val;
    notifyListeners();
  }
}
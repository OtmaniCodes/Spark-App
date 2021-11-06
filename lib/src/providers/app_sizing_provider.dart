import 'package:flutter/cupertino.dart';

class AppSizingProv with ChangeNotifier{
  double _xOffSet = 0;
  double _yOffSet = 0;
  double _scaleFactor = 1.0;
  bool _isOpen = false;

  //getters
  double get getXoffSet => _xOffSet;
  double get getYoffSet => _yOffSet;
  double get getScaleFactor => _scaleFactor;
  bool get isDrwerMenuOpen => _isOpen;

  openDrawerMenu(){
    _xOffSet = 300;
    _yOffSet = 65;
    _scaleFactor = 0.8;
    _isOpen = true;
    notifyListeners();
  }

   closeDrawerMenu(){
    _xOffSet = 0;
    _yOffSet = 0;
    _scaleFactor = 1.0;
    _isOpen = false;
    notifyListeners();
  }
}
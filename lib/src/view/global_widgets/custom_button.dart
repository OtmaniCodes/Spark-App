import 'package:anas_cars/src/utils/constansts.dart';
import 'package:anas_cars/src/utils/palette.dart';
import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final Alignment gradientStart;
  final Alignment gradientEnd;
  final List<double>? gradientStops;
  final List<Color> gradientColors;
  final List<BoxShadow>? buttonShadow;
  final bool applyRadius;
  final Widget kiddo;
  final VoidCallback onPressed;
  const MyCustomButton({
    Key? key,
    
    this.gradientStart = Alignment.centerLeft,
    this.gradientEnd = Alignment.centerRight,
    this.applyRadius = true,
    this.buttonShadow,
    this.gradientStops,
    required this.gradientColors,
    required this.kiddo,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:  applyRadius ? BorderRadius.circular(10.0) : null,
          gradient: LinearGradient(
            begin: this.gradientStart,
            end: this.gradientEnd,
            colors: this.gradientColors,
            stops: this.gradientStops,
          ),
          boxShadow: this.buttonShadow),
      child: Material(
        color: Palette.kTransparentClr,
        child: InkWell(
          onTap: this.onPressed,
          borderRadius: applyRadius ? BorderRadius.circular(10.0) : null,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 58,
            alignment: Alignment.center,
            child: this.kiddo,
          ),
        ),
      ),
    );
  }
}

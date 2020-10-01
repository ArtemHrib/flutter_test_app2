import 'package:flutter/material.dart';

class Hero {
  final String _mainHeroText;
  final Icon _heroAnimationIcon;
  List<Widget> heroWidgetList;
  final double _animationLeftPadding;

  Hero(this._mainHeroText, this._heroAnimationIcon, this.heroWidgetList,
      this._animationLeftPadding);

  Icon get heroAnimationIcon => _heroAnimationIcon;

  String get mainHeroText => _mainHeroText;

  double get animationLeftPadding => _animationLeftPadding;
}

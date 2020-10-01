import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/entity/Hero.dart' as hero;

class AnimationWidget extends StatefulWidget {
  final Function _functionForAnimationKilling;
  final hero.Hero _heroForAnimation;

  const AnimationWidget(
      this._functionForAnimationKilling, this._heroForAnimation);

  @override
  State<StatefulWidget> createState() {
    return _AnimationWidgetState(
        _functionForAnimationKilling, _heroForAnimation);
  }
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  final double leftIconPadding;
  final hero.Hero heroForAnimation;
  Animation<double> _animationY;
  AnimationController _controllerY;
  Function _function;

  _AnimationWidgetState(this._function, this.heroForAnimation)
      : leftIconPadding = Random().nextInt(80).toDouble() + heroForAnimation.animationLeftPadding;

  @override
  void dispose() {
    _controllerY.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controllerY = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    CurvedAnimation curvedAnimation =
        new CurvedAnimation(parent: _controllerY, curve: Curves.linear);
    Tween myTween = new Tween<double>(begin: 0, end: 10);
    _animationY = myTween.animate(curvedAnimation);
    _animationY.addListener(() {
      setState(() {});
    });
    _animationY.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _function.call();
      }
    });
    _controllerY.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 50 - _animationY.value * 5,
        left: leftIconPadding,
      ),
      child: Opacity(
        opacity: 1 - _animationY.value / 10,
        child: heroForAnimation.heroAnimationIcon,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/DartApp/Dart/flutter_app_test/lib/components/HeroContent.dart';
import 'package:flutter_app_test/entity/Hero.dart' as hero;
import 'components/AnimationWidget.dart';

class MyApp extends StatefulWidget {
  final List<hero.Hero> _heroList = getHeroList();

  @override
  createState() {
    return _MyAppState(_heroList);
  }
}

class _MyAppState extends State<MyApp> {
  final List<hero.Hero> _heroList;
  int _pageIndex = 0;
  hero.Hero _currentHero;

  _MyAppState(this._heroList) {
    _currentHero = _heroList[_pageIndex];
  }

  void addHeroAnimation() {
    setState(() {
      _currentHero.heroWidgetList
          .add(AnimationWidget(killAnimationWidgetFromList, _currentHero));
    });
  }

  void killAnimationWidgetFromList() {
    setState(() {
      _currentHero.heroWidgetList.removeAt(1);
    });
  }

  void killAllAnimationWidgetFromList() {
    var heroWidgetList = _currentHero.heroWidgetList;
    _currentHero.heroWidgetList = heroWidgetList.sublist(0, 1);
  }

  void changePage(int pageIndex) {
    setState(() {
      killAllAnimationWidgetFromList();
      _pageIndex = pageIndex;
      _currentHero = _heroList[_pageIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Key("materialApp"),
      home: Scaffold(
        key: Key("scaffold"),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 120, 109, 1),
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.teal,
          child: HeroContent(
              _currentHero.heroWidgetList, _currentHero.mainHeroText),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(0, 50, 50, 1),
          child: Text(
            "Hi",
            style: TextStyle(
              color: Colors.teal,
              fontSize: 19,
            ),
          ),
          onPressed: addHeroAnimation,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: changePage,
          currentIndex: _pageIndex,
          backgroundColor: Color.fromRGBO(0, 50, 50, 1),
          items: [
            BottomNavigationBarItem(
              title: Container(
                width: 0,
                height: 0,
              ),
              icon: Image.asset("assets/images/greenEyesManIcon.png"),
            ),
            BottomNavigationBarItem(
              title: Container(
                width: 0,
                height: 0,
              ),
              icon: Image.asset("assets/images/knightManIcon.png"),
            ),
          ],
        ),
      ),
    );
  }
}

List<hero.Hero> getHeroList() {
  return [
    hero.Hero(
      "Hi, I'm Paul!",
      Icon(
        Icons.favorite,
        size: 40.0,
        color: Colors.red,
      ),
      [
        Padding(
          padding: EdgeInsets.only(top: 70),
          child: Image(
            image: AssetImage("assets/images/greenEyesMan.png"),
          ),
        ),
      ],
      0,
    ),
    hero.Hero(
      "Hey, you. You're finally awake.",
      Icon(
        Icons.gavel,
        size: 40.0,
        color: Colors.black,
      ),
      [
        Padding(
          padding: EdgeInsets.only(top: 90, right: 30),
          child: Image(
            image: AssetImage("assets/images/knightMan.png"),
          ),
        ),
      ],
      60,
    )
  ];
}

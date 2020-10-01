import 'package:flutter/cupertino.dart';

import 'MainHeroTextWidget.dart';

class HeroContent extends StatelessWidget {
  final List<Widget> contentWidgetList;
  final String heroMainText;

  HeroContent(this.contentWidgetList, this.heroMainText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Container(
            height: 270,
            child: Stack(
              children: contentWidgetList,
            ),
          ),
          MainHeroTextWidget(heroMainText),
        ],
      ),
    );
  }
}

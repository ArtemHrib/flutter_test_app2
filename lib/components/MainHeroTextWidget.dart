import 'package:flutter/cupertino.dart';

class MainHeroTextWidget extends StatelessWidget {
  final String _widgetText;

  const MainHeroTextWidget(this._widgetText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Text(
        _widgetText,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../constant/const.dart';

class HeadingTexts extends StatelessWidget {

  HeadingTexts({required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(text, style: KHomePageHeading),
        ],
      ),
    );
  }
}
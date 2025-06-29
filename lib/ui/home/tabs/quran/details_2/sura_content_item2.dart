import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraContentItem2 extends StatelessWidget {
  String suraContent;

  SuraContentItem2({super.key, required this.suraContent});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Text(
      '$suraContent',
      style: AppStyles.bold20primary,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }
}

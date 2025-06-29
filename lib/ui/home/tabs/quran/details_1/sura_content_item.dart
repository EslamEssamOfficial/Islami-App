import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraContentItem extends StatelessWidget {
  String suraContent;
  int index;

  SuraContentItem({super.key, required this.suraContent, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColor.primaryColor, width: 2),
      ),
      child: Text(
        '$suraContent [${index + 1}]',
        style: AppStyles.bold20primary,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }
}

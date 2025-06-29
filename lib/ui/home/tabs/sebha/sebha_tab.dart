import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 1;
  int index = 0;
  List<String> repeat = [
    "الله أكبر",
    "لا إله إلا الله",
    "الحمد لله",
    "سبحان الله",
  ];

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Image.asset(AppAssets.sebhaBg),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
              style: AppStyles.bold36white,
              textAlign: TextAlign.center,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    count++;
                    if (count == 34) {
                      count = 1;
                      index++;
                    }
                    if (index == repeat.length) {
                      index = 0;
                    }
                    setState(() {});
                  },
                  child: Column(
                    children: [
                      Image.asset(AppAssets.sebhaHead),
                      RotationTransition(
                        turns: AlwaysStoppedAnimation(count / 20),
                        child: Image.asset(AppAssets.sebhaBody),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: hieght * 0.15),
                    Text(repeat[index], style: AppStyles.bold36white),
                    SizedBox(height: hieght * 0.04),
                    Text('$count', style: AppStyles.bold36white),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

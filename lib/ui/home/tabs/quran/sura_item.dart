import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../../../utils/app_assets.dart';

class SuraItem extends StatelessWidget {
  int index;

  SuraItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.suraItem),
            Text('${index + 1}', style: AppStyles.bold16white),
          ],
        ),
        SizedBox(width: width * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResources.englishQuranSuras[index],
              style: AppStyles.bold16white.copyWith(fontSize: 20),
            ),
            Text(
              QuranResources.ayaNumbers[index],
              style: AppStyles.bold16white.copyWith(fontSize: 14),
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranResources.arabicQuranSuras[index],
          style: AppStyles.bold16white.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}

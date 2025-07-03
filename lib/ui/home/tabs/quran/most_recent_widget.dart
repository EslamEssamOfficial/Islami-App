import 'package:flutter/material.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/shared_prefs.dart';

class Mostrecentwidget extends StatefulWidget {
  Mostrecentwidget({super.key});

  @override
  State<Mostrecentwidget> createState() => _MostrecentwidgetState();
}

class _MostrecentwidgetState extends State<Mostrecentwidget> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mostRecentProvider.getMostRecentSuraList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently', style: AppStyles.bold16white),
          SizedBox(height: height * 0.01),
          SizedBox(
            height: height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: height * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.primaryColor,
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            QuranResources.englishQuranSuras[mostRecentProvider
                                .mostRecentList[index]],
                            style: AppStyles.bold24black,
                          ),
                          Text(
                            QuranResources.arabicQuranSuras[mostRecentProvider
                                .mostRecentList[index]],
                            style: AppStyles.bold24black,
                          ),
                          Text(
                            "${QuranResources.ayaNumbers[mostRecentProvider.mostRecentList[index]]} Verses",
                            style: AppStyles.bold14black,
                          ),
                        ],
                      ),
                      Image.asset(AppAssets.mostRecently),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.02);
              },
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
          SizedBox(height: height * 0.01),
        ],
      ),
    );
  }
}

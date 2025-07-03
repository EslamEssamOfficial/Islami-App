import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/quran/details_2/sura_content_item2.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/most_recent_provider.dart';

class SuraDetailsScreen2 extends StatefulWidget {
  static const String routeName = 'SuraDetailsScreen2';

  const SuraDetailsScreen2({super.key});

  @override
  State<SuraDetailsScreen2> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen2> {
  String suraContent = '';
  late MostRecentProvider mostRecentProvider;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.getMostRecentSuraList();
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    if (suraContent.isEmpty) {
      loadSuraFile(index);
    }
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text(QuranResources.englishQuranSuras[index])),
      body: Container(
        color: AppColor.blackBgColor,
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.cornerLeft),
                Text(
                  QuranResources.arabicQuranSuras[index],
                  style: AppStyles.bold24primary,
                ),
                Image.asset(AppAssets.cornerRight),
              ],
            ),
            Expanded(
              child:
                  suraContent.isEmpty
                      ? Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      )
                      : SingleChildScrollView(
                        child: SuraContentItem2(suraContent: suraContent),
                      ),
            ),
            Image.asset(AppAssets.mosqueImage),
          ],
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += ' [${i + 1}] ';
    }
    suraContent = lines.join();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
  }
}

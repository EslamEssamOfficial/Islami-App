import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/quran/details_1/sura_content_item.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'SuraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
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
                  verses.isEmpty
                      ? Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      )
                      : ListView.separated(
                        itemBuilder: (context, index) {
                          return SuraContentItem(
                            suraContent: verses[index],
                            index: index,
                          );
                        },
                        itemCount: verses.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: height * 0.02);
                        },
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
    verses = lines;
    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
  }
}

import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/details_1/sura_details_screen1.dart';
import 'package:islami_app/ui/home/tabs/quran/details_2/sura_details_screen2.dart';
import 'package:islami_app/ui/home/tabs/quran/most_recent_widget.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_item.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/shared_prefs.dart';
import 'package:toggle_switch/toggle_switch.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  int? selection = 0;
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            cursorColor: AppColor.primaryColor,
            style: TextStyle(color: AppColor.whiteColor),
            onChanged: (newText) {
              searchByNewText(newText);
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: AppColor.primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: AppColor.primaryColor),
              ),
              prefixIcon: Image.asset(AppAssets.iconSearch),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16white,
            ),
          ),
          SizedBox(height: height * 0.02),
          Mostrecentwidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sura View', style: AppStyles.bold16white),
              ToggleSwitch(
                initialLabelIndex: 0,
                cornerRadius: 10.0,
                activeFgColor: AppColor.primaryColor,
                activeBgColor: [AppColor.blackColor],
                inactiveFgColor: AppColor.grayColor,
                totalSwitches: 2,
                icons: [Icons.menu_book_rounded, Icons.menu],
                iconSize: 30.0,
                onToggle: (toggle) {
                  selection = toggle;
                },
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    saveNewSuraList(filterList[index]);
                    selection == 0
                        ? Navigator.of(context).pushNamed(
                          SuraDetailsScreen2.routeName,
                          arguments: filterList[index],
                        )
                        : Navigator.of(context).pushNamed(
                          SuraDetailsScreen1.routeName,
                          arguments: filterList[index],
                        );
                  },
                  child: SuraItem(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  indent: width * 0.10,
                  endIndent: width * 0.10,
                  thickness: 2,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  void searchByNewText(String textSearch) {
    List<int> filterSearchList = [];
    if (textSearch.isEmpty) {
      filterList = List.generate(114, (index) => index);
      setState(() {});
    } else {
      for (int i = 0; i < QuranResources.englishQuranSuras.length; i++) {
        if (QuranResources.englishQuranSuras[i].toUpperCase().contains(
          textSearch.toUpperCase(),
        )) {
          filterSearchList.add(i);
        }
        if (QuranResources.arabicQuranSuras[i].contains(textSearch)) {
          filterSearchList.add(i);
        }
      }
      filterList = filterSearchList;
      setState(() {});
    }
  }
}

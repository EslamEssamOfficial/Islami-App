import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadith/hadith_tab.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/home/tabs/time/time_tab.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadithBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            backgroundImages[selectedIndex],
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.logoBG),
                Expanded(child: tabs[selectedIndex])
              ],
            ),
            bottomNavigationBar: Theme(
              data: Theme.of(
                context,
              ).copyWith(canvasColor: AppColor.primaryColor),
              child: BottomNavigationBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                currentIndex: selectedIndex,
                // type: BottomNavigationBarType.fixed,
                // backgroundColor: AppColor.primaryColor,
                items: [
                  BottomNavigationBarItem(
                    icon: builtButtonNavigationBar(
                      index: 0,
                      imageName: AppAssets.iconQuran,
                    ),
                    label: 'Quran',
                  ),
                  BottomNavigationBarItem(
                    icon: builtButtonNavigationBar(
                      index: 1,
                      imageName: AppAssets.iconHadith,
                    ),
                    label: 'Hadith',
                  ),
                  BottomNavigationBarItem(
                    icon: builtButtonNavigationBar(
                      index: 2,
                      imageName: AppAssets.iconSebha,
                    ),
                    label: 'Sebha',
                  ),
                  BottomNavigationBarItem(
                    icon: builtButtonNavigationBar(
                      index: 3,
                      imageName: AppAssets.iconRadio,
                    ),
                    label: 'Radio',
                  ),
                  BottomNavigationBarItem(
                    icon: builtButtonNavigationBar(
                      index: 4,
                      imageName: AppAssets.iconTime,
                    ),
                    label: 'Time',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget builtButtonNavigationBar({required int index, required imageName}) {
    return selectedIndex == index
        ? Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66),
        color: AppColor.blackBgColor,
      ),
      child: ImageIcon(AssetImage((imageName))),
    )
        : ImageIcon(AssetImage((imageName)));
  }

}

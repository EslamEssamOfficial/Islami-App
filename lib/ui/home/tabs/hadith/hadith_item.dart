import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeeth.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class HadithItem extends StatefulWidget {
  int index;

  HadithItem({super.key, required this.index});

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  Hadeeth? hadeeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadithFile(index: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.primaryColor,
        image: DecorationImage(image: AssetImage(AppAssets.hadithItemcBgCard)),
      ),
      child:
          hadeeth == null
              ? Center(
                child: CircularProgressIndicator(color: AppColor.blackColor),
              )
              : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppAssets.hadithItemCornerLeft,
                        width: size.width * 0.15,
                      ),
                      Expanded(
                        child: Text(
                          hadeeth?.title ?? '',
                          style: AppStyles.bold24black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Image.asset(
                        AppAssets.hadithItemCornerRight,
                        width: size.width * 0.15,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        hadeeth?.content ?? '',
                        style: AppStyles.bold16black,
                      ),
                    ),
                  ),
                  Image.asset(AppAssets.hadithItemMosque),
                ],
              ),
    );
  }

  void loadHadithFile({required int index}) async {
    String hadeethContent = await rootBundle.loadString(
      'assets/files/Hadeeth/h$index.txt',
    );
    int fileLinesIndex = hadeethContent.indexOf('\n');
    String title = hadeethContent.substring(0, fileLinesIndex);
    String content = hadeethContent.substring(fileLinesIndex + 1);
    hadeeth = Hadeeth(title: title, content: content);
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {});
  }
}

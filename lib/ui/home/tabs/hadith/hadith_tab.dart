import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadith/hadith_item.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.03),
      child: CarouselSlider(
        options: CarouselOptions(
            height: size.height * 0.60, enlargeCenterPage: true),
        items:
        List.generate(50, (index) => index + 1).map((i) {
          return HadithItem(index: i);
        }).toList(),
      ),
    );
  }
}

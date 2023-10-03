import 'package:Layout_Flutter/Pages/details_group.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class groupData extends StatelessWidget {
  const groupData({super.key});
  void _showImageInfo(BuildContext context, int itemIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return detailsGroup(itemIndex, context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: 3,
          options: CarouselOptions(
            height: 250,
            aspectRatio: 16 / 9,
            viewportFraction: 0.55,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return GestureDetector(
              onTap: () {
                _showImageInfo(context, itemIndex);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 150,
                  width: 200,
                  child: itemIndex == 0
                      ? Image.asset(
                          'assets/images/yusril.jpg',
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        )
                      : itemIndex == 1
                          ? Image.asset(
                              'assets/images/daffa.jpg',
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            )
                          : Image.asset(
                              'assets/images/3.jpg',
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                ),
              ),
            );
          }),
    );
  }
}

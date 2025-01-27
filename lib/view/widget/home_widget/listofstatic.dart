import 'package:carousel_slider/carousel_slider.dart';
import 'package:droptaxi/service/responsive_service.dart';
import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/util/image_util.dart';
import 'package:flutter/material.dart';

class ListofStaticImage extends StatelessWidget {
  const ListofStaticImage({super.key});

  @override
  Widget build(BuildContext context) {
    List image = ImageUtil.dumyList;
    return ResponsiveService.isRealMobel(context)
        ? CarouselSlider(
            items: image
                .map((e) => Image.asset(e, color: ColorConstant.thirdColor))
                .toList(),
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              disableCenter: true,
              viewportFraction: 0.6,
            ))
        : ResponsiveService.isMobel(context)
            ? CarouselSlider(
                items: image
                    .map((e) => Image.asset(e, color: ColorConstant.thirdColor))
                    .toList(),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  disableCenter: true,
                  viewportFraction: 0.4,
                ))
            : ResponsiveService.isTablet(context)
                ? CarouselSlider(
                    items: image
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(e,
                                  height: 200,
                                  width: 200,
                                  color: ColorConstant.thirdColor),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 200,
                      viewportFraction: 0.2,
                    ))
                : SizedBox(
                    height: 180,
                    child: ListView.separated(
                      itemBuilder: (context, index) => Image.asset(image[index],
                          color: ColorConstant.thirdColor),
                      itemCount: image.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../Component/main_header.dart';
import '../../controller/controllers.dart';
import 'components/carousel_slider/carousel_loading.dart';
import 'components/carousel_slider/carousel_slider_view.dart';
import 'components/popular_category/popular_category.dart';
import 'components/popular_category/popular_category_loading.dart';
import 'components/popular_product/popular_product.dart';
import 'components/popular_product/popular_product_loading.dart';
import 'components/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Column(
        children: [
        const MainHeader(),
        Expanded(
        child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
         child: Column(
         children: [
        Obx(() {
          if (homeController.bannerList.isNotEmpty) {
            return CarouselSliderView(
             bannerList: homeController.bannerList);
          } else {
            return  const CarouselLoading();
          }
        }),
        const SectionTitle(title: "Popular Category"),
        Obx(() {
          if (homeController.popularCategoryList.isNotEmpty) {
            return  PopularCategory(
                categories: homeController.popularCategoryList);
                //categories: homeController.popularCategoryList);
          } else {
            return const PopularCategoryLoading();
          }
        }),
        const SectionTitle(title: "Popular Product"),
        Obx(() {
          if (homeController.popularProductList.isNotEmpty) {
            return PopularProduct(
                popularProducts: homeController.popularProductList);
          } else {
            return const PopularProductLoading();
          }
        }),
      ],
        )
        )
        )
        ]
    ));
  }
}

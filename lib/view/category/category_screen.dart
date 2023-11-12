import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controllers.dart';
import 'components/category_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categoryController.categoryList.isNotEmpty) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: categoryController.categoryList.length,
          itemBuilder: (context, index) =>
              CategoryCard(category: categoryController.categoryList[index]),
        );
      } else {
        return Container();
      }
    });
  }
}

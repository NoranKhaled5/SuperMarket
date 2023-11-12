import 'package:ecomerceapi/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import '../controller/controllers.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 10)
      ]),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              child: Container(
            child:TextField(
                  autofocus: false,
                 controller: productController.searchTextEditController,
                  onSubmitted: (val) {
                    productController.getProductByName(keyword: val);
                   dashboardController.updateIndex(1);
                  },
                  onChanged: (val) {
                    productController.searchVal.value = val;
                  },
                  decoration: InputDecoration(
                     suffixIcon: productController.searchVal.value.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                productController.searchTextEditController
                                    .clear();
                                productController.searchVal.value = '';
                                productController.getProducts();
                              },
                            )
                          : null,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 16),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none),
                      hintText: "Search...",
                      prefixIcon: const Icon(Icons.search)),
                )),
          ),
          const SizedBox(width: 10),
          Container(
            height: 46,
            width: 46,
             decoration: BoxDecoration(
                 color: Colors.white,
                shape: BoxShape.circle,
                 boxShadow: <BoxShadow>[
                   BoxShadow(color: Colors.grey.withOpacity(0.6), blurRadius: 8)
                 ]),
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.filter_alt_outlined,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 10),
          // InkWell(
          //   onTap: (){
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //            builder: (context) => const CartScreen()));
            // },

        // Badge(
        //  showBadge: true,
        //  badgeContent:  const Text('1', style: TextStyle(color: Colors.white),),
        //  badgeColor:Theme.of(context).primaryColor,
        //   animationType:BadgeAnimationType.slide,
                 Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.6), blurRadius: 8)
                      ]),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.grey,
                  ),
                ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}

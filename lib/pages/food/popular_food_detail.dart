import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimentions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //find instance of popular product controller.
    PopularProductController popularProductC =
        Get.find<PopularProductController>();

    //get popular product list from controller
    var product = popularProductC.popularProductList[pageId];

    //call init method from controller
    popularProductC.initProduct(Get.find<CartController>());
    //print("product name is " + product.name.toString());

    return Scaffold(
      //backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                  width: double.maxFinite,
                  height: Dimentions.popularFoodImgSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(AppConstants.BASE_URL +
                              AppConstants.UPLOAD_URL +
                              product.img!))))),
          //icon widgets
          Positioned(
              top: Dimentions.height45,
              left: Dimentions.width20,
              right: Dimentions.width20,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child: AppIcon(
                        icon: Icons.arrow_back_ios,
                        iconSize: Dimentions.iconSize16,
                      ),
                    ),
                    AppIcon(
                        icon: Icons.shopping_cart_outlined,
                        iconSize: Dimentions.iconSize16),
                  ])),
          //introduction to food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimentions.popularFoodImgSize - 20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimentions.width20,
                      right: Dimentions.width20,
                      top: Dimentions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimentions.radius20),
                        topRight: Radius.circular(Dimentions.radius20),
                      ),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        text: product.name,
                      ),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      BigText(text: "Introduce"),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableText(text: product.description),
                        ),
                      ),
                    ],
                  ))),
        ],
      ),

      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
            height: Dimentions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimentions.height30,
                bottom: Dimentions.height30,
                left: Dimentions.width20,
                right: Dimentions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimentions.radius20 * 2),
                  topRight: Radius.circular(Dimentions.radius20 * 2),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimentions.height20,
                    bottom: Dimentions.height20,
                    right: Dimentions.width20,
                    left: Dimentions.width20,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radius20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimentions.width10,
                      ),
                      BigText(text: popularProduct.quantity.toString()),
                      SizedBox(
                        width: Dimentions.width10,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: Dimentions.height20,
                    bottom: Dimentions.height20,
                    right: Dimentions.width20,
                    left: Dimentions.width20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimentions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      popularProductC.addItem(product);
                    },
                    child: BigText(
                      text: "\$ ${product.price!} | Add to cart",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

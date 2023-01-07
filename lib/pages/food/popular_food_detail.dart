import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimentions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                  width: double.maxFinite,
                  height: Dimentions.popularFoodImgSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/image/food0.png"))))),
          Positioned(
              top: Dimentions.height45,
              left: Dimentions.width20,
              right: Dimentions.width20,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconSize: Dimentions.iconSize16,
                    ),
                    AppIcon(
                        icon: Icons.shopping_cart_outlined,
                        iconSize: Dimentions.iconSize16),
                  ])),
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
                        text: "Chinese Side",
                      ),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      BigText(text: "Introduce"),
                    ],
                  ))),
        ],
      ),
      bottomNavigationBar: Container(
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
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimentions.width10,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimentions.width10,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
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
              child: BigText(
                text: "\$10 | Add to cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

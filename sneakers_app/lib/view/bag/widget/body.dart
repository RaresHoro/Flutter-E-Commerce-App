// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sneakers_app/theme/custom_app_theme.dart';

import 'package:sneakers_app/view/checkout/checkout.dart';
import '../../../../utils/app_methods.dart';
import '../../../animation/fadeanimation.dart';
import '../../../utils/constants.dart';
import '../../../view/bag/widget/empty_list.dart';
import '../../../data/dt.dart';
import '../../../models/models.dart';

class BodyBagView extends StatefulWidget {
  const BodyBagView({Key? key}) : super(key: key);

  @override
  _BodyBagViewState createState() => _BodyBagViewState();
}

class _BodyBagViewState extends State<BodyBagView>
    with SingleTickerProviderStateMixin {
  Map<ShoeModel, int> quantities = {};

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: width,
      height: height,
      child: Column(
        children: [
          topText(width, height),
          Divider(
            color: Colors.grey,
          ),
          itemsOnBag.isEmpty
              ? EmptyList()
              : Column(children: [
                  mainListView(width, height),
                  SizedBox(
                    height: 12,
                  ),
                  bottomInfo(context, width, height),
                ])
        ],
      ),
    );
  }

  topText(width, height) {
    return Container(
      width: width,
      height: height / 14,
      child: FadeAnimation(
        delay: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("My Bag", style: AppThemes.bagTitle),
            Text(
              "Total ${quantities.length} Items",
              style: AppThemes.bagTotalPrice,
            ),
          ],
        ),
      ),
    );
  }

  materialButton(BuildContext context, width, height) {
    return FadeAnimation(
      delay: 3,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minWidth: width / 1.2,
        height: height / 15,
        color: AppConstantsColor.materialButtonColor,
        onPressed: () {
          // Navigate to the checkout page when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutPage(
                itemsInBag: itemsOnBag,
                quantities: quantities,
                onOrderPlaced: () {
                  // Clear the bag after the order is placed
                  setState(() {
                    itemsOnBag.clear();
                    quantities.clear();
                  });
                },
              ),
            ),
          );
        },
        child: Text(
          "NEXT",
          style: TextStyle(color: AppConstantsColor.lightTextColor),
        ),
      ),
    );
  }

  mainListView(width, height) {
    return Container(
      width: width,
      height: height / 1.6,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: itemsOnBag.length,
        itemBuilder: (ctx, index) {
          ShoeModel currentBagItem = itemsOnBag[index];
          int quantity = quantities[currentBagItem] ?? 1;

          return FadeAnimation(
            delay: 1.5 * index / 4,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 1),
              width: width,
              height: height / 5.2,
              child: Row(
                children: [
                  Container(
                    width: width / 2.8,
                    height: height / 5.7,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 20,
                          left: 10,
                          child: Container(
                            width: width / 3.6,
                            height: height / 7.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey[350],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          bottom: 15,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(-40 / 360),
                            child: Container(
                              width: 140,
                              height: 140,
                              child: Image(
                                image: AssetImage(
                                  currentBagItem.imgAddress,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(currentBagItem.model,
                            style: AppThemes.bagProductModel),
                        SizedBox(
                          height: 4,
                        ),
                        Text("\$${currentBagItem.price}",
                            style: AppThemes.bagProductPrice),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (quantity > 1) {
                                    quantity--;
                                    quantities[currentBagItem] = quantity;
                                  }
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(quantity.toString(),
                                style: AppThemes.bagProductNumOfShoe),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                  quantities[currentBagItem] = quantity;
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bottomInfo(BuildContext context, width, height) {
    double totalSum = AppMethods.sumOfItemsOnBag(quantities);

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: width,
      height: height / 7,
      child: Column(
        children: [
          FadeAnimation(
            delay: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("TOTAL", style: AppThemes.bagTotalPrice),
                Text("\$$totalSum", style: AppThemes.bagSumOfItemOnBag),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          materialButton(context, width, height)
        ],
      ),
    );
  }
}

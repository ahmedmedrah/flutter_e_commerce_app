import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/viewmodel/auth_view_model.dart';
import 'package:e_commerce_app/core/viewmodel/control_view_model.dart';
import 'package:e_commerce_app/core/viewmodel/home_view_model.dart';
import 'package:e_commerce_app/view/authentication/login_view.dart';
import 'package:e_commerce_app/view/cart_view.dart';
import 'package:e_commerce_app/view/details_view.dart';
import 'package:e_commerce_app/view/widget/custom_cached_image.dart';
import 'package:e_commerce_app/view/widget/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final List<String> l = ['s', 's', 's', 's', 's'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (ctrl) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              children: [
                _buildSearchFormField(),
                SizedBox(height: 30),
                CustomText(
                  text: 'Category',
                ),
                SizedBox(height: 20),
                _buildListViewCategory(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Best Selling',
                      fontSize: 18,
                    ),
                    CustomText(
                      text: 'See All',
                      fontSize: 16,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _buildListViewProducts(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (ctrl) => Container(
        height: 110,
        child: ListView.separated(
          itemCount: ctrl.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomCachedImage(
                      imgUrl: ctrl.categories[index].imgUrl,
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomText(text: ctrl.categories[index].name),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(width: 20),
        ),
      ),
    );
  }

  Widget _buildListViewProducts(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (ctrl) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: ctrl.bestSelling.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () => Get.to(DetailsView(ctrl.bestSelling[index])),
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    CustomCachedImage(imgUrl: ctrl.bestSelling[index].imgUrl),
                    SizedBox(height: 10),
                    CustomText(
                      text: ctrl.bestSelling[index].name,
                      alignment: Alignment.bottomLeft,
                      fontSize: 18,
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: ctrl.bestSelling[index].description,
                      alignment: Alignment.bottomLeft,
                      color: Colors.grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: '${ctrl.bestSelling[index].price}\$',
                      alignment: Alignment.bottomLeft,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(width: 10),
        ),
      ),
    );
  }

  Container _buildSearchFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

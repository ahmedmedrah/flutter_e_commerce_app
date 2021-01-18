import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/view/widget/custom_button.dart';
import 'package:e_commerce_app/view/widget/custom_cached_image.dart';
import 'package:e_commerce_app/view/widget/custom_single_child_sv.dart';
import 'package:e_commerce_app/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsView extends StatelessWidget {
  final ProductModel productModel;

  DetailsView(this.productModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSingleChildSV(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: CustomCachedImage(
                  imgUrl: productModel.imgUrl,
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    CustomText(
                      text: productModel.name,
                      fontSize: 26,
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(18),
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(text: 'Size:'),
                              CustomText(text: productModel.size),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(18),
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(text: 'Color:'),
                              CustomText(text: productModel.color),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    CustomText(
                      text: 'Details',
                      maxLines: null,
                      fontSize: 22,
                    ),
                    SizedBox(height: 15),
                    CustomText(
                      text: productModel.description,
                      maxLines: null,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Price:',
                          color: Colors.grey,
                        ),
                        CustomText(
                          text: '${productModel.price}\$',
                          color: primaryColor,
                          fontSize: 20,
                        )
                      ],
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: 'ADD',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/services/home_service.dart';
import 'package:e_commerce_app/model/category_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  List<CategoryModel> _categories = [];
  List<ProductModel> _bestSelling = [];

  List<CategoryModel> get categories => _categories;

  List<ProductModel> get bestSelling => _bestSelling;

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
    print(_categories);
    print(_bestSelling);
  }

  getCategory() async {
    await HomeService().getCategories().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categories.add(CategoryModel.fromJson(value[i].data()));
      }
    });
  }

  getBestSellingProducts() async {
    await HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _bestSelling.add(ProductModel.fromJson(value[i].data()));
        print(_bestSelling);
      }
    });
  }
}

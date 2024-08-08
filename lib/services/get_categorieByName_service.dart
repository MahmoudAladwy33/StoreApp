import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class Categoriebyname {
  Future<List<dynamic>> getCategoriebyname(
      {required String category_name}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$category_name');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}

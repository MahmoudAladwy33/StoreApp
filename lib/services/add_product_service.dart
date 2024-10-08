import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProductService {
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String desc,
    required String img,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': img,
        'category': category,
      },
    );

    return ProductModel.fromJson(data);
  }
}

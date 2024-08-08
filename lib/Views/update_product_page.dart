import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Widgets/custom_button.dart';
import 'package:store_app/Widgets/custom_text_field.dart';
import 'package:store_app/helper/show_snake_bar.dart';
import 'package:store_app/helper/success_snake_bar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  static String id = 'productPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, img, price;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Update Product',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 20,
            bottom: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  txt: 'Product Name',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  txt: 'Description',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  txt: 'Price',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  onChanged: (data) {
                    img = data;
                  },
                  txt: 'image',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onTap: () async {
                    isloading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      successSnackBar(context);
                      Navigator.pop(context);
                    } catch (e) {
                      showSnackBar(context, 'there was an Error,try later');
                    }
                    isloading = false;
                    setState(() {});
                  },
                  txt: 'Update',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      desc: desc == null ? product.description : desc!,
      img: img == null ? product.image : img!,
      category: product.category,
      id: product.id,
    );
  }
}

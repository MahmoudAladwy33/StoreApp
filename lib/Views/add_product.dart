import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Widgets/custom_button.dart';
import 'package:store_app/Widgets/custom_form_text_field.dart';
import 'package:store_app/helper/show_snake_bar.dart';
import 'package:store_app/helper/success_snake_bar.dart';
import 'package:store_app/services/add_product_service.dart';

class AddProduct extends StatefulWidget {
  AddProduct({super.key});

  static String id = 'add product';

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? productName, desc, img, price, category;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Form(
        key: formKey,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Add Product',
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
                  CustomFormTextField(
                    onChanged: (data) {
                      productName = data;
                    },
                    txt: 'Product Name',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      category = data;
                    },
                    txt: 'Category',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      desc = data;
                    },
                    txt: 'Description',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFormTextField(
                    inputType: TextInputType.number,
                    onChanged: (data) {
                      price = data;
                    },
                    txt: 'Price',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFormTextField(
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
                      if (formKey.currentState!.validate()) {
                        isloading = true;
                        setState(() {});

                        try {
                          await addproduct();
                          successSnackBar(context);
                          Navigator.pop(context);
                        } catch (e) {
                          showSnackBar(context, 'there was an Error,try later');
                        }
                        isloading = false;
                        setState(() {});
                      }
                    },
                    txt: 'Add',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addproduct() async {
    await AddProductService().addProduct(
      title: productName!,
      price: price!,
      desc: desc!,
      img: img!,
      category: category!,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/Views/add_product.dart';
import 'package:store_app/Widgets/custom_card.dart';
import 'package:store_app/Widgets/custom_shimmer.dart';
import 'package:store_app/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:store_app/models/product_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  static String id = 'Homepage';

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetProductsCubit>(context).getproducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartShopping,
            ),
          ),
        ],
        title: const Text(
          'New Trend',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 65,
        ),
        child: BlocBuilder<GetProductsCubit, GetProductsState>(
          builder: (context, state) {
            List<ProductModel> products =
                BlocProvider.of<GetProductsCubit>(context).product;
            if (state is GetProductsSuccess) {
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(
                    product: products[index],
                  );
                },
              );
            } else if (state is GetProductsLoading) {
              return const CustomShimmer();
            } else {
              return const Text('something wrong ');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xfff15b3c),
        onPressed: () {
          Navigator.pushNamed(context, AddProduct.id);
        },
        child: const Icon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
      ),
    );
  }
}

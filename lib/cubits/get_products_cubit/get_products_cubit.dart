import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_service.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());

  List<ProductModel> product = [];

  Future<void> getproducts() async {
    emit(GetProductsLoading());
    try {
      product = await AllProductService().getAllProducts();
      emit(GetProductsSuccess());
    } catch (e) {
      emit(GetProductsFailure());
    }
  }
}

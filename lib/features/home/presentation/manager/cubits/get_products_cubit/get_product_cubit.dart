import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/repo/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit(this.productRepo) : super(GetProductInitial());
  final ProductRepo productRepo;

  Future<void> getProducts() async {
    emit(GetProductLoading());
    final result = await productRepo.getProducts();
    result.fold((failure) => emit(GetProductFailed(message: failure.message)),
        (products) => emit(GetProductSuccess(products: products)));
  }

  Future<void> getBestSellingProducts() async {
    emit(GetProductLoading());
    final result = await productRepo.getBestSellingProducts();
    result.fold((failure) => emit(GetProductFailed(message: failure.message)),
        (products) => emit(GetProductSuccess(products: products)));
  }

  Future<void> getProductByName(String name) async {
    emit(GetProductLoading());
    final result = await productRepo.getProductByName(name: name);
    result.fold((failure) => emit(GetProductFailed(message: failure.message)),
        (products) => emit(GetProductSuccess(products: products)));
  }
}

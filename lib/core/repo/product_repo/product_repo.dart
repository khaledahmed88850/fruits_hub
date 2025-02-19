import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failures, List<ProductEntity>>> getProducts();
  Future<Either<Failures, List<ProductEntity>>> getProductByName(
      {required String name});
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts();
}

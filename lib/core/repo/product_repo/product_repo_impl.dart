import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/core/entities/product_entity.dart';

import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/services/database_services.dart';
import 'package:e_commerce_app/core/utils/backend_endpoints.dart';

import 'product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseServices databaseServices;

  ProductRepoImpl({required this.databaseServices});
  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseServices.getAllData(
        path: BackendEndpoints.products,
      );
      List<ProductModel> productList =
          data.map((e) => ProductModel.fromJson(e)).toList();
      return Right(productList.map((e) => e.toEntity()).toList());
    } on Exception {
      return Left(ServerFailure(message: 'Failed to get products'));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseServices.getAllData(
          path: BackendEndpoints.products,
          query: {'orderBy': 'sellingCount', 'limit': 8, 'descending': true , 'greaterThan' : true , 'lessThan' : false});  
      List<ProductModel> productList =
          data.map((e) => ProductModel.fromJson(e)).toList();
      return Right(productList.map((e) => e.toEntity()).toList());
    } on Exception {
      return Left(ServerFailure(message: 'Failed to get products'));
    }
  }
}

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/services/database_services.dart';
import 'package:e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce_app/core/utils/backend_endpoints.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/checkout/data/models/order_model.dart';
import 'package:e_commerce_app/features/checkout/data/repo/order_repo.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';

import '../../../../constants.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseServices databaseServices;

  OrderRepoImpl({required this.databaseServices});
  @override
  Future<Either<Failures, void>> addOrder(OrderEntity order) async {
    var userData = jsonDecode(Prefs.getString(kUserData)!);
    UserModel userModel = UserModel.fromJson(userData);
    try {
      OrderModel orderModel = OrderModel.fromEntity(order);
      await databaseServices.addDataToSubCollection(
        data: orderModel.toMap(),
        documentId: userModel.uId,
        path: BackendEndpoints.userData,
        subCollection: BackendEndpoints.orders,
      );
      return right(null);
    } on Exception catch (e) {
      return left(
          ServerFailure(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى'));
    }
  }
}

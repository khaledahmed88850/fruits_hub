import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failures, void>> addOrder(OrderEntity order);
}

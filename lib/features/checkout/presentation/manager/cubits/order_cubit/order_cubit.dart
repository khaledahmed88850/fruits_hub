import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/checkout/data/repo/order_repo.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:equatable/equatable.dart';


part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());
  final OrderRepo orderRepo;

  Future<void> addOrder(
      {required OrderEntity order, }) async {
    emit(OrderLoading());
    var result = await orderRepo.addOrder(order);
    result.fold((l) => emit(OrderFailure(message: l.message)),
        (r) => emit(OrderSuccess()));
  }
}

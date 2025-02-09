import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_view_screens_state.dart';

class ProductViewScreensCubit extends Cubit<int> {
  ProductViewScreensCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}

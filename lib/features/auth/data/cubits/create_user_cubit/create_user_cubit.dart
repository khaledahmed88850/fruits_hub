import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user_entity.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit(this.authRepo) : super(CreateUserInitial());
  final AuthRepo authRepo;

  Future<void> createUser(
      {required String email,
      required String password,
      required String name}) async {
    emit(CreateUserLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
        email: email, password: password, name: name);
    result.fold((failure) => emit(CreateUserFailure(message: failure.message)),
        (user) => emit(CreateUserSuccess(userEntity: user)));
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    var result = await authRepo.signInWithEmailAndPassword(
        email: email, password: password);
    result.fold((failure) => emit(LoginFailure(message: failure.message)),
        (user) => emit(LoginSuccess(userEntity: user)));
  }

  Future<void> loginWithGoogle() async {
    var result = await authRepo.signInWithGoogle();
    result.fold((failure) => emit(LoginFailure(message: failure.message)),
        (user) => emit(LoginSuccess(userEntity: user)));
  }

  Future<void> loginWithFacebook() async {
    var result = await authRepo.signInWithFacebook();
    result.fold((failure) => emit(LoginFailure(message: failure.message)),
        (user) => emit(LoginSuccess(userEntity: user)));
  }
}

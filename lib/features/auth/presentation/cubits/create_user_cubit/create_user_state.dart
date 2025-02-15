part of 'create_user_cubit.dart';

@immutable
sealed class CreateUserState {}

final class CreateUserInitial extends CreateUserState {}

final class CreateUserLoading extends CreateUserState {}

final class CreateUserSuccess extends CreateUserState {
  final UserEntity userEntity;
  CreateUserSuccess({required this.userEntity});
}

final class CreateUserFailure extends CreateUserState {
  final String message;
  CreateUserFailure({required this.message});
}

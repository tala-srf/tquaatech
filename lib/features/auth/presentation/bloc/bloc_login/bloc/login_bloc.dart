import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/login_entity.dart';
import 'package:test_form_tuqaatech/features/auth/domin/entites/token.dart';
import 'package:test_form_tuqaatech/features/auth/domin/usecases/login_usecase.dart';

import '../../../../../../core/error/error_type.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginusecase;
  LoginBloc(this.loginusecase) : super(LoginInitial()) {
    on<Loginevent>((event, emit) async {
      emit(LoadingLogin());
      final succ = await loginusecase(event.entity);

      emit(
        _eitherDoneMessageOrErrorState(
          succ,
        ),
      );
    });
    on<SignOutEvent>((event, emit) async {
      emit(ProcessingLogOutState());
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('backend_token', 'EMPTY_TOKEN');
      emit(LogOutState());
      emit(LoginInitial());
    });
  }
  LoginState _eitherDoneMessageOrErrorState(
    Either<ErrorType, TokenEntity> either,
  ) {
    return either.fold(
        (failure) => ErrorNetLogin(
              "Error NetWork",
            ),
        (tokenEntity) => SuccessedLogin(tokenEntity));
  }
}

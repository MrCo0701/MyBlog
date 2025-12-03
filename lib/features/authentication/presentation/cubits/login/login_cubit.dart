import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/authentication/domain/use_case/auth_use_case.dart';
import 'package:my_blog/features/authentication/presentation/cubits/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.useCase) : super(LoginState.initial());
  final AuthUseCase useCase;

  Future<void> login(String email, String password) async {
    emit(LoginState.loading());

    try {
      await useCase.singIn(email, password);
      emit(LoginState.success());
    } catch (e) {
      emit(LoginState.error('Login fail'));
    }
  }
}

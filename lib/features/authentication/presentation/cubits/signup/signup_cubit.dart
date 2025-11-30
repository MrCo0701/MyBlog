import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/authentication/domain/entity/user.dart';
import 'package:my_blog/features/authentication/domain/use_case/auth_use_case.dart';
import 'package:my_blog/features/authentication/presentation/cubits/signup/singup_state.dart';

import '../../../../../core/exceptions/app_exception.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.useCase) : super(SignUpState.initial());
  final AuthUseCase useCase;

  Future<void> signUp(UserEntity user) async {
    emit(SignUpState.loading());

    try {
      await useCase.signUp(user);
      emit(SignUpState.success());
    } on AppException catch (e) {
      emit(SignUpState.error(e.message));
    } catch (e) {
      emit(SignUpState.error('Unspecified error'));
    }
  }
}

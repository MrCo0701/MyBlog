import 'package:my_blog/features/setting/data/repository/setting_repository_impl.dart';
import 'package:my_blog/features/setting/domain/use_case/setting_use_case.dart';
import 'package:my_blog/features/setting/presentation/cubits/setting_cubit.dart';

SettingCubit settingProvider() {
  final repo = SettingRepositoryImpl();
  final useCase = SettingUseCase(repo);
  return SettingCubit(useCase);
}

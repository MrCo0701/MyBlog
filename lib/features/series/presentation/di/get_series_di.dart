import 'package:my_blog/features/series/presentation/cubits/get_series/get_series_cubit.dart';

import '../../data/repository/seri_repository_impl.dart';
import '../../domain/use_case/seri_use_case.dart';

GetSeriesCubit getSeriesProvider() {
  final repository = SeriRepositoryImpl();
  final useCase = SeriUseCase(repository: repository);
  return GetSeriesCubit(useCase);
}

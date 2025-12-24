import 'package:my_blog/features/series/data/repository/seri_repository_impl.dart';
import 'package:my_blog/features/series/domain/use_case/seri_use_case.dart';

import '../cubits/add_series/series_cubit.dart';

SeriesCubit seriesProvider() {
  final repository = SeriRepositoryImpl();
  final useCase = SeriUseCase(repository: repository);
  return SeriesCubit(useCase);
}

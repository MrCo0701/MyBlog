import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/series/domain/use_case/seri_use_case.dart';
import 'package:my_blog/features/series/presentation/cubits/add_series/series_state.dart';

class SeriesCubit extends Cubit<SeriesState> {
  SeriesCubit(this.useCase) : super(SeriesState.initial());

  final SeriUseCase useCase;

  Future<void> createNewSeri(
    String title,
    String description,
    List<String> postIds,
  ) async {
    final isCreateSuccess = await useCase.createNewSeri(
      title,
      description,
      postIds,
    );

    if (isCreateSuccess) {
      emit(SeriesState.success());
    } else {
      emit(SeriesState.error('Error'));
    }
  }
}

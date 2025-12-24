import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/home/data/models/author/author_model.dart';
import 'package:my_blog/features/series/data/models/seri_detail/seri_detail_model.dart';
import 'package:my_blog/features/series/domain/use_case/seri_use_case.dart';
import 'package:my_blog/features/series/presentation/cubits/get_series/get_series_state.dart';

class GetSeriesCubit extends Cubit<GetSeriesState> {
  GetSeriesCubit(this.useCase)
    : super(
        GetSeriesState(
          listSeries: [],
          seriesDetail: SeriesDetailModel(
            id: 0,
            title: '',
            slug: '',
            description: '',
            createdAt: '',
            author: AuthorModel(id: '', fullName: ''),
            posts: [],
          ),
        ),
      );

  final SeriUseCase useCase;

  Future<void> getListSeries() async {
    final newList = await useCase.getListSeries();
    emit(state.copyWith(listSeries: newList));
  }

  Future<void> getSeriesDetail(String slug) async {
    final seri = await useCase.getSeriesBySlug(slug);
    emit(state.copyWith(seriesDetail: seri));
  }
}

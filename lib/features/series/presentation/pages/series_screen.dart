import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/series/presentation/cubits/get_series/get_series_cubit.dart';
import 'package:my_blog/features/series/presentation/cubits/get_series/get_series_state.dart';
import 'package:my_blog/features/series/presentation/di/get_series_di.dart';
import 'package:my_blog/features/series/presentation/pages/series_detail.dart';
import 'package:my_blog/features/series/presentation/widgets/series_item.dart';
import 'package:my_blog/features/setting/presentation/pages/setting_screen.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Expanded(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: BlocProvider(
                create: (_) => getSeriesProvider()..getListSeries(),
                child: BlocBuilder<GetSeriesCubit, GetSeriesState>(
                  builder: (context, state) {
                    return Column(
                      spacing: 5,
                      children: state.listSeries.map((seri) {
                        return SeriesItem(
                          seri: seri,
                          image: seri.author.avatarUrl ?? '',
                          onPressMore: () {},
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SeriesDetail(slug: seri.slug),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

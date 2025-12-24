import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_blog/features/home/domain/di/home_di.dart';
import 'package:my_blog/features/home/presentation/pages/home_screen.dart';
import 'package:my_blog/features/home/presentation/pages/search_screen.dart';
import 'package:my_blog/features/main/presentation/cubit/navigation_cubit.dart';
import 'package:my_blog/features/main/presentation/cubit/navigation_state.dart';
import 'package:my_blog/features/series/data/repository/seri_repository_impl.dart';
import 'package:my_blog/features/series/presentation/pages/create_series_screen.dart';
import 'package:my_blog/features/series/presentation/pages/series_screen.dart';
import 'package:my_blog/features/setting/presentation/pages/setting_screen.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AddSeriesScreen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo/logoB.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 70,
                  width: 70,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Iconsax.search_normal_copy,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider(
                              create: (_) => homeProvider(),
                              child: SearchScreen(),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Iconsax.setting_2_copy,
                          fontWeight: FontWeight.bold,
                        ),
                        onPressed: () {},

                        //     Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (_) => ProfilePage()),
                        // ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: _buildBody(state),
            bottomNavigationBar: _buildBottomNavigation(context, state),
          );
        },
      ),
    );
  }

  Widget _buildBody(NavigationState state) {
    if (state.index == 0) {
      return HomeScreen();
    } else if (state.index == 2) {
      return SeriesScreen();
    } else if (state.index == 3) {
      return ProfilePage();
    }
    return HomeScreen();
  }

  Widget _buildBottomNavigation(BuildContext context, NavigationState state) {
    return BottomNavigationBar(
      onTap: (index) => context.read<NavigationCubit>().changeTab(index),
      iconSize: 27,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: state.index,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      elevation: 12,
      selectedLabelStyle: TextStyle(fontSize: 14, height: 3),
      unselectedLabelStyle: TextStyle(fontSize: 14, height: 3),
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bookOpen),
          label: 'Posts',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.circleQuestion),
          label: 'Question',
        ),
        BottomNavigationBarItem(icon: Icon(Iconsax.gallery), label: 'Series'),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.userCircle),
          label: 'Profile',
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_blog/features/blog_writting/presentation/pages/writing_screen.dart';
import 'package:my_blog/features/home/domain/di/home_di.dart';
import 'package:my_blog/features/home/presentation/pages/home_screen.dart';
import 'package:my_blog/features/home/presentation/pages/search_screen.dart';
import 'package:my_blog/features/main/presentation/cubit/navigation_cubit.dart';
import 'package:my_blog/features/main/presentation/cubit/navigation_state.dart';

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
              // leading: Container(
              //   padding: EdgeInsets.all(20),
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/logo/logoB.png'),
              //       fit: BoxFit.cover,
              //     ),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   height: 70,
              //   width: 70,
              // ),
              leading: SizedBox(),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
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
                      SizedBox(width: 20),
                      IconButton(
                        icon: Icon(
                          Iconsax.notification_copy,
                          fontWeight: FontWeight.bold,
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => WritingScreen()),
                        ),
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

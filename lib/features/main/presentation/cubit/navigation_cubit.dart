import 'package:bloc/bloc.dart';
import 'package:my_blog/features/main/presentation/cubit/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(index: 0));

  void changeTab(int newIndex) {
    emit(NavigationState(index: newIndex));
  }
}

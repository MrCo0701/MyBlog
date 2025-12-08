import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/home/domain/use_case/home_use_case.dart';
import 'package:my_blog/features/home/presentation/cubits/home_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.useCase) : super(HomeState(allBlogs: []));

  final HomeUseCase useCase;

  Future<void> saveBlog(String key, Map<String, dynamic> blogJson) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(blogJson));
  }

  Future<Map<String, dynamic>?> loadBlog(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString == null) return null;
    return jsonDecode(jsonString);
  }

  Future<void> showAllBlog() async {
    final newListBlogs = await useCase.getAllBlog();
    emit(HomeState(allBlogs: newListBlogs));
  }

  Future<void> searchBlog(String titleSearch) async {
    final newListBlogs = await useCase.searchBlog(titleSearch);
    emit(HomeState(allBlogs: newListBlogs));
  }

  Future<void> searchBlogByTag(String tagLug) async {
    final newListBlogs = await useCase.searchBlogByTag(tagLug);
    emit(HomeState(allBlogs: newListBlogs));
  }
}

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/home/presentation/cubits/home_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

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
}

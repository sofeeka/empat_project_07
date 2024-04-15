import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    bool darkMode = !state;
    emit(darkMode);
    prefs.setBool('darkMode', darkMode);
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    bool darkMode = prefs.getBool('darkMode') ?? false;
    emit(darkMode);
  }
}


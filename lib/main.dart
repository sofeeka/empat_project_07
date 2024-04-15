import 'package:empat_project_07/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bored.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit()..loadTheme(),
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDarkMode) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: ThemeSwitcher(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              BlocProvider.of<ThemeCubit>(context).state
                  ? 'Dark Mode'
                  : 'Light Mode',
              style: const TextStyle(fontSize: 24),
            ),
            Switch(
              value: BlocProvider.of<ThemeCubit>(context).state,
              onChanged: (value) {
                BlocProvider.of<ThemeCubit>(context).toggleTheme();
              },
            ),
            const SizedBox(height: 50),
            const Bored(),
          ],
        ),
      ),
    );
  }
}


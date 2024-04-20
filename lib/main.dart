import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:second_memory/src/constants.dart';
import 'package:second_memory/src/features/home/model/note_model.dart';
import 'package:second_memory/src/utils/resources/theme_manager.dart';
import 'package:second_memory/src/utils/routing/routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(Constants.noteBox);
  await Hive.openBox<NoteModel>(Constants.archiveBox);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: routeByName,
        title: 'Notatnik',
        themeMode: ThemeMode.light,
        theme: ThemeData(
            floatingActionButtonTheme:
                const FloatingActionButtonThemeData().copyWith(
              iconSize: 40.0,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
            ),
            appBarTheme: const AppBarTheme().copyWith(
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            textTheme: const TextTheme().copyWith(
              bodySmall: const TextStyle(color: Colors.grey),
              bodyMedium: const TextStyle(color: Colors.white),
              bodyLarge: const TextStyle(color: Colors.white),
              labelSmall: const TextStyle(color: Colors.grey),
              labelMedium: const TextStyle(color: Colors.red),
              labelLarge: const TextStyle(color: Colors.red),
              displaySmall: const TextStyle(color: Colors.red),
              displayMedium: const TextStyle(color: Colors.white),
              displayLarge: const TextStyle(color: Colors.red),
            )));
  }
}

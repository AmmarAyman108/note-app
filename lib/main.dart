// Package name adaptive_theme

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/custom_bloc_observer.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/first_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = CustomBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  // ignore: unused_local_variable
  await Hive.openBox<NoteModel>(kNoteBox);

  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => NoteCubit()..readAllNotes(),
            ),
            BlocProvider(
              create: (context) => AddNoteCubit(),
            ),
          ],
          child: const FirstView(),
        ),
      ),
    );
  }
}

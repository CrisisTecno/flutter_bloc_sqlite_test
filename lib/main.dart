import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/database/tables/character_helpers.dart';
import 'core/routes/app_routes.dart';
import 'features/api-items/data/data.dart';
import 'features/api-items/domain/domain.dart';
import 'features/api-items/presentation/presentation.dart';
import 'features/prefs/data/data.dart';
import 'features/prefs/domain/domain.dart';
import 'features/prefs/presentation/cubit/preference_cubit.dart';

void main() {
  
  final dio = Dio();
  final remoteDataSource = ApiItemsRemoteDataSourceImpl(dio);
  final repository = ApiItemsRepositoryImpl(remoteDataSource);
  final getCharactersUseCase = GetCharactersUseCase(repository);

  
  final dbHelper = DatabaseHelper();
  final prefsLocalDataSource = PrefsLocalDataSourceImpl(dbHelper);
  final prefsRepository = PrefsRepositoryImpl(prefsLocalDataSource);

  final addPrefUseCase = AddPreferenceUseCase(prefsRepository);
  final getPrefsUseCase = GetPreferencesUseCase(prefsRepository);
  final getPrefByIdUseCase = GetPreferenceByIdUseCase(prefsRepository);
  final updatePrefUseCase = UpdatePreferenceUseCase(prefsRepository);
  final deletePrefUseCase = DeletePreferenceUseCase(prefsRepository);
  
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ApiItemsCubit>(
          create: (_) => ApiItemsCubit(getCharactersUseCase)
            ..fetchCharacters([1, 2, 3, 4, 5]),
        ),
        BlocProvider<PreferenceCubit>(
          create: (_) => PreferenceCubit(
            addUseCase: addPrefUseCase,
            getAllUseCase: getPrefsUseCase,
            getByIdUseCase: getPrefByIdUseCase,
            updateUseCase: updatePrefUseCase,
            deleteUseCase: deletePrefUseCase,
          )..loadPreferences(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rick & Morty Characters',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: goRouter,
    );
  }
}

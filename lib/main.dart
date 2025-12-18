import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/app_routes.dart';
import 'features/api-items/data/data.dart';
import 'features/api-items/domain/domain.dart';
import 'features/api-items/presentation/presentation.dart';

void main() {
  
  final dio = Dio();
  final remoteDataSource = ApiItemsRemoteDataSourceImpl(dio);
  final repository = ApiItemsRepositoryImpl(remoteDataSource);
  final getCharactersUseCase = GetCharactersUseCase(repository);

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ApiItemsCubit>(
          create: (_) => ApiItemsCubit(getCharactersUseCase)
            ..fetchCharacters([1, 2, 3, 4, 5]),
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

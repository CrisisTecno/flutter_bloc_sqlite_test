import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/api-items/domain/domain.dart';
import '../../features/api-items/presentation/presentation.dart';
import '../../features/api-items/presentation/views/api_items_view.dart';
import '../../features/prefs/prefs.dart';
import '../../features/widgets/widgets.dart';

final goRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/api-list',
      builder: (context, state) => const ApiListView(),
    ),
    GoRoute(path: '/prefs', builder: (context, state) => const PrefsView()),
    GoRoute(
      path: '/character/:characterId',
      builder: (context, state) {
        final character = state.extra as CharacterEntity?;

        if (character == null) {
          return const Scaffold(
            body: Center(child: Text('Character not found')),
          );
        }
        
        return CharacterDetailView(character: character);
      },
    ),
  ],
);

const splashRoute = '/splash';
const homeRoute = '/api-list';
const prefs = '/prefs';
const prefsNew = '/prefs/new';
const prefsDetail = '/prefs/detail';

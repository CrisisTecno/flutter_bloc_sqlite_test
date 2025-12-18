import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/api-items/domain/domain.dart';
import '../../features/api-items/presentation/presentation.dart';
import '../../features/prefs/domain/domain.dart';
import '../../features/prefs/presentation/presentation.dart';
import '../../features/prefs/presentation/views/prefs_detail.dart';
import '../../features/prefs/presentation/views/prefs_new.dart';
import '../../features/widgets/widgets.dart';

final goRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/api-list',
      builder: (context, state) => const ApiListView(),
    ),
    GoRoute(path: '/prefs', builder: (context, state) => const PrefsListPage()),
    GoRoute(
      path: '/prefs/new',
      builder: (context, state) {
        final extra = state.extra;
        final character = extra is CharacterEntity ? extra : null;
        return PrefsNewPage(initialCharacter: character);
      },
    ),
    GoRoute(
      path: '/prefs/:prefsId',
      builder: (context, state) {
        final idStr = state.pathParameters['prefsId'];
        final prefsId = idStr != null ? int.tryParse(idStr) : null;

        final pref =
            state.extra is PreferenceEntity
                ? state.extra as PreferenceEntity
                : null;

        return PrefsDetailPage(prefsId: prefsId, initialPreference: pref);
      },
    ),
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

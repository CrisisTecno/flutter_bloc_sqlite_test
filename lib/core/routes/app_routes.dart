import 'package:go_router/go_router.dart';

import '../../features/api-items/presentation/views/api-items.dart';
import '../../features/prefs/prefs.dart';
import '../../features/widgets/widgets.dart';

final goRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/api-list',
      builder: (context, state) => const ApiItemsView(),
    ),
    GoRoute(path: '/prefs', builder: (context, state) => const PrefsView()),
  ],
);

const splashRoute = '/splash';
const homeRoute = '/api-list';
const prefs = '/prefs';
const prefsNew = '/prefs/new';
const prefsDetail = '/prefs/detail';

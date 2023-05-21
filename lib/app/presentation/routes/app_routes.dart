import '../modules/splash/views/splash_view.dart';
import 'package:flutter/widgets.dart';

import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {Routes.splash: (context) => const SplashView()};
}
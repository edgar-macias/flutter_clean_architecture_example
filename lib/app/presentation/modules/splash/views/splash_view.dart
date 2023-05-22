import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  Future<void> _init() async {
    final injector = Injector.of(context);
    final connectivityRepository = injector.connectivityRepository;
    if (await connectivityRepository.hasInternet) {
      final authenthicationRepository = injector.authenticationRepository;
      if (await authenthicationRepository.isSignedIn) {
        final user = await authenthicationRepository.getUserData();
        if (mounted) {
          final toGoRouteName = user != null ? Routes.home : Routes.signIn;
          _goTo(toGoRouteName);
        }
      } else if (mounted) {
        _goTo(Routes.signIn);
      }
    } else if (mounted) {
      _goTo(Routes.offline);
    }
  }

  void _goTo(String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

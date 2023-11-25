import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../configs/routes/route_location.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _navigateNext(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
        .then((_) => context.pushReplacementNamed(RouteLocation.homeScreen));
  }

  @override
  Widget build(BuildContext context) {
    _navigateNext(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 250,
              ),
            ),
            const Spacer(),
            const Text("v1.0.0"),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

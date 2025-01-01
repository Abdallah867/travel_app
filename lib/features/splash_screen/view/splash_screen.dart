import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/font_weight_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _logoAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Define the logo movement (move left)
    _logoAnimation = Tween<Offset>(
      begin: const Offset(0.4, 0), // Start at the original position (centered)
      end: const Offset(-0.1, 0), // Move the logo to the left
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Define the text fade-in animation
    _textAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0, // Fade text in from 0 to 1
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();

    // Navigate to the next screen after a delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 6), () {
        if (mounted) {
          // Uncomment and use your desired navigation logic here
          context.go(AppRoutes.kHomeView);
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
          children: [
            // Logo: Animated to move to the left
            SlideTransition(
              position: _logoAnimation,
              child: SizedBox(
                width: 100, // Set your desired logo size
                height: 100,
                child: Image.asset(AppAssets.reehlaLogo),
              ),
            ),
            // Text: Fade-in animation with minimal space between logo and text
            FadeTransition(
              opacity: _textAnimation,
              child: const Text(
                'REEHLA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 46,
                  fontWeight: FontWeightHelper.semiBold,
                  fontFamily: 'urbanist',
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

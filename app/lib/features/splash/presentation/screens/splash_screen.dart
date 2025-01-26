import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/index.dart';
import '../../../../core/extensions/index.dart';
import '../../../../core/widgets/adaptive_progress_indicator.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.easeIn),
      ),
    );

    _initializeApp();
  }

  Future<void> _initializeApp() async {
    _controller.forward();
    await ref.read(splashControllerProvider.notifier).initializeApp();
    if (mounted) {
      context.go('/');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(ModulePadding.a16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Logo
              ScaleTransition(
                scale: _scaleAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    'Hacker News',
                    textAlign: TextAlign.center,
                    style: context.displayLarge?.copyWith(
                      color: context.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: ModulePadding.v32),
              // Loading Indicator
              FadeTransition(
                opacity: _fadeAnimation,
                child: const AdaptiveProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

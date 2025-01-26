import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'providers/theme_provider.dart';
import 'router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize path_provider
  try {
    await getApplicationSupportDirectory();
  } catch (e) {
    // Ignore path_provider errors in development
    debugPrint('Path provider error: $e');
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final isDark = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark);

    return CupertinoApp.router(
      title: 'Hacker News',
      theme: isDark
          ? const CupertinoThemeData(
              brightness: Brightness.dark,
              primaryColor: CupertinoColors.activeBlue,
            )
          : const CupertinoThemeData(
              brightness: Brightness.light,
              primaryColor: CupertinoColors.activeBlue,
            ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [],
      supportedLocales: const [
        Locale('en', ''), // English
      ],
    );
  }
}

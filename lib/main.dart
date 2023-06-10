import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/themes/theme.dart';
import 'core/utils/supabase_client.dart';
import 'presentation/pages/authentication/login_page.dart';
import 'presentation/pages/authentication/register_genre_page.dart';
import 'presentation/pages/authentication/register_page.dart';
import 'presentation/pages/book/book_detail_page.dart';
import 'presentation/pages/main_page.dart';
import 'presentation/pages/notification/notification_page.dart';
import 'presentation/pages/onboarding_page.dart';
import 'providers.dart';
import 'wrappers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  runApp(ProviderScope(
    overrides: [
      sharedPreferences.overrideWithValue(preferences),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          error: orange500Color,
        ),
        fontFamily: 'Poppins',
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: grey300Color,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: grey300Color),
          ),
        ),
        useMaterial3: false,
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
          closeIconColor: Colors.white,
          contentTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Scaffold(body: Center(child: Wrapper())),
        '/onboarding': (context) => const OnboardingPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/register/genre': (context) => const RegisterGenrePage(),
        '/home': (context) => const MainPage(),
        '/notifications': (context) => const NotificationPage(),
        '/book/detail': (context) => const BookDetailPage(),
      },
    );
  }
}

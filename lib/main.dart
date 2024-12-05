import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_page.dart';
import 'screens/register_page.dart';
import 'screens/main_navigation.dart';
import 'providers/theme_provider.dart'; // Import ThemeProvider

void main() {
  runApp(PSTechApp());
}

class PSTechApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()), // Add ThemeProvider
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'PSTech App',
            themeMode: themeProvider.themeMode, // Use ThemeProvider for theme mode
            theme: lightTheme(),
            darkTheme: darkTheme(),
            initialRoute: '/',
            routes: {
              '/': (context) => MainNavigation(),
              '/login': (context) => LoginPage(),
              '/register': (context) => RegisterPage(),
            },
          );
        },
      ),
    );
  }

  // Light Theme Configuration
  ThemeData lightTheme() {
    return ThemeData(
      primaryColor: Color(0xFFFFA500),
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFF5733),
          foregroundColor: Colors.white,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFFFFA500),
        foregroundColor: Colors.white,
      ),
    );
  }

  // Dark Theme Configuration
  ThemeData darkTheme() {
    return ThemeData(
      primaryColor: Color(0xFF212121),
      scaffoldBackgroundColor: Color(0xFF303030),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFBB86FC),
          foregroundColor: Colors.black,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF424242),
        foregroundColor: Colors.white,
      ),
    );
  }
}

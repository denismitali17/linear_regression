import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:power_consumption_app/providers/theme_provider.dart';
import 'package:power_consumption_app/providers/prediction_provider.dart';
import 'package:power_consumption_app/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => PredictionProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Power Consumption Predictor',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme,
              ),
              appBarTheme: AppBarTheme(
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(color: Colors.black87),
                titleTextStyle: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.blue,
              colorScheme: const ColorScheme.dark(
                primary: Colors.blue,
                secondary: Colors.blueAccent,
              ),
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme.apply(
                      bodyColor: Colors.white,
                      displayColor: Colors.white,
                    ),
              ),
              appBarTheme: AppBarTheme(
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(color: Colors.white),
                titleTextStyle: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
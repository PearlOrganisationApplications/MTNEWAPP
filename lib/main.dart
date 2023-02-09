import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Theme/app_theme.dart';
import 'Theme/theme_model.dart';
import 'newApp/home/bottombar.dart';
import 'newApp/home/startinappflow/nameScreen.dart';

int? initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen $initScreen');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, _) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              theme: notifier.darkTheme ? darkTheme : lightTheme,
              debugShowCheckedModeBanner: false,
              initialRoute:
                  initScreen == 0 || initScreen == null ? "first" : "/",
              routes: {
                '/': (context) =>   BottomBar(token: '',),
                'first': (context) => const NameScrreen(),
                // 'childinfo': (context) => const HomeScreen(),
                // 'cycleduration': (context) => const CycleDuration(),
                // 'calculateduration': (context) => const CalculateDuration(),
                // 'duescreen': (context) => const DueDateScreen()
              },
            );
          },
        );
      },
    );
  }
}

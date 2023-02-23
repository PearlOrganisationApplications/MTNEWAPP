import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Theme/app_theme.dart';
import 'Theme/theme_model.dart';
import 'newApp/home/bottombar.dart';
import 'newApp/home/startinappflow/nameScreen.dart';

int? initScreen;

void main() async {
  Clipboard.setData(ClipboardData());
  HapticFeedback.heavyImpact();
  WidgetsFlutterBinding.ensureInitialized();


  SharedPreferences prefs = await SharedPreferences.getInstance();

  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen $initScreen');
  // Step 2
  WidgetsFlutterBinding.ensureInitialized();
  // Step 3
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));

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
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
          routes: {
            '/': (context) => const BottomBar(
                  token: '', name: '', babyname: '', age: '',
                ),
            'first': (context) => const NameScrreen(),
          },
        );
      },
    );
  }
}

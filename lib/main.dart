import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/layout/home_layout.dart';
import 'package:todo_app/shared/styles/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(418, 870),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyThemeData.lightTheme,
          darkTheme: MyThemeData.darkTheme,
          initialRoute: HomeLayout.routeName,
          routes: {
            HomeLayout.routeName: (context) => HomeLayout(),
          }),
    );
  }
}

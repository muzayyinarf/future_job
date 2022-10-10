import 'package:flutter/material.dart';
import 'package:future_job/pages/pages.dart';
import 'package:future_job/providers/auth_provider.dart';
import 'package:future_job/providers/category_provider.dart';
import 'package:future_job/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'providers/job_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<JobProvider>(
          create: (context) => JobProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/on-boarding': (context) => OnBoardingPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}

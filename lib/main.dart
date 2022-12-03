import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/userdetailscontroller.dart';
import 'package:userapp/theme/light_theme.dart';
import 'package:userapp/view/homepage.dart';

void main() {
 runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDetailsController()),
      ],
      child: const MyApp(),
    ),
 );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
     theme: lightTheme(context),
      home: HomeScreen()
    );
  }
}


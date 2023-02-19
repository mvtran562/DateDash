import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:DateDash/page/home_page.dart';
import 'package:DateDash/page/login_page.dart';
import 'package:DateDash/page/match_page.dart';
import 'package:DateDash/provider/feedback_position_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => FeedbackPositionProvider(),
        child: MaterialApp(
          title: 'Tinder Swiping',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoginPage(),
        ),
      );
}

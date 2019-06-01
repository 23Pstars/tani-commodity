import 'package:flutter/material.dart';
import 'package:tani_commodity/src/screens/home/home_screen.dart';
import 'package:tani_commodity/src/screens/login/login_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Tani Commodity',
      theme: ThemeData(
        // Write all theme styles here
        primaryColor: Color(0xff086eba),
        accentColor: Color(0xffffc502),
        backgroundColor: Color(0xfff6f6f9),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xff086eba),
          textTheme: ButtonTextTheme.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            fontSize: 12,
            color: Color(0x80777777),
          ),
        ),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen()
      },
    );
  }
}
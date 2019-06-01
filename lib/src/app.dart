import 'package:flutter/material.dart';
import 'package:tani_commodity/src/screens/home/home_screen.dart';
import 'package:tani_commodity/src/screens/login/login_screen.dart';
import 'package:tani_commodity/src/screens/register/register_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Tani Commodity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Write all theme styles here
        primaryColor: Color(0xff31A05E),
        accentColor: Color(0xffffc502),
        backgroundColor: Color(0xfff6f6f9),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          buttonColor: Color(0xff086eba),
          textTheme: ButtonTextTheme.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            fontSize: 12,
            color: Color(0x80777777),
          ),
          filled: true,
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(50.0),
            borderSide: new BorderSide(),
          ),
        ),
        textTheme: TextTheme(
            body1: TextStyle(
              fontSize: 12,
            ),
            subtitle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            )),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen()
      },
    );
  }
}

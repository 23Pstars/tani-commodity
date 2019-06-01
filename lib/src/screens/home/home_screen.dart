import 'package:flutter/material.dart';
import 'package:tani_commodity/src/reusable/leftdrawer.dart';
import 'package:tani_commodity/src/reusable/appbar.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LeftDrawer(),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            TCAppBar(title: 'Homescreen',withBackground: false,),

          ],
        ),
      ),
    );
    ;
  }
}

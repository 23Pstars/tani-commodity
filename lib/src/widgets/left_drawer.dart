import 'package:flutter/material.dart';

class LeftDrawer extends StatefulWidget {
  @override
  _LeftDrawerState createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  String _username;
  String _useremail;
  List<String> _menuDrawer;

  @override
  initState() {
    _username = 'KUD Gunungsari';
    _useremail = 'gunungsarikud@gmail.com';
    _menuDrawer = List<String>();
    _menuDrawer = ['menu 1', 'menu 2', 'menu 3', 'menu 4', 'menu 5'];
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  String _getInitial(String text) {
    return text.substring(0, 1);
  }

  Widget userSection(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: UserAccountsDrawerHeader(
        accountName: Text(_username),
        accountEmail: Text(_useremail),
        margin: EdgeInsets.only(bottom: 0.0),
        currentAccountPicture: CircleAvatar(
          child: Text(
            this._getInitial(_username),
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      ),
    );
  }

  List<Widget> menuList() {
    List<Widget> menuList = [];
    for (String t in _menuDrawer) {
      menuList.add(ListTile(
        title: Text(t),
        onTap: () {
          print('accessing menu $t');
        },
      ));
    }
    return menuList;
  }

  Widget logoutButton() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: RaisedButton(
        padding: EdgeInsets.all(16.0),
        onPressed: () {
          print('logout');
          Navigator.of(context).pushNamed('/');
        },
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: Text('Logout'),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerMenuList = [];
    drawerMenuList
      ..addAll([userSection(context)])
      ..addAll(menuList())
      ..addAll([logoutButton()]);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: drawerMenuList,
      ),
    );
  }
}

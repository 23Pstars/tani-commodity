import 'package:flutter/material.dart';

class TCAppBar extends StatefulWidget{
  final String title;
  final bool withBackground;

  const TCAppBar({
    @required this.title,
    @required this.withBackground,
  }): assert(title != null);

  @override
  _TCAppBarState createState() => _TCAppBarState();
}

class _TCAppBarState extends State<TCAppBar>{

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(widget.title, style: TextStyle(
          backgroundColor: Theme.of(context).primaryColor,
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.w300
      )),
      centerTitle: true,
      expandedHeight: widget.withBackground ? 300 : 0,
      floating: true,
      snap: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          iconSize: 28,
          tooltip: 'Notifications',
          onPressed: (){
            print('show notification');
          },
        ),
        Padding(
          padding: EdgeInsets.only(right: 18),
        )
      ],
    );
  }
}
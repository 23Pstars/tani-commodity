import 'package:flutter/material.dart';

class VillageCard extends StatelessWidget{

  String villageImage;
  String villageName;

  VillageCard({
    @required this.villageImage,
    @required this.villageName,
  }) :  assert(villageImage != null),
        assert(villageName != null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
          ),
          child: ClipRRect(
            borderRadius: new BorderRadius.circular(15.0),
            child: Image.network(villageImage),
          ),
        ),
        Positioned(
          bottom: 10,
          width: 300,
          child: Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(villageName, style: Theme.of(context).textTheme.headline),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text('commodity'),
                      Text('commodity'),
                      Text('commodity'),
                    ],
                  ),
                )

              ],
            ),
          ),
        )
      ]
    );

  }
}
import 'package:flutter/material.dart';

class VillageItemCard extends StatelessWidget {
  final String image;
  final String name;

  final double _cardRadius = 15;

  VillageItemCard({
    @required this.image,
    @required this.name,
  })  : assert(image != null),
        assert(name != null);

  @override
  Widget build(BuildContext context) {
    return Stack(overflow: Overflow.visible, children: <Widget>[
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
        ),
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(_cardRadius),
          child: Image.network(
            image,
            width: double.infinity,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        bottom: -50,
        left: 20,
        right: 20,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(_cardRadius),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Jagung', style: Theme.of(context).textTheme.subtitle),
                    Text('Bawang', style: Theme.of(context).textTheme.subtitle),
                    Text('Gula Aren',
                        style: Theme.of(context).textTheme.subtitle),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Rp.3.000'),
                    Text('Rp.5.000'),
                    Text('Rp.10.000'),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}

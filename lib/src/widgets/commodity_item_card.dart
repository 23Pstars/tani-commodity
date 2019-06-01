import 'package:flutter/material.dart';

class CommodityItemCard extends StatelessWidget {
  final double _borderRadius = 10;

  final Function onPressed;

  CommodityItemCard({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 250,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_borderRadius),
          ),
        ),
        child: InkWell(
            onTap: () {
              print('Commodity Item Tapped');
              onPressed();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_borderRadius),
                    topRight: Radius.circular(_borderRadius),
                  ),
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: Image.asset(
                      'assets/images/sample_commodity.jpg',
                      width: 150,
                      height: 125,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 150,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Jagung",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Tapon"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text("Review"),
                      onPressed: () {
                        onPressed != null && onPressed();
                      },
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

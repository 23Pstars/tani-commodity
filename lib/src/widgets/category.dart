import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget{
  String categoryImage;
  String categoryText;

  CategoryCard({
    @required this.categoryImage,
    @required this.categoryText
  }) : assert(categoryImage != null),
       assert(categoryText != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 3.0
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Image.network(categoryImage),
            ),
            Text(categoryText)
          ],
        ),
      ),
    );
  }
}
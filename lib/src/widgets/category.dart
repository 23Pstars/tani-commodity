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
    return Column(
      children: <Widget>[
        SizedBox(
          child: Image.network(categoryImage),
        ),
        Text(categoryText)
      ],
    );
  }
}
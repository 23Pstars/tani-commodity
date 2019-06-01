import 'package:flutter/material.dart';
import 'package:tani_commodity/src/widgets/category.dart';

class CommodityCategoryWidget extends StatelessWidget{
  List<List<String>> category;

  CommodityCategoryWidget({
    @required this.category,
}) :  assert(category != null);

  @override
  Widget build(BuildContext context) {
    List<Widget> categoryList = List<Widget>();
    for(List l in category){
      categoryList.add(
          CategoryCard(categoryText: l[0], categoryImage: l[1],)
      );
    }

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3.0
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: categoryList.toList(),
            ),
          ),
        ),
      )
    );
  }
}
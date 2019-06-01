import 'package:flutter/material.dart';
import 'package:tani_commodity/src/widgets/commodity_item_card.dart';

class CommodityItemScroll extends StatelessWidget{
  List<List<String>> commodity;

  CommodityItemScroll({
    @required this.commodity,
  }):   assert(commodity != null);

  @override
  Widget build(BuildContext context) {
    List<Widget> commodityList = List<Widget>();
    for(List l in commodity){
      commodityList.add(
          CommodityItemCard(onPressed: () => print('item card'))
      );
    }

    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 12, 6, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10,10,10,4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Recent Commodity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('see more')
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(10,4,10,4),
                height: 280,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: commodityList.toList(),
                )
            ),
          ],
        ),
      ),
    );
  }
}
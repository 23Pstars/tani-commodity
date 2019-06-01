import 'package:flutter/material.dart';
import 'package:tani_commodity/src/widgets/village_item_card.dart';

class VillageItemScroll extends StatelessWidget {
  final List<List<String>> village;

  VillageItemScroll({
    @required this.village,
  }) : assert(village != null);

  @override
  Widget build(BuildContext context) {
    List<Widget> villageList = List<Widget>();
    for (List l in village) {
      villageList.add(VillageItemCard(name: l[0], image: l[1]));
    }

    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 12, 6, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Popular Village',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('see more')
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                height: 280,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: villageList.toList(),
                )),
          ],
        ),
      ),
    );
  }
}

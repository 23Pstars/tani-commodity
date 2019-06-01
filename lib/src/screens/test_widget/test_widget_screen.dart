import 'package:flutter/material.dart';
import 'package:tani_commodity/src/widgets/commodity_item_card.dart';
import 'package:tani_commodity/src/widgets/village_item_card.dart';

class TestWidgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Widget'),
      ),
      body: Container(
          child: VillageItemCard(
        image:
            'https://upload.wikimedia.org/wikipedia/commons/9/90/Tassira.village.jpg',
        name: 'Kekeri',
      )),
    );
  }
}

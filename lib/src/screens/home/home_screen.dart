import 'package:flutter/material.dart';
import 'package:tani_commodity/src/widgets/left_drawer.dart';
import 'package:tani_commodity/src/widgets/app_bar.dart';
import 'package:tani_commodity/src/screens/home/carousel_widget.dart';
import 'package:tani_commodity/src/screens/home/commodity_item_scroll.dart';
import 'package:tani_commodity/src/screens/home/commodity_category_widget.dart';
import 'package:tani_commodity/src/screens/home/village_item_scroll.dart';

import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<String>> category;
  List<List<String>> village;
  List<List<String>> commodity;

  @override
  void initState() {
    category = [
      ['Hasil Bumi', 'assets/images/icon_hasil_bumi.png'],
      ['Olahan', 'assets/images/icon_olahan.png'],
      ['Kerajinan', 'assets/images/icon_kerajinan.png'],
      ['Jasa', 'assets/images/icon_jasa.png']
    ];
    village = [
      ['Kekeri', 'assets/images/kekeri.jpg'],
      ['Kota Mataram', 'assets/images/mataram.jpg']
    ];
    commodity = [
      ['Jagung'],
      ['Padi'],
      ['Singkong'],
      ['Gula'],
      ['Garam'],
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LeftDrawer(),
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            TCAppBar(
              title: 'Tani Commodity',
              withBackground: false,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: CarouselWidget(),
              ),
            ),
            CommodityCategoryWidget(category: category),
            CommodityItemScroll(commodity: commodity),
            VillageItemScroll(village: village),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tani_commodity/src/widgets/left_drawer.dart';
import 'package:tani_commodity/src/widgets/app_bar.dart';
import 'package:tani_commodity/src/screens/home/carousel_widget.dart';
import 'package:tani_commodity/src/screens/home/commodity_item_scroll.dart';
import 'package:tani_commodity/src/screens/home/commodity_category_widget.dart';
import 'package:tani_commodity/src/screens/home/village_item_scroll.dart';

import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<String>> category;
  List<List<String>> village;
  List<List<String>> commodity;

  final dbReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    category = [
      ['Hasil Bumi', 'https://web.pesansayur.id/asset/upload/icons_pilihan.png'],
      ['Olahan', 'https://web.pesansayur.id/asset/upload/icons_pilihan.png'],
      ['Kerajinan', 'https://web.pesansayur.id/asset/upload/icons_pilihan.png'],
      ['Jasa', 'https://web.pesansayur.id/asset/upload/icons_pilihan.png']
    ];
    village = [
      ['Kekeri', 'https://upload.wikimedia.org/wikipedia/commons/9/90/Tassira.village.jpg'],
    ];
    commodity = [
      ['Jagung'],
      ['Padi'],
      ['Singkong'],
      ['Gula'],
      ['Garam'],
    ];
    super.initState();

    dbReference.child("commodities/Nusa Tenggara Barat").once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LeftDrawer(),
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            TCAppBar(title: 'Homescreen',withBackground: false,),
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

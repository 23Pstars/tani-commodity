import 'package:flutter/material.dart';
import 'package:tani_commodity/src/widgets/left_drawer.dart';
import 'package:tani_commodity/src/widgets/app_bar.dart';
import 'package:tani_commodity/src/screens/home/carousel_widget.dart';
import 'package:tani_commodity/src/widgets/category.dart';
import 'package:tani_commodity/src/widgets/village.dart';

import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<String>> category;
  List<List<String>> village;

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
    super.initState();

    dbReference.child("commodities/Nusa Tenggara Barat").once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> categoryList = List<Widget>();
    for(List l in category){
      categoryList.add(
        CategoryCard(categoryText: l[0], categoryImage: l[1],)
      );
    }

    List<Widget> villageList = List<Widget>();
    for(List l in village){
      villageList.add(
        VillageCard(villageName: l[0], villageImage: l[1])
      );
    }

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
            SliverToBoxAdapter(
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
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: villageList.toList(),
                )
              ),
            )

          ],
        ),
      ),
    );
    ;
  }
}

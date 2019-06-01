import 'package:flutter/material.dart';
import 'package:tani_commodity/src/widgets/left_drawer.dart';
import 'package:tani_commodity/src/widgets/app_bar.dart';
import 'package:tani_commodity/src/screens/home/carousel_widget.dart';
import 'package:tani_commodity/src/widgets/category.dart';

import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<String>> category;

  final dbReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    category = [
      ['Hasil Bumi', 'https://web.pesansayur.id/asset/upload/icons_pilihan.png'],
      ['Olahan', 'https://web.pesansayur.id/asset/upload/icons_pilihan.png'],
      ['Kerajinan', 'https://web.pesansayur.id/asset/upload/icons_pilihan.png'],
      ['Jasa', 'https://web.pesansayur.id/asset/upload/icons_pilihan.png']
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

    return Scaffold(
      drawer: LeftDrawer(),
      body: Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: categoryList.toList(),
                ),
              )
            )

          ],
        ),
      ),
    );
    ;
  }
}

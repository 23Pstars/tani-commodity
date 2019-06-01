import 'package:flutter/material.dart';
import 'package:tani_commodity/src/widgets/left_drawer.dart';
import 'package:tani_commodity/src/widgets/app_bar.dart';

const styleHeadline = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30);
const styleTitle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
const styleSubtitle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12);

class CommodityScreen extends StatefulWidget{
  @override
  _CommodityScreenState createState() => _CommodityScreenState();
}

class _CommodityScreenState extends State<CommodityScreen>{
  String imagePath;
  String title;

  @override
  void initState() {
    imagePath = 'https://i.ibb.co/0MvStd4/23-corn-png-image-thumb.png';
    title = 'Jagung';
    super.initState();
  }

  popupDialog(){
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Form(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Entry Price Suggestion', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text("Submit"),
                      onPressed: () => print('submit price'),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: CustomScrollView(
          slivers: <Widget>[
            TCAppBar(title: 'Product', withBackground: false,),
            SliverToBoxAdapter(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 100),
                      child: SizedBox(
                        child: Image.network(imagePath),
                        height: 280,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(title, style: styleHeadline),
                  ),
                  Positioned(
                    top: 30,
                    right: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('Desa Tapon', style: styleTitle),
                        SizedBox(height: 30,),
                        Text('Kediri', style: styleSubtitle,),
                        Text('Lombok Barat', style: styleSubtitle),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text('Rp 15.000,-', style: styleHeadline,),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: SizedBox(
                      child: IconButton(
                        onPressed: () => popupDialog(),
                        icon: Icon(Icons.add_comment),
                        color: Colors.white,
                        iconSize: 32,
                      ),
                    ),
                  )
                ],
              )
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular((15)))
                ),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text('Reviews', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: <Widget>[
                          ReviewWidget(),
                          ReviewWidget(),
                          ReviewWidget(),
                          ReviewWidget(),
                        ],
                      )
                    )

                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Text('PS'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14,8,14,8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Pesansayur', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    Text('Rp. 12.000,-',style: TextStyle(color: Colors.black, fontSize: 14),)
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
          ),
          SizedBox(
            height: 20,
            child: Divider(),
          )
        ]
      ),
    );
  }
}


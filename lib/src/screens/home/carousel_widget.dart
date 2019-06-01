import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CarouselWidget extends StatefulWidget{
  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget>{

  List<String> imagesPath;

  @override
  void initState() {
    imagesPath = [
      'https://web.pesansayur.id/asset/upload/_cache/lrs-5c18b38ee660ffdca95d0629b60f01ef.jpg',
      'https://web.pesansayur.id/asset/upload/_cache/lrs-093c4c645ea9f6765a494718e5a74be2.jpg',
      'https://web.pesansayur.id/asset/upload/_cache/lrs-a80eed380db30f7a5aca9ebdfaf1518d.jpg',
      'https://web.pesansayur.id/asset/upload/_cache/lrs-8bd41b89bfe12ccdb4ad5b846b986e05.jpg',
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List imageList = new List();
    for(String path in imagesPath){
      imageList.add(
          NetworkImage(path)
      );
    }

    return Container(
      child: SizedBox(
        height: 200.0,
        width: 350.0,
        child: new Carousel(
          images: imageList,
          dotSize: 4.0,
          dotSpacing: 15.0,
          dotColor: Colors.lightGreenAccent,
          indicatorBgPadding: 5.0,
        )
      ),
    );
  }
}
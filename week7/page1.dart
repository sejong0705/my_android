import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_7_1/main.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
        children: <Widget>[_buildTop(), _buildMiddle(), _buildBottom()],
    );
  }

  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCar('택시'),
        _buildCar('블랙'),
        _buildCar('바이크'),
        _buildCar('대리'),
      ],
    ),
    SizedBox(height: 20),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    _buildCar('택시'),
    _buildCar('블랙'),
    _buildCar('바이크'),
    _buildCar('대리', visible:false),
    ],
    ),
    ],
    ),
    );
  }

  Widget _buildCar(String title, {bool visible = true}) {
    return
      InkWell(
        onTap: () {
          print('클릭');
        },
          child: Opacity(
            opacity: visible ? 1.0 : 0.0 ,
            child: Column(children: [Icon(Icons.local_taxi, size: 40), Text(title)]),
          ),
      );
    }

  Widget _buildMiddle() {
    return CarouselSlider(items: dummyItems.map((url){
      return Builder(
        builder: (BuildContext context){
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(url, fit: BoxFit.cover,
              ),
            ),
          );
        },
      );
    }).toList(),
        options: CarouselOptions(
          height: 150.0,
          autoPlay: true
        )
    );
  }

  Widget _buildBottom() {
    final items = List.generate(10, (i){
      return
        GestureDetector(
          onTap:(){ print('index'); },
        child:
        ListTile(
        leading: Icon(Icons.notifications_none),
        title: Text('[이벤트] 이것은 공지사항 $i번 입니다.'),
        ),
        );
    });

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: items,
    );
  }
}

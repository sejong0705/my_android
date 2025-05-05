import 'package:flutter/material.dart';
import 'package:flutter_7_1/page1.dart';
import 'package:flutter_7_1/page2.dart';
import 'package:flutter_7_1/page3.dart';

final dummyItems =['https://cdn.pixabay.com/photo/2018/11/12/18/44/thanksgiving-3811492_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/10/30/15/33/tajikistan-4589831_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/11/25/16/15/sfari-4652364_1280.jpg',
];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '복잡한 UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  var _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
       title: Text('복잡한 UI 페이지',
       style: TextStyle(color: Colors.black),
       ),
       centerTitle: true,
       actions: <Widget>[
         IconButton(onPressed: () {}, icon: Icon(Icons.add,color: Colors.black,))
       ],
     ),
     body: _pages[_index],

     bottomNavigationBar: BottomNavigationBar(onTap: (index){
       setState(() { //값이 변경 될 떄 화면도 변경해야 해서 setState 해줘야함
         _index = index;
       });
     },
     currentIndex: _index,
       items: <BottomNavigationBarItem>[
         BottomNavigationBarItem(label: '홈',
           icon: Icon(Icons.home),
         ),
         BottomNavigationBarItem(label: '이용서비스',
           icon: Icon(Icons.assignment),
         ),
         BottomNavigationBarItem(label: '내 정보',
           icon: Icon(Icons.account_circle),
         ),
       ],
     ),
   );
  }
}

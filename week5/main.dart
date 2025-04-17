import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan, // 전체 배경 파란색
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      // 빨간색 큰 박스
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                      // 파란+검정+주황 묶음
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            // 파란색
                            Expanded(
                              flex: 2,
                              child: Container(color: Colors.blue),
                            ),
                            // 검정+주황 나란히
                            Expanded(
                              flex:  2,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(color: Colors.black),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(color: Colors.orange),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // 노란색 큰 박스
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

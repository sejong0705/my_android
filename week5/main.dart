import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
      title: ("계산기"),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Center(
        child: Container(
          width: 350,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.black,
            ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.white),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8),
                      Text(
                        "표준",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                // 결과창
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.bottomRight,
                    child: const Text(
                      '0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ),
                // 버튼 영역
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      buildButtonRow(["MC", "MR", "M+", "M-", "MS"]),
                      buildButtonRow(["%", "CE", "C", "⌫"]),
                      buildButtonRow(["⅟x", "x²", "²√x", "÷"]),
                      buildButtonRow(["7", "8", "9", "×"]),
                      buildButtonRow(["4", "5", "6", "-"]),
                      buildButtonRow(["1", "2", "3", "+"]),
                      buildButtonRow(["±", "0", ".", "="]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 버튼 행 만들기
  static Widget buildButtonRow(List<String> texts) {
    return Expanded(
      child: Row(
        children: texts.map((text) => buildButton(text)).toList(),
      ),
    );
  }

  // 버튼 하나 만들기
  static Widget buildButton(String text) {
    bool isEqualButton = text == "=";
    bool isMemoryButton = ["MC", "MR", "M+", "M-", "MS"].contains(text);

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: isEqualButton
                ? Colors.lightBlue
                : isMemoryButton
                ? Colors.black
                : Colors.grey[850],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.zero,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: isMemoryButton ? 12 : 20, // 메모리 버튼은 작게
                fontWeight: isMemoryButton ? FontWeight.w300 : FontWeight.normal, // 메모리 버튼은 얇게
                color: Colors.white60 ,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

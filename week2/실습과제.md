## 실습 1: 다트 언어로 구구단 출력

### 📌 코드
```dart
void main() {
  for (int i = 2; i <= 9; i++) { 
    for (int j = 1; j <= 9; j++) { 
      print('$i * $j = ${i * j}'); 
    }
    print("");
  }
}
```
### 출력예시
```
2 * 1 = 2  
2 * 2 = 4  
2 * 3 = 6  
...  
9 * 8 = 72  
9 * 9 = 81  
```
## 실습 2: 사각형 그리기

### 📌 코드
```dart
void main() {
  var n = 10; // 크기
  var result = '';
  for (var y = 0; y < n; y++) {
    for (var x = 0; x < n; x++) {
      var c = f1(x, y, n) || f2(x, y, n); 
      if (c) {
        result += '=';
      } else {
        result += ' ';
      }
    }
    result += '\n';
  }
  print(result);
}

bool f1(int x, int y, int size) {
  return x == 0 || y == 0 || x == size - 1 || y == size - 1; // 사각형 테두리
}

bool f2(int x, int y, int size) {
  return x == y; // 왼쪽 위에서 오른쪽 아래로 가는 대각선 (\)
}
```

### 출력예시 (`n = 10`)
```plaintext
==========
=       =
= =     =
=  =    =
=   =   =
=    =  =
=     = =
=      ==
=       =
==========
```

### 함수정리
- `f1(x, y, n)`: 사각형 테두리를 그리는 함수
- `f2(x, y, n)`: `\` 대각선을 추가하는 함수
- `x + y == size - 1`을 추가하면 `/` 대각선도 포함되어 `X` 형태가 된다.

### 🔹 `X` 모양을 위한 코드
```dart
bool f2(int x, int y, int size) {
  return x == y || x + y == size - 1;
}
```
 이렇게 하면 `/` 대각선까지 추가되어 `X` 모양이 완성된다
 
## 실습 3: 년/월/일을 입력하면 요일을 출력하기

### 📌 코드
```dart
import 'dart:io';

void main() {
  List<String> weekDays = ['월', '화', '수', '목', '금', '토', '일'];

  print('연도, 월, 일을 입력하세요 (예: 2025 3 22): ');
  String input = stdin.readLineSync()!; // 문자열 입력받기

  // 입력값을 공백 기준으로 나눠서 리스트로 변환
  List<String> parts = input.split(' ');

  // 리스트에서 숫자 추출 후 int로 변환
  int year = int.parse(parts[0]);
  int month = int.parse(parts[1]);
  int day = int.parse(parts[2]);

  // DateTime 객체 생성 후 요일 확인
  DateTime inputDate = DateTime(year, month, day);
  String weekday = weekDays[inputDate.weekday - 1];

  print('$year년 $month월 $day일은 $weekday요일입니다.');
}
```

### 출력예시
```
연도, 월, 일을 입력하세요 (예: 2025 3 22):
$year년 $month월 $day일은 $weekday요일입니다.
```

### 코드설명

1️⃣사용자 입력 받기
```
String input = stdin.readLineSync()!; // 문자열 입력받기
사용자가 입력한 값을 문자열(String) 형태로 받아온다.

!(null assertion operator)를 사용하여 null이 아님을 보장.
```

2️⃣입력값을 리스트로 변환
```
List<String> parts = input.split(' ');
입력값을 공백(' ')을 기준으로 나누어 리스트(List<String>) 형태로 저장.

예를 들어 "2025 3 22"를 입력하면 parts = ['2025', '3', '22'].
```

3️⃣문자열 정수로 변환
```
int year = int.parse(parts[0]);
int month = int.parse(parts[1]);
int day = int.parse(parts[2]);
리스트에 저장된 문자열 값을 정수(int)로 변환.

int.parse()를 사용하여 "2025" → 2025.
```
4️⃣⭐DateTime 객체 생성 및 요일 추출
```
DateTime inputDate = DateTime(year, month, day);
```
- DateTime 클래스를 사용하여 사용자가 입력한 날짜 객체를 생성함.
- 예를 들어 DateTime(2025, 3, 22)는 2025년 3월 22일을 나타냄.
```
String weekday = weekDays[inputDate.weekday - 1];
```
- DateTime 객체의 weekday 속성을 사용하여 해당 날짜의 요일을 가져옴.
- DateTime.weekday는 **월요일(1)~일요일(7)**로 반환됩니다.
- weekDays 리스트에서 weekday - 1을 인덱스로 사용하여 한글 요일을 가져옴.


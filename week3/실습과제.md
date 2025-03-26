## 실습 코드 정리

### 실습 1: 클래스와 게터
```dart
class Person {
  String _name;
  int _age;

  Person(this._name, this._age);

  String get name => _name;
  int get age => _age;

  void addOneYear() {
    _age++;
  }
}

void main() {
  var p = Person("이세종", 25);
  print([p.name, p.age]);

  p.addOneYear();
  print([p.name, p.age]);

  var p2 = Person("종종종", 22);
  print([p2.name, p2.age]);
}
```

### 실습 2: 사각형 클래스
```dart
class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

class Rectangle2 {
  num left, top, right, bottom;

  Rectangle2(this.left, this.top, this.right, this.bottom);

  num get width => 0;
  set width(num value) => right = 0;
  num get height => 0;
  set height(num value) => bottom = 0;
}
```

### 실습 3: 상속과 메서드 오버라이딩
```dart
class Hero {
  String name = '영웅';

  void run() {
    print("뛴다");
  }
}

class SuperHero extends Hero {
  @override
  void run() {
    super.run();
    this.fly();
  }

  void fly() {
    print('난다');
  }
}
```

### 실습 4: 인터페이스 구현
```dart
abstract class Monster {
  void attack();
}

class Goblin implements Monster {
  @override
  void attack() {
    print('고블린 어택');
  }
}

class Bat implements Monster {
  @override
  void attack() {
    print('할퀴기 공격');
  }
}
```

### 실습 5: Enum 사용
```dart
enum Status { login, logout }

void main() {
  var s1 = Status.login;
  var s2 = Status.logout;

  switch (s2) {
    case Status.login:
      print("로그인");
      break;
    case Status.logout:
      print("로그아웃");
      break;
  }
}
```

### 실습 6: 리스트와 셋
```dart
void main() {
  var lottoNums = [5, 6, 11, 19, 17, 21];
  lottoNums.remove(6);
  lottoNums.add(13);
  print(lottoNums);
}

void main() {
  var lottoNums = {3, 6, 11, 19, 17, 21};
  lottoNums.remove(6);
  lottoNums.add(13);
  print(lottoNums);
}
```

### 실습 7: 맵 사용
```dart
void main(){
  var map = {'한국': '서울', '일본': '도쿄'};
  print(map['한국']);
  map['중국'] = '북경';
  print(map);
}
```

### 실습 8: 함수 참조
```dart
void funcA() {
  print('왼쪽');
}

void funcB() {
  print('오른쪽');
}

void main() {
  var isChoice = true;
  var func = isChoice == true ? funcA : funcB;
  func();
}
```

### 실습 9: 리스트 변형
```dart
void main() {
  var nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print(nums.where((n) => n % 2 == 0).toList());

  var nums2 = [1,2,3,3,3,4,5,6,6,7];
  print(nums2.toSet().toList());
}
```

### 실습 10: 리스트 내부 if/for
```dart
void main() {
  bool promoActive = true;
  print([1, 2, 3, 4, 5, if (promoActive) 6]);
}
```

### 실습 11: 널 안전성
```dart
void main() {
  String? name;
  print(name?.length ?? 0);
}
```


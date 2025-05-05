## 📱 Flutter에서 데이터와 UI 로직을 분리하는 이유
###  유지보수와 확장성 향상
- UI 디자인이 바뀌더라도, 데이터 구조는 그대로 둘 수 있음
- 서버 연동 시에도 데이터 처리 부분만 수정하면 됨

###  역할 분담 명확화 (Separation of Concerns)
- UI 코드는 "화면 표현"만
- 데이터/로직은 별도 파일에서 처리 → 각자 역할이 뚜렷해짐

###  테스트 용이
- UI 없이도 로직만 따로 테스트할 수 있음
- 예: 리스트 생성 함수만 단위 테스트 가능

###  코드 재사용성
- 여러 페이지에서 같은 데이터를 쉽게 불러와서 쓸 수 있음

---

## ✅ 2. 예시: 데이터 분리 전/후 비교

### 분리 전 (UI 코드 내부에 데이터 포함)

```dart
Widget _buildMiddle() {
  return CarouselSlider(
    items: [
      'https://img1.jpg',
      'https://img2.jpg',
      'https://img3.jpg'
    ].map((url) => Image.network(url)).toList(),
    options: CarouselOptions(autoPlay: true),
  );
}
```
### 분리 후 (데이터는 별도 파일에)

```dart
// data.dart
final imageUrls = [
  'https://img1.jpg',
  'https://img2.jpg',
  'https://img3.jpg',
];

// page1.dart
Widget _buildMiddle() {
  return CarouselSlider(
    items: imageUrls.map((url) => Image.network(url)).toList(),
    options: CarouselOptions(autoPlay: true),
  );
}
```

import 'dart:math';

class Rectangle {
  int width;
  int height;
  Point origin;

  // 기본값 제공
  // 생성자 같은 역할이지만 유연하게 객체를 작성해줌..
  Rectangle({
    this.origin = const Point(0, 0),
    this.width = 0,
    this.height = 0,
  });

  @override
  String toString() =>
      'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}

main() {
  print(Rectangle(origin: const Point(10, 20), width: 100, height: 200));
  print(Rectangle(origin: const Point(10, 10)));
  print(Rectangle(width: 200));
  print(Rectangle());
  /*
    Origin: (10, 20), width: 100, height: 200
    Origin: (10, 10), width: 0, height: 0
    Origin: (0, 0), width: 200, height: 0
    Origin: (0, 0), width: 0, height: 0 
  */
}

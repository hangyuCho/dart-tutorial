import 'dart:math';

abstract class Shape {
  // 옵션 2: 팩토리 생성자 생성
  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type';
  }
  num get area;
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}

// 옵션 1: 최상위 함수 만들기
Shape shapeFactory(String type) {
  if (type == 'circle') return Circle(2);
  if (type == 'square') return Square(2);
  throw 'Can\'t create $type';
}

main() {
  final circle = Circle(2);
  final square = Square(2);

  print(circle.area);
  print(square.area);
  /*
  12.566370614359172
  4
  */

  final circleByMethod = shapeFactory('circle');
  final squareByMethod = shapeFactory('square');
  print(circleByMethod);
  print(squareByMethod);
  /*
  Instance of 'Circle'
  Instance of 'Square'
  */
  final circleByFactory = Shape('circle');
  final squareByFactory = Shape('square');
  print(circleByFactory);
  print(squareByFactory);
  /*
  Instance of 'Circle'
  Instance of 'Square'
  */
}

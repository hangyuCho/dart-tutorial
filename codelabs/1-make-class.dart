import 'package:test/test.dart';

class Bicycle {
  // 초기화 안해주면 에러남..
  int cadence;
  int gear;

  // 읽기 전용 변수 추가
  // int speed;
  int _speed = 0;
  int get speed => _speed;

  // 생성자로 변수를 초기화
  //Bicycle(int cadence, int speed, int gear);
  // 위 코드가 아래 코드의 축약형이라고 할 수 있음
  //Bicycle(int cadence, int speed, int gear)
  //: this.cadence = cadence,
  //this.speed = speed,
  //this.gear = gear;

  Bicycle(this.cadence, this.gear);

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }
}

//override tostring
class Bicycle2 {
  // 초기화 안해주면 에러남..
  int cadence;
  int speed;
  int gear;

  // 생성자로 변수를 초기화
  //Bicycle(this.cadence, this.speed, this.gear);
  // 위 코드가 아래 코드의 축약형이라고 할 수 있음
  Bicycle2(int cadence, int speed, int gear)
      : this.cadence = cadence,
        this.speed = speed,
        this.gear = gear;

  //@override
  //String toString() {
  //return 'Bicycle: $speed mph';
  //}

  @override
  String toString() => 'Bicycle: $speed mph';
}

void main() {
  //var bike = Bicycle(2, 0, 1);
  //var bikeByOverrideToString = Bicycle2(2, 0, 1);
  //group('Bicycle', () {
  //test('check bike', () {
  //print(bike);
  //expect(bike.toString(), equals('Instance of \'Bicycle\''));
  //});
  //test('check override method', () {
  //print(bikeByOverrideToString);
  //expect(bikeByOverrideToString.toString(), equals('Bicycle: 0 mph'));
  //});
  //});
  var bike = Bicycle(2, 0);
  test('check bike', () {
    print(bike);
    expect(bike.toString(), equals('Instance of \'Bicycle\''));
  });
}

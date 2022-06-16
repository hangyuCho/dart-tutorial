import 'dart:io';
import 'dart:math';
import 'package:test/test.dart';
import './forImport.dart';

void main() {
  // Language Samples
  helloWorld();
  variables();
  controlFlowStatements();
  functions();
  comments();
  import();
  classes();
  enums();
  inheritance();
  mixins();
  interfacesAndAbstractClasses();
  async();
  exceptions();
}

void helloWorld() {
  print('################################');
  print('# helloWorld');
  print('################################');
  print('Hello, World!');
  print('');
  print('');
  print('');
}

void variables() {
  print('################################');
  print('# variables');
  print('################################');
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': ['//path/to/saturn.jpg'],
  };
  print('name = $name');
  print('year = $year');
  print('antennaDiameter = $antennaDiameter');
  print('flybyObjects = $flybyObjects');
  print('image = $image');
  print('');
  print('');
  print('');
}

void controlFlowStatements() {
  print('################################');
  print('# controlFlowStatements');
  print('# if, for, while');
  print('################################');
  var year = 1977;
  var flybyObjects = ['Jupiter', 'Saturn', 'uranus', 'Neptune'];
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects) {
    print('foreach $object');
  }

  for (int month = 1; month <= 12; month++) {
    print('for $month');
  }

  while (year < 2016) {
    year += 1;
    print('while $year');
  }

  print('');
  print('');
  print('');
}

void functions() {
  print('################################');
  print('# functions');
  print('################################');
  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  var flybyObjects = ['Jupiter', 'Saturn', 'uranus', 'Neptune'];
  var result = fibonacci(20);
  print('function result = $result');
  flybyObjects.where((name) => name.contains('turn')).forEach(print);
  print('lamda function');
  print('');
  print('');
  print('');
}

void comments() {
  print('################################');
  print('# comments');
  print('################################');
  // comment 1
  /*
  multi line comment
  multi line comment
  multi line comment
  multi line comment
  multi line comment
  multi line comment
  */
  print('');
  print('');
  print('');
}

void import() {
  print('################################');
  print('# import');
  print('################################');
  // math
  int randam0To10 = Random().nextInt(10);
  print('randam0To10 = $randam0To10');
  // test
  group('String', () {
    test('.split()', () {
      var string = 'foo,bar,baz';
      expect(string.split(','), equals(['foo', 'bar', 'baz']));
    });
  });
  // forImport
  new forImport().forImportTest();

  print('');
  print('');
  print('');
}

void classes() {
  print('################################');
  print('# classes');
  print('################################');
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  DateTime now = DateTime.now();
  print('DateTime = $now');
  print('DateTime = ${DateTime(1977, 9, 5)}');
  print('difference1 = ${now.difference(DateTime(1977, 9, 5))}');
  print('difference2 = ${now.difference(DateTime(1977, 9, 5)).inDays}');
  print('difference3 = ${now.difference(DateTime(1977, 9, 5)).inDays ~/ 365}');
  print('example1 : ${16354 ~/ 365}');
  print('example2 : ${16354 / 365}');

  print('');
  print('');
  print('');
}

class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only
  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate) {}

  Spacecraft.unlaunched(String name) : this(name, null);

  // method

  void describe() {
    print('Spacecraft: $name');

    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void enums() {
  print('################################');
  print('# enums');
  print('################################');
  final myPlanet = Planet.earth;

  if (!myPlanet.isGiant) {
    print('not a "giant planet".');
  }
  print('');
  print('');
  print('');
}

enum PlanetType { terrestrial, gas, ice }

enum Planet {
  mercury(
    planetType: PlanetType.terrestrial,
    moons: 0,
    hasRings: false,
  ),
  earth(
    planetType: PlanetType.terrestrial,
    moons: 1,
    hasRings: false,
  ),
  venus(
    planetType: PlanetType.terrestrial,
    moons: 0,
    hasRings: false,
  ),
  uranus(
    planetType: PlanetType.ice,
    moons: 27,
    hasRings: true,
  ),
  neptune(
    planetType: PlanetType.ice,
    moons: 14,
    hasRings: true,
  );

  const Planet(
      {required this.planetType, required this.moons, required this.hasRings});

  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

void inheritance() {
  print('################################');
  print('# inheritance');
  print('################################');
  Orbiter orbiter = new Orbiter("", DateTime(1999, 12, 12), 10433.12);
  print('orbiter = $orbiter');
  print('');
  print('');
  print('');
}

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

void mixins() {
  print('################################');
  print('# mixins');
  print('################################');
  PillotedCraft pillotedCraft =
      new PillotedCraft("hoge", DateTime(1999, 10, 1));
  pillotedCraft.describeCrew();
  print('');
  print('');
  print('');
}

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('astronauts count = $astronauts');
  }
}

class PillotedCraft extends Spacecraft with Piloted {
  PillotedCraft(super.name, super.launchDate);
}

void interfacesAndAbstractClasses() {
  print('################################');
  print('# interfacesAndAbstractClasses');
  print('################################');
  new MockSpaceship(DateTime(1999, 10, 1), 'hogehoge').describe();
  new Desc().describeWithEmphasis();
  print('');
  print('');
  print('');
}

class MockSpaceship implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  String name;

  @override
  void describe() {
    print('MockSpaceship describe');
  }

  @override
  int? get launchYear => throw UnimplementedError();

  MockSpaceship(this.launchDate, this.name);
}

class Desc extends Describable {
  @override
  void describe() {
    print('Desc extends Describable');
  }
}

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('========');
    describe();
    print('========');
  }
}

void async() async {
  print('################################');
  print('# async');
  print('################################');
  print('async printWithDelay - start');
  printWithDelay('show message printWithDelay');
  print('async printWithDelay - end');

  print('async printWithDelay2 - start');
  printWithDelay2('show message printWithDelay2');
  print('async printWithDelay2 - end');

  print('async createDescriptions - start');
  createDescriptions(['A', 'B', 'C', 'D']);
  print('async createDescriptions - end');

  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  var stream = countStream(5);
  var sum = await sumStream(stream);

  var stream2 = report(voyager, ['A', 'B', 'C', 'D', 'E']);
  await for (var val in stream2) {
    print('report val = $val');
  }

  print('');
  print('');
  print('');
}

const oneSecond = Duration(seconds: 1);

Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);

  print('message = $message');
}

Future<void> printWithDelay2(String message) {
  return Future.delayed(oneSecond).then((_) {
    print(message);
  });
}

Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print('for $object. has update $modified');
        continue;
      }
      await file.create();
      await file.writeAsString('Start desc $object file.');
      print(file);
    } on IOException catch (e) {
      print('Can\'t create desc for $object: $e');
    }
  }
}

// 비동기
// async* / yield키워드 이용 및 비동기 합수 작성
// 1 ~ to까지 for반복문을 사용
// yield = return과는 달리 yield를 사용하면 함수는 반환 후 함수 내의 작업을 진행함.
// sumStream() 호출 시 값이 전달 될 때 마다 sum변수에 갑이 누적됨.
Stream<int> countStream(int to) async* {
  print('param to = $to');

  for (int i = 1; i <= to; i++) {
    yield i;
    print('countStream' 's yield');
  }

  for (int i = 1; i <= to; i++) {
    print('just for = ${i}');
  }
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (var val in stream) {
    print('sumStream = $val');
    sum += val;
  }
  return sum;
}

Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  // async* = yield사용의 의미
  print('report');
  for (final object in objects) {
    print('report = $object');
    //await Future.delayed(oneSecond);
    print('creftname = ${craft.name}');
    yield '${craft.name} flies by $object';
  }
}

void exceptions() async {
  print('################################');
  print('# exceptions');
  print('################################');
  var flybyObjects = ['Jupiter', 'Saturn', 'uranus', 'Neptune'];
  int astronauts = 0;
  if (astronauts == 0) {
    throw StateError('No astronauts.');
  }

  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Nothing Desc Object : $e');
  } finally {
    flybyObjects.clear();
  }
  print('');
  print('');
  print('');
}

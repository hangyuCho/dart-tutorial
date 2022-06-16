// 함수형 프로그래밍 샘플
//class WannabeFunction {
//String call(String a, String b, String c) => '$a $b $c!';
//}

//var wf = WannabeFunction();
//var out = wf('Hi', 'there,', 'gang');

//main() => print(out);

String scream(int length) => "A${'a' * length}h";

main() {
  final values = [1, 2, 3, 5, 10, 50];
  for (var length in values) {
    print(scream(length));
  }
  /*
  Aah
  Aaah
  Aaaah
  Aaaaaah
  Aaaaaaaaaaah
  Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah
  */

  //함수형으로 변환
  values.map(scream).forEach(print);
  /*
  Aah
  Aaah
  Aaaah
  Aaaaaah
  Aaaaaaaaaaah
  Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah
  */

  values.skip(1).take(3).map(scream).forEach(print);
  /*
  Aaah
  Aaaah
  Aaaaaah
  */
}

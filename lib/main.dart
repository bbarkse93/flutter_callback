import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// statefulWidget => 상태가 있는 위젯
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String childMessageContent = "여기는 부모 위젯 영역이야";

  // 자식들에게 함수를 전달
  // 매개 변수를 받을 수 있도록 설계하자
  // 함수의 설계모양이 변경 됨
  // (msg){}, --> String
  // (context){} --> BuildContext
  void onCallbackPressed(String msg){
    // 화면 랜더링
    // setState --> build()함수 다시 실행해!
    setState(() {
      childMessageContent = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("부모위젯에 빌드함수가 다시 호출 되니?");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(child: Center(child: Text(childMessageContent))),
              Expanded(flex: 1, child: ChildA(onCallback: onCallbackPressed,)),
              Expanded(flex: 1, child: ChildB(onCallback: onCallbackPressed,)),
            ],
          ),
        ),
      ),
    );
  }
}

class ChildA extends StatelessWidget {

  // 상태와 기능
  // final VoidCallback callback; //(String msg) {}
  // Function() x
  final Function(String msg) onCallback;


  const ChildA({
    required this.onCallback,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          onCallback('안녕 여기는 A');
        },
        child: Container(
          width: double.infinity,
          color: Colors.orange,
          child: const Center(
            child: Text('child A'),
          ),
        ),
      ),
    );
  }
}

class ChildB extends StatelessWidget {

  // final VoidCallback callback; // 이건 매개 변수가 없는 콜백 함수를 빠르게 사용하기 위함
  final Function onCallback;

  const ChildB({
    required this.onCallback,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap:
            () {
              onCallback('하이 여기는 어딜까?');
            },
        child: Container(
          width: double.infinity,
          color: Colors.red,
          child: const Center(
            child: Text('child B'),
          ),
        ),
      ),
    );
  }
}

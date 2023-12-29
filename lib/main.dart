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
  void onCallbackPressed(){

    // 화면 랜더링
    setState(() {
      childMessageContent = "자식에게 이벤트 발생 했네";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(child: Center(child: Text(childMessageContent))),
              Expanded(flex: 1, child: ChildA(callback: onCallbackPressed,)),
              Expanded(flex: 1, child: ChildB(callback: onCallbackPressed,)),
            ],
          ),
        ),
      ),
    );
  }
}

class ChildA extends StatelessWidget {

  // 상태와 기능
  final VoidCallback callback;

  const ChildA({
    required this.callback,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: callback,
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

  final VoidCallback callback;
  const ChildB({
    required this.callback,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: callback,
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

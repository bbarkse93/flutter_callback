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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(child: Center(child: Text(childMessageContent))),
              Expanded(flex: 1, child: ChildA()),
              Expanded(flex: 1, child: ChildB()),
            ],
          ),
        ),
      ),
    );
  }
}

class ChildA extends StatelessWidget {
  const ChildA({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          print('child A에 이벤트 발생');
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
  const ChildB({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          print('child B에 이벤트 발생');
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

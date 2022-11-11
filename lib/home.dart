import 'package:flutter/material.dart';
import 'detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DetailPage()));
        },
        child: const Text('go detail page'),
      )),
    );
  }

  void someEvent() {}
}

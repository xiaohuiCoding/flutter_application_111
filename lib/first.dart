import 'dart:developer';
import 'package:flutter/material.dart';
import 'detail.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第一页'),
        actions: [
          TextButton(
              onPressed: () {
                pushEventOne(context); // 带参数的函数调用方式一
              },
              child: const Text('push1',
                  style: TextStyle(color: Colors.white, fontSize: 18))),
          TextButton(
              onPressed: () => pushEventTwo(context), // 带参数的函数调用方式二
              child: const Text('push2',
                  style: TextStyle(color: Colors.white, fontSize: 18))),
        ],
      ),
      // body: Center(
      //     child: Image.asset(
      //   'images/2.0x/fish.png',
      //   width: 300,
      //   height: 300,
      //   fit: BoxFit.cover,
      // )),
      body: Center(
          child: Image.asset(
        'images/dashatars.webp',
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      )),
      // body: Center(
      //     child: Image.network(
      //   'http://g.hiphotos.baidu.com/image/pic/item/472309f790529822c4ac8ad0d5ca7bcb0a46d402.jpg',
      //   width: 300,
      //   height: 300,
      //   fit: BoxFit.cover,
      // )),
    );
  }

  void pushEventOne(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DetailPage()));
  }

  void pushEventTwo(context) {
    log('按钮被点击了');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DetailPage()));
  }
}

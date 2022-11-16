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
              child: const Text('事件1',
                  style: TextStyle(color: Colors.white, fontSize: 18))),
          TextButton(
              onPressed: () => pushEventTwo(context), // 带参数的函数调用方式二
              child: const Text('事件2',
                  style: TextStyle(color: Colors.white, fontSize: 18))),
          TextButton(
              onPressed: () => pushEventThree(context), // 带参数的函数调用方式二
              child: const Text('事件3',
                  style: TextStyle(color: Colors.white, fontSize: 18))),
        ],
      ),
      // 图片加载资源的几种方式：1.本地资源(需要在pubspec.yaml文件中显式的引用资源) 2.远程资源
      body: Center(
          child: Image.asset(
        // 'images/2.0x/fish.png',
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DetailPage()));
  }

  void pushEventThree(context) {
    log(logEvent());

    renderSome();
  }

  // 1.带返回值的常规函数
  String logEvent() {
    String str = 'hello world';
    return str;
  }

  // 2.执行异步操作的函数
  renderSome() {
    doSomeThing().then((value) {
      log(value);
    });
  }

  // 得到"Oh!"后，将"Oh!"修改为"Oh!my god!"
  doSomeThing() async {
    String str = await request();
    str = 'Oh!my god!';
    return str;
  }

  // 模拟等待两秒，返回"Oh"!
  request() async {
    await Future.delayed(const Duration(seconds: 1));
    return 'Oh!';
  }
}

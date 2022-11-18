import 'dart:developer';
import 'package:flutter/material.dart';
import 'detail.dart';
import 'detail2.dart';
import 'detail3.dart';
import 'detail4.dart';
import 'detail5.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          TextButton(
              onPressed: () {
                pushEvent(context); // 带参数的函数调用方式一
              },
              child: const Text('按钮',
                  style: TextStyle(color: Colors.white, fontSize: 18))),
          TextButton(
              onPressed: () => pushEvent2(context), // 带参数的函数调用方式二
              child: const Text('按钮',
                  style: TextStyle(color: Colors.white, fontSize: 18))),
          TextButton(
              onPressed: () => pushEvent3(context),
              child: const Text('按钮',
                  style: TextStyle(color: Colors.white, fontSize: 18))),
          TextButton(
              onPressed: () => pushEvent4(context),
              child: const Text('按钮',
                  style: TextStyle(color: Colors.white, fontSize: 18))),
          TextButton(
              onPressed: () => pushEvent5(context),
              child: const Text('按钮',
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

  void pushEvent(context) {
    // log(logEvent());
    // renderSome();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DetailPage()));
  }

  void pushEvent2(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DetailPage2()));
  }

  void pushEvent3(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DetailPage3()));
  }

  void pushEvent4(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DetailPage4()));
  }

  void pushEvent5(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DetailPage5()));
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

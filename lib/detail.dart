import 'dart:math';

import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('详情页'),
      ),
      body: const Center(
        // child: Text('show some detail info...'),
        child: MyButton(),
      ),
    );
  }
}

// 1.不可变的button组件
// class MyButton extends StatelessWidget {
//   const MyButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         log('MyButton was tapped!');
//       },
//       child: Container(
//         height: 50.0,
//         padding: const EdgeInsets.all(8.0),
//         margin: const EdgeInsets.symmetric(horizontal: 8.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(4.0),
//           color: Colors.lightGreen[500],
//         ),
//         child: const Center(
//           child: Text('这是一个Container实例，可以接收手势，点点看'),
//         ),
//       ),
//     );
//   }
// }

// 2.可变的button组件
class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  int _colorR = 0;
  int _colorG = 0;
  int _colorB = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _colorR = randomBetweenIntAndInt(0, 255);
          _colorG = randomBetweenIntAndInt(0, 255);
          _colorB = randomBetweenIntAndInt(0, 255);
        });
      },
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Color.fromRGBO(_colorR - 5, _colorG + 10, _colorB - 100, 1),
        ),
        child: const Center(
          child: Text('一个Container实例，可以接收手势，点击可以变色～'),
        ),
      ),
    );
  }

  // 在0-n(n是正整数)之间产生一个随机正整数
  int randomBetweenZeroAndInt(int n) {
    return Random().nextInt(n);
  }

  // 在任意两个正整数之间产生一个随机正整数
  int randomBetweenIntAndInt(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  // 在0.0-1.0之间产生一个随机小数
  double randomBetweenDouble() {
    return Random().nextDouble();
  }
}

import 'dart:math';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('处理手势'),
      ),
      body: const Center(
        // child: LessButton(),
        child: FulButton(),
      ),
    );
  }
}

// 1.不可变的button组件
class LessButton extends StatelessWidget {
  const LessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: const Color.fromRGBO(200, 200, 200, 1),
        ),
        child: const Center(
          child: Text('一个不可变Container的实例'),
        ),
      ),
    );
  }
}

// 2.可变的button组件
class FulButton extends StatefulWidget {
  const FulButton({super.key});

  @override
  State<FulButton> createState() => _FulButtonState();
}

class _FulButtonState extends State<FulButton> {
  int _colorR = 200;
  int _colorG = 200;
  int _colorB = 200;

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
          color: Color.fromRGBO(_colorR, _colorG, _colorB, 1),
        ),
        child: const Center(
          child: Text('一个可变Container的实例，可以接收手势，点点看！'),
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

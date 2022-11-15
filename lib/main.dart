import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter Project',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.black,
        ),
      ),

      home: const RandomWords(), // 设置导航栈的第一个页面

      // 配置各个页面具体的路由名，使用导航栈来跳转页面
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const RandomWords(), // 指定导航栈的第一个页面
      //   '/second': (context) => const SecondRoute(), // 注册其他页面到导航栈中
      // },

      // 方式一：直接传参
      routes: {
        SecondRoute.routeName: (context) => const SecondRoute(),
      },

      // 方式二：提取参数后再传
      // onGenerateRoute: (settings) {
      //   if (settings.name == SecondRoute2.routeName) {
      //     final args = settings.arguments as Arguments;
      //     return MaterialPageRoute(
      //       builder: (context) {
      //         return SecondRoute2(
      //           title: args.title,
      //           message: args.message,
      //         );
      //       },
      //     );
      //   }
      //   assert(false, 'Need to implement ${settings.name}');
      //   return null;
      // },
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My First Flutter Project'),
        actions: [
          IconButton(
            icon: const Icon(Icons.ac_unit),
            onPressed: _pushSecondPage,
            tooltip: 'Saved Suggestions',
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          final alreadySaved = _saved.contains(_suggestions[index]);

          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null,
              semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  _saved.remove(_suggestions[index]);
                } else {
                  _saved.add(_suggestions[index]);
                }
              });
            },
            onLongPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FirstPage()));
              // 1.基础样式的弹窗
              // showDialog(
              //     context: context,
              //     builder: (context) {
              //       return AlertDialog(
              //         title: const Text('提示'),
              //         content: Text(alreadySaved ? '您要取消收藏吗？' : '您要收藏吗？'),
              //         actions: [
              //           TextButton(
              //               onPressed: () {
              //                 Navigator.of(context).pop('cancel');
              //               },
              //               child: const Text('取消')),
              //           TextButton(
              //               onPressed: () {
              //                 Navigator.of(context).pop('cancel');
              //               },
              //               child: const Text('确认'))
              //         ],
              //         // elevation: 24,
              //         // shape: const CircleBorder(),
              //       );
              //     });

              // 2.iOS 样式的弹窗
              // showCupertinoDialog(
              //   context: context,
              //   builder: (context) {
              //     return CupertinoAlertDialog(
              //       title: const Text('提示'),
              //       content: Text(alreadySaved ? '您要取消收藏吗？' : '您要收藏吗？'),
              //       // content: const Icon(Icons.favorite_border),
              //       actions: <Widget>[
              //         CupertinoDialogAction(
              //           child: const Text('取消'),
              //           onPressed: () {
              //             Navigator.of(context).pop('cancel');
              //           },
              //         ),
              //         CupertinoDialogAction(
              //           child: const Text('确认'),
              //           onPressed: () {
              //             setState(() {
              //               if (alreadySaved) {
              //                 _saved.remove(_suggestions[index]);
              //               } else {
              //                 _saved.add(_suggestions[index]);
              //               }
              //             });
              //             Navigator.of(context).pop('ok');
              //           },
              //         ),
              //       ],
              //     );
              //   },
              // );
            },
          );
        },
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('我的收藏'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  void _pushSecondPage() {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const SecondRoute()));

    // Navigator.pushNamed(context, '/second');

    Navigator.pushNamed(context, SecondRoute.routeName,
        arguments: Arguments('我是传过来的标题', '我是传过来的消息'));

    // Navigator.pushNamed(context, SecondRoute2.routeName,
    //     arguments: Arguments('我是传过来的标题', '我是传过来的消息'));
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});
  static const routeName = '/second';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(args.message),
      )),
    );
  }
}

class SecondRoute2 extends StatelessWidget {
  static const routeName = '/second';
  final String title;
  final String message;
  const SecondRoute2({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(message),
      )),
    );
  }
}

// 需要传递的参数
class Arguments {
  final String title;
  final String message;
  Arguments(this.title, this.message);
}

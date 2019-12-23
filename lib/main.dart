// 导入库
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/**
 *  入口函数
 */
void main() => runApp(new MyApp());
/**
 * 定义一个 MyApp Widget
 */
class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        //    final wordPair = new WordPair.random();
        return new MaterialApp(
            title: 'Welcome to Flutter',
            home: new RandomWords(),
            theme: ThemeData(
                primaryColor: Colors.blue,
            ),
//          home: new Scaffold(
//            appBar: new AppBar(
//              title: new Text('Welcome to Flutter'),
//            ),
//            body: new Center(
//        //          child: new Text( 'Hello World'),
//              child: new RandomWords(),
//            ),
//          ),
        );
    }
}

class RandomWords extends StatefulWidget {
    @override
    createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
    final _suggestions = <WordPair>[];

    final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text("Startup Name Generator"),
            ),
//            body: _buildSuggestions(),
            body:
//                Text(
//                    "Hello World",
//                    style: TextStyle(
//                        color: Colors.red,
//                        fontSize: 20.0,
//                        background: new Paint()..color = Colors.yellow,
//                        decorationStyle: TextDecorationStyle.solid,
//                        decoration: TextDecoration.lineThrough,
//                    ),
//                ),
//                 RichText(
//                    text: TextSpan(children: [
//                        TextSpan(text: "Hello", style: TextStyle(color: Colors.blue,fontSize: 20)),
//                        TextSpan(text: "Flutter", style: TextStyle(color: Colors.red))
//                    ]),
//                ),
//                backgroundColor: Colors.teal,
//                Image.asset("images/home_checked.png",fit: BoxFit.cover),
//                Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557781801455&di=17f9f2fc3ded4efb7214d2d8314e8426&imgtype=0&src=http%3A%2F%2Fimg2.mukewang.com%2F5b4c075b000198c216000586.jpg",fit: BoxFit.cover),
//                Icon(
//                    Icons.android,
//                    size: 50.0,
//                    color: Colors.green,
//                ),
                TextField(
                    onChanged: (String data) {
                        print(data);
                    },
                ),

        );
    }
    Widget _buildSuggestions() {
        return new ListView.builder(
            padding: const EdgeInsets.all(16.0),
            // .all 对每一个单词都调用一个itemBuilder，然后将单词对添加到ListTile行中
            // 在偶数行，该函数会为单词对添加一个ListTile row
            // 在奇数行 添加分割线
            itemBuilder: (content, i) {
                // 每一行之前 添加一个1像素的分割线widget
                if(i.isOdd){
                    return new Divider();
                }
                // "i ~/ 2" 表示i除以2，但返回的是整形，向下取整
                final index = i ~/ 2;

                // 如果是建议列表中最后一个单词对
                if(index >= _suggestions.length) {
                    // 接着再生成10个单词对，然后添加到建议列表
                    _suggestions.addAll(generateWordPairs().take(10));
                }
                return _buildRow(_suggestions[index]);
            },
        );
    }

    Widget _buildRow(WordPair pair) {
        return new ListTile(
            title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
            ),
        );
    }
}

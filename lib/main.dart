import 'package:circular_widgets/circular_widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          // alignment: Alignment.centerLeft,
          // color: Colors.orange,
          width: mq.height * .4,
          height: mq.height * .3,
          child: Transform.translate(
            offset: Offset(mq.height * -.075, 0),
            child: CircularWidgets(
              innerSpacing: mq.height * .035,
              radiusOfItem: mq.height * .135,
              centerWidgetRadius: mq.height / 4,
              itemsLength: 9,
              itemBuilder: (context, index) {
                if (index < 4) {
                  return testButton(index.toString());
                } else {
                  return Container(
                    color: Colors.transparent,
                  );
                }
                // switch (index) {
                //   case 0:
                //     return testButton('0');
                //   case 1:
                //     return testButton('1');
                //   case 2:
                //     return testButton('2');
                //   case 3:
                //     return testButton('3');

                //   default:
                //     return Container(
                //       color: Colors.transparent,
                //     );
                // }
                // return Container(
                //   width: 10,
                //   height: 10,
                //   decoration:
                //       BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                // );
              },
              centerWidgetBuilder: (context) {
                return testButton('Center Button');
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget testButton(String text) {
  // ignore: avoid_print, prefer_const_constructors
  return GestureDetector(
    onTap: () =>
        // ignore: avoid_print
        print('Pressed${int.tryParse(text) != null ? ' Index' : ''}: $text'),
    child: Container(
      // width: 200,
      alignment: Alignment.center,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
      child: Center(
        child: Text(
          text,
          // ignore: prefer_const_constructors
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

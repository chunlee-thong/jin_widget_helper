import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jin Widget Helper',
      navigatorKey: JinNavigator.navigatorKey,
      theme: ThemeData(
        primarySwatch: JinColorUtils.hexColorToMaterialColor(0xff08f7ff),
        buttonColor: Colors.red,
        typography: Typography.material2018(),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with FormPageMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jin Widget Helper Example"),
      ),
      body: Column(
        children: [
          JinMediaCard(
            onTap: () => {},
            mediaFlexSize: 2,
            height: (screenSize) => screenSize.width / 3,
            mediaBuilder: MediaBuilder(
              child: Image.network(
                JinUtils.randomStringImage(),
                fit: BoxFit.cover,
              ),
              color: Colors.black12,
              width: (screenWidth) => screenWidth / 3,
            ),
            infoBuilder: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello Mark"),
                Text(
                    "Hello mark description long text that i want to say Hello mark description long text that i want to say"),
                Text("Nice mark"),
                Text("Nice mark"),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return JinMediaCard(
                  alignment: Axis.vertical,
                  onTap: () => {},
                  height: (screenSize) => 0,
                  mediaBuilder: MediaBuilder(
                    child: Image.network(
                      JinUtils.randomStringImage(),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.black12,
                    width: (screenWidth) => screenWidth,
                  ),
                  infoBuilder: Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(Random().nextInt(4), (index) {
                          return Text("Hello Mark");
                        })
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

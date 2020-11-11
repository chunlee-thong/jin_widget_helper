import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:jin_widget_helper_example/examples/dialog_sheet_example.dart';
import 'package:jin_widget_helper_example/examples/form_mixin_example.dart';
import 'package:jin_widget_helper_example/examples/future_stream_handler_example.dart';
import 'package:jin_widget_helper_example/examples/jin_accordion_and_jin_expandable_card.dart';
import 'package:jin_widget_helper_example/examples/jin_extension_example.dart';
import 'package:jin_widget_helper_example/examples/jin_loading_button_example.dart';
import 'package:jin_widget_helper_example/examples/jin_media_card_example.dart';
import 'package:jin_widget_helper_example/examples/other_button_example.dart';
import 'package:jin_widget_helper_example/examples/other_widget_example.dart';
import 'package:jin_widget_helper_example/examples/paginated_widget_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jin Widget Helper',
      navigatorKey: JinNavigator.navigatorKey,
      theme: ThemeData(
        primarySwatch: JinColorUtils.hexColorToMaterialColor(0xFF047AD8),
        typography: Typography.material2018(),
        buttonColor: Colors.green,
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
  void onViewPage(Widget page) {
    PageNavigator.push(context, page);
  }

  final List<ExampleButton> examples = [
    ExampleButton(
        name: "JinLoadingButton example", child: JinLoadingButtonExample()),
    ExampleButton(
        name: "Other Buttons example example", child: OtherButtonExample()),
    ExampleButton(name: "JinExtension Example", child: JinExtensionExample()),
    ExampleButton(name: "JinMediaCardExample", child: JinMediaCardExample()),
    ExampleButton(
        name: "FutureHandler and StreamHandler",
        child: FutureAndStreamHandlerExample()),
    ExampleButton(
        name: "JinAccordion and JinExpandableCard",
        child: JinAccordionAndJinExpandable()),
    ExampleButton(
        name: "Dialog And BottomSheet example", child: DialogAndSheetExample()),
    ExampleButton(
        name: "Paginated Widget Example", child: PaginatedWidgetExample()),
    ExampleButton(name: "Others Widget Example", child: OtherWidgetsExample()),
    ExampleButton(name: "Form Mixin Example", child: FormPageMixinExample()),
  ];

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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: examples.map((example) {
            return ActionButton(
              child: Text(example.name),
              margin: EdgeInsets.only(top: 16),
              onPressed: () => onViewPage(example.child),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ExampleButton {
  String name;
  Widget child;

  ExampleButton({this.name, this.child});
}

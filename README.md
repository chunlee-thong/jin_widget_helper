# jin_widget_helper

[![pub package](https://img.shields.io/badge/pub-1.5.1-blueviolet.svg)](https://pub.dev/packages/jin_widget_helper)

A package that contain many UI and Utility helper that help decrease your development time on creating custom Widget.

# Installation

Add this to pubspec.yaml

```dart
dependencies:
  jin_widget_helper: ^1.5.1
```

# Widgets

| Widget                                     | Description                                                             |
| ------------------------------------------ | ----------------------------------------------------------------------- |
| [ActionButton][otherbuttonurl]             | A Simple RaisedButton with loading notifier                             |
| [BadgeButton][otherbuttonurl]              | A small icon button with badge (like notification badge)                |
| [CupertinoOptionActionSheet][sheet-dialog] | A Cupertino bottom sheet with option                                    |
| [ConditionalWidget][other]                 | Provide a widget base on condition true or false                        |
| [ConnectionChecker][other]                 | A widget to check internet connection and provide onNoInternet callback |
| [CustomBackButton][otherbuttonurl]         | A custom back button with title (header)                                |
| [FutureHandler][streamfutureurl]           | A FutureBuilder with less boilerplate code                              |
| [JinAccordian][accordin-expandable]        | A customizable ExpansionTile                                            |
| [JinExpandable][accordin-expandable]       | A widget that can be toggle with top and bottom widget                  |
| [JinConfirmationDialog][sheet-dialog]      | A dialog with cancel and confirm action                                 |
| [JinMediaCard][jinmediacardurl]            | A customizable Card with media                                          |
| [JinLoadingButton][jinloadingbuttonurl]    | A Loading button without using ValueNotifier                            |
| [JinLoadingDialog][sheet-dialog]           | A Class for showing dialog                                              |
| [JinPlatformChecker][other]                | Provide a widget base on Android or iOS platform                        |
| [JinSimpleDialog][sheet-dialog]            | A simple alert dialog                                                   |
| [MiniListTile][other]                      | An easy customizable ListTile                                           |
| [PaginatedListView][paginated]             | A Listview.separated with pagination support                            |
| [PaginatedGridView][paginated]             | A Gridview.builder with pagination support                              |
| [SmallIconButton][otherbuttonurl]          | A small alternative to Flutter's IconButton                             |
| [SmallFlatButton][otherbuttonurl]          | A small alternative to Flutter's FlatButton                             |
| [SpaceX][other]                            | SizedBox with only width                                                |
| [SpaceY][other]                            | SizedBox with only height                                               |
| [StreamHandler][streamfutureurl]           | A Streambuilder with less boilerplate code                              |
| [ValueObserver][other]                     | A ValueListenableBuilder with lest boilerplate code                     |

[jinloadingbuttonurl]: https://github.com/chunlee-thong/jin_widget_helper/blob/dev/example/lib/examples/jin_loading_button_example.dart
[otherbuttonurl]: https://github.com/chunlee-thong/jin_widget_helper/blob/dev/example/lib/examples/other_button_example.dart
[jinmediacardurl]: https://github.com/chunlee-thong/jin_widget_helper/blob/dev/example/lib/examples/jin_media_card_example.dart
[streamfutureurl]: https://github.com/chunlee-thong/jin_widget_helper/blob/dev/example/lib/examples/future_stream_handler_example.dart
[accordin-expandable]: https://github.com/chunlee-thong/jin_widget_helper/blob/dev/example/lib/examples/jin_accordion_and_jin_expandable_card.dart
[sheet-dialog]: https://github.com/chunlee-thong/jin_widget_helper/blob/dev/example/lib/examples/dialog_sheet_example.dart
[paginated]: https://github.com/chunlee-thong/jin_widget_helper/blob/dev/example/lib/examples/paginated_widget_example.dart
[other]: https://github.com/chunlee-thong/jin_widget_helper/blob/dev/example/lib/examples/other_widget_example.dart

# Mixin

### AfterBuildMixin

```dart
class _HomePageState extends State<NewPage> with AfterBuildMixin {

  //this method will call after widget has been build
  @override
  void afterBuild(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

```

### FormMixin

#### field and attribute

- **formKey**: a key for form
- **loadingNotifier**: a bool ValueNotifier
- **passwordObsecureNotifier**: a bool ValueNotitifer for toggling password obsecure field
- **isFormValidated**: a bool return by validate **formKey**

#### method

- **toggleLoading**: toggle _loadingNotifier_
- **togglePasswordObsecure**: toggle _passwordObsecureNotifier_

```dart
class _HomePageState extends State<NewPage> with FormMixin {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

```

# Widget's Extension

### padding, margin

```dart
Text("Hello Flutter").padding(EdgeInsets.all(16.0)) // defaulat value is EdgeInsets.all(8.0)
Text("Hello Flutter").margin(EdgeInsets.all(16.0)) // defaulat value is EdgeInsets.all(8.0)
///As a value
Text("Hello Flutter").marginValue(all: 12)
Text("Hello Flutter").paddingValue(horizontal: 12, vertical: 8)
```

### cssSpacing

```dart
Text("Hello Flutter").cssSpacing(margin: [10,10], padding:[16])
//css margin and padding rule
```

### rotate (in degree)

```dart
Text("Hello Flutter").rotate(45)
```

### flexible, expanded, clipOval, opacity

```dart
Text("Hello Flutter").flexible
Text("Hello Flutter").expanded
Text("Hello Flutter").clipOval
Text("Hello Flutter").opacity(0.5)
```

# TextStyle Extention

```dart
Text("Hello Flutter", style: TextStyle().normal)
Text("Hello Flutter", style: TextStyle().medium)
Text("Hello Flutter", style: TextStyle().bold)
Text("Hello Flutter", style: TextStyle().applyColor(Colors.white))
Text("Hello Flutter", style: TextStyle().applFontSize(24))
```

# Other Extension

### DateTime extension

```dart
DateTime.now().format("dd mmm yyyy")
DateTime.now().isTheSameDay(DateTime.now())
DateTime.now().formatToLocalDate("dd mmm yyyy")
```

### String extension

```dart
String name = "chunlee".capitalize() // => Chunlee
```

### Object extension

```dart
var count = 1.obs<int>();
//equivalent to: ValueNotifier count = ValueNotifier<int>(1);
```

# Utility Class

### ColorUtils

```dart
Color green = ColorUtils.getColorFromCode("42f545")
Color newColor = ColorUtils.fromRGB(8, 182, 155)
MaterilColor newMaterialColor = ColorUtils.hexColorToMaterialColor(0xFF869CF4)
```

### JinUtils

```dart
Future<Uint8List> imageByte = await JinUtils.getBytesFromAsset("image asset path", 200); //200 is imagewidth
String carUrlImage =  JinUtils.randomCategoryStringImage(dimension: 200, category: "car"); //get image url with given dimension and category
String randomUrlImage = JinUtils.randomStringImage(200); //get random image url with given dimension
```

### FormValidator

```dart
TextFormField(
validator: (value) => JinFormValidator.validateEmail(value),
// check JinValidator class for more field validator
)
```

### PageNavigator and JinNavigator

PageNavigator support push, pushReplacement and pushAndRemove method

```dart
PageNavigator.push(context, DetailPage());
PageNavigator.pushReplacement(context, HomePage());
PageNavigator.pushAndRemove(context, RootPage());
```

JinNavigator also support push, pushReplacement, pushAndRemove without providing a context but you need to add **JinNavigator.navigatorKey** to MaterialApp

```dart
MaterialApp(
    ...
    navigatorKey: JinNavigator.navigatorKey,
    ...
    home: MyHomePage(),
)
```

```dart
JinNavigator.push(DetailPage());
JinNavigator.pushReplacement(HomePage());
JinNavigator.pushAndRemove(RootPage());
```

**JinNavigator also can show dialog without providing a context**

```dart
var result = await JinNavigator.dialog(MyDialog());
```

### JinWidget

```dart
RoundedRectangleBorder roundRectangle = JinWidget.roundRect(12);
BorderRadius radius = JinWidget.radius(12); //default value is 8
```

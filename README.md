# jin_widget_helper

[![pub package](https://img.shields.io/badge/pub-1.3.9-blueviolet.svg)](https://pub.dev/packages/jin_widget_helper)

A package that contain many UI and Utility helper that help decrease your development time on creating custom Widget.

# Installation

Add this to pubspec.yaml

```dart
dependencies:
  jin_widget_helper: ^1.3.9
```

# Widgets

| Widget                | Description                                                             |
| --------------------- | ----------------------------------------------------------------------- |
| ActionButton          | A Simple RaisedButton with loading notifier                             |
| BadgeButton           | A small icon button with badge (like notification badge)                |
| ChoiceBottomSheet     | A Cupertino bottom sheet                                                |
| ConditionalWidget     | Provide a widget base on condition true or false                        |
| ConnectionChecker     | A widget to check internet connection and provide onNoInternet callback |
| CustomBackButton      | A custom back button with title (header)                                |
| FutureHandler         | A FutureBuilder with less boilerplate code                              |
| JinAccordian          | A customizable ExpansionTile                                            |
| JinConfirmationDialog | A dialog with cancel and confirm action                                 |
| JinPlatformChecker    | Provide a widget base on Android or iOS platform                        |
| JinSimpleDialog       | A simple alert dialog                                                   |
| MiniListTle           | An easy customizable ListTile                                           |
| SmallIconButton       | A small alternative to Flutter's IconButton                             |
| SmallFlatButton       | A small alternative to Flutter's FlatButton                             |
| SpaceX                | SizedBox with width (equivalent to JinWidget.horizontalSpace())         |
| SpaceY                | SizedBox with height (equivalent to JinWidget.verticalSpace())          |
| StreamHandler         | A Streambuilder with less boilerplate code                              |
| ValueObserver         | A ValueListenableBuilder with lest boilerplate code                     |

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
String name = "chunlee".firstUpperCase() // => Chunlee
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
JinWidget.verticalSpace(12) //A SizedBox with value as height, default value is 8
JinWidget.horizontalSpace(16) //A SizedBox with value as width, default value is 8
RoundedRectangleBorder roundRectangle = JinWidget.roundRect(12);
BorderRadius radius = JinWidget.radius(12); //default value is 8
```

# Todo

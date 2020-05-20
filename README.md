# jin_widget_helper

A package that contain many UI and Utility helper that help decrease your development time on creating custom Widget.

# Widgets

| Widget               | Description                                                             |
| -------------------- | ----------------------------------------------------------------------- |
| ActionButton         | A Simple RaisedButton with loading notifier                             |
| BadgeButton          | A small icon button with badge (like notification badge)                |
| ConnectionChecker    | A widget to check internet connection and provide onNoInternet callback |
| CustomBackButton     | A custom back button with title (header)                                |
| GeneralMessageDialog | A simple alert dialog                                                   |
| SmallIconButton      | A small alternative to Flutter's IconButton                             |
| StreamHandler        | A Streambuilder with less boilerplate code                              |
| FutureHandler        | A FutureBuilder with less boilerplate code                              |
| ChoiceBottomSheet    | A Cupertino bottom sheet                                                |
| MiniListTle          | An easy customizable ListTile                                           |
| ValueHandler         | A ValueListenableBuilder with lest boilerplate code                     |
| SpaceX               | SizedBox with width (equivalent to UIHelper.horizontalSpace())          |
| SpaceY               | SizedBox with height (equivalent to UIHelper.verticalSpace())           |

# Widget's Extension

### padding, margin

```dart
Text("Hello Flutter").padding(EdgeInsets.all(8.0)) // defaulat value is EdgeInsets.all(8.0)
Text("Hello Flutter").margin(EdgeInsets.all(8.0)) // defaulat value is EdgeInsets.all(8.0)
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

# Utility Class

### ColorUtils

```dart
Color green = ColorUtils.getColorFromCode("42f545")
Color newColor = ColorUtils.fromRGB(8, 182, 155)
MaterilColor newMaterialColor = ColorUtils.hexColorToMaterialColor(0xFF869CF4)
```

### FormValidator

```dart
TextFormField(
validator: (value) => JinFormValidator.validateEmail(value, context),
// there are mor validator
)
```

### PageNavigator

```dart
PageNavigator.push(context, DetailPage());
PageNavigator.pushReplacement(context, HomePage());
PageNavigator.pushAndRemove(context, RootPage());
```

### JinWidget

```dart
JinWidget.verticalSpace(12) //A SizedBox with value as height, default value is 8
JinWidget.horizontalSpace(16) //A SizedBox with value as width, default value is 8
Future<Uint8List> imageByte = await JinWidget.getBytesFromAsset("image asset path", 200); //200 is imagewidth
RoundedRectangleBorder roundRectangle = JinWidget.roundRect(12);
BorderRadius radius = JinWidget.radius(12); //default value is 8
```

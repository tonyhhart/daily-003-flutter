import 'package:daily_003_flutter/navigation/tab_navigator.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => const TabNavigator(),
};

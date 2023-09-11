import 'package:bluelogic/pages/my_home_page.dart';
import 'package:bluelogic/pages/my_login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const MyLoginPage(),
  '/home': (context) => const MyHomePage(),
};
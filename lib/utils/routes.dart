import 'package:flutter/material.dart';
import 'package:suitmedia/screens/LoginPage/loginpage.dart';
import 'package:suitmedia/screens/homepage/homepage.dart';
import 'package:suitmedia/screens/userspage/userspage.dart';
import 'package:suitmedia/screens/websitepage/websitepage.dart';

class Routes {
  Map<String, WidgetBuilder> getRoutes = {
    '/': (_) => LoginPage(),
    '/home': (_) => HomePage(),
    '/users': (_) => UsersPage(),
    '/website': (_) => WebsitePage(),
  };
}

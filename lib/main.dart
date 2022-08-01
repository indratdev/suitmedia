import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/statemanagement/listUserbloc/list_users_bloc.dart';
import 'package:suitmedia/statemanagement/newUserbloc/newuser_bloc.dart';
import 'package:suitmedia/statemanagement/palindrome_bloc/palindrome_bloc.dart';
import 'package:suitmedia/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PalindromeBloc(),
        ),
        BlocProvider(
          create: (context) => NewuserBloc(),
        ),
        BlocProvider(
          create: (context) => ListUsersBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Routes().getRoutes,
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2/core/models/tasks_modek.dart';
import 'package:task2/main_screen.dart';
import 'package:task2/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final SharedPreferences prefs = await SharedPreferences.getInstance();

  // String? tasks = prefs.getString('tasks');
  // Map<String, dynamic> value = jsonDecode(tasks!);
  // TasksModel model = TasksModel.fromMap(value);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? username;
  @override
  void initState() {
    super.initState();

    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff181818),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xff181818),
          selectedItemColor: Color(0xff15B86C),
          unselectedItemColor: Color(0xffC6C6C6),
          type: BottomNavigationBarType.fixed,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Color(0xffC6C6C6),
            fontWeight: FontWeight.w400,
          ),
          displaySmall: TextStyle(
            color: Color(0xffffffff),
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
          displayMedium: TextStyle(
            color: Color(0xffFFFCFC),
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            color: Color(0xffffffff),
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff15B86C)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Color(0xff282828),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        switchTheme: SwitchThemeData(
          trackColor: WidgetStateProperty.resolveWith<Color?>((Set states) {
            if (states.contains(WidgetState.selected)) {
              return Color(0xff15B86C);
            }
            return Colors.white;
          }),
          thumbColor: WidgetStateProperty.resolveWith<Color?>((Set states) {
            if (states.contains(WidgetState.selected)) {
              return Color(0xffFFFCFC);
            }
            return Colors.grey;
          }),
          trackOutlineWidth: WidgetStateProperty.resolveWith<double?>((
            Set states,
          ) {
            if (states.contains(WidgetState.selected)) {
              return 2.0;
            }
            return 0.0;
          }),
        ),
      ),
      home: (username?.isEmpty ?? true) ? Welcome() : MainScreen(),
    );
  }

  void getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedname = prefs.getString('username');

    setState(() {
      username = storedname;
    });
  }
}

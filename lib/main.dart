import 'package:calc/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) {
  runApp(new CalApp());
}

class CalApp extends StatefulWidget {
  const CalApp({super.key});

  @override
  State<CalApp> createState() => _CalAppState();
}

class _CalAppState extends State<CalApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: ScreenUtil.defaultSize,
        builder: ((context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: Home(),
          );
        }));
  }
}

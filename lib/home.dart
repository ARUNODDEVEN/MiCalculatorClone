import 'package:calc/calculations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'buttons.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Calculations c = Get.put(Calculations());

  bool _isoperator(String x) {
    if (x == '%' || x == '-' || x == '+' || x == '=' || x == '*' || x == '/') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
                child: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      child: Text(
                        c.question.value,
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 100.h,
                    alignment: Alignment.centerRight,
                    width: double.infinity,
                    child: Obx(
                      () => Text(
                        c.answer.value,
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                    color: Colors.black,
                  ),
                ],
              ),
            )),
            Expanded(
                flex: 2,
                child: Container(
                  child: GridView.builder(
                      itemCount: c.numbers.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (context, int index) {
                        if (index == 0) {
                          return Mybutton(
                            ontap: () {
                              c.question.value = '';
                            },
                            Color: Colors.black,
                            TextColor: Color.fromARGB(255, 255, 133, 34),
                            ButtonText: c.numbers[index].toString(),
                          );
                        } else if (index == 1) {
                          return Mybutton(
                              ontap: () {
                                c.del();
                              },
                              Color: Colors.black,
                              TextColor: Color.fromARGB(255, 255, 133, 34),
                              ButtonText: c.numbers[index].toString());
                        } else if (index == c.numbers.length - 1) {
                          return Mybutton(
                              ontap: () {
                                c.equlPressed();
                              },
                              Color: Colors.black,
                              TextColor: Color.fromARGB(255, 255, 133, 34),
                              ButtonText: c.numbers[index].toString());
                        } else if (index == 16) {
                          return Mybutton(
                              ontap: () {
                                c.equlPressed();
                              },
                              Color: Colors.black,
                              TextColor: Color.fromARGB(255, 255, 133, 34),
                              ButtonText: c.numbers[index].toString());
                        } else {
                          ///////////////////////////////////////////////QUESTION?//////////////////////////////////////////
                          return Mybutton(
                              ontap: () {
                                c.qus(index);
                              },
                              Color: Colors.black,
                              TextColor:
                                  _isoperator(c.numbers[index].toString())
                                      ? Color.fromARGB(255, 255, 133, 34)
                                      : Colors.white,
                              ButtonText: c.numbers[index].toString());
                        }
                      }),
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}

import "dart:ffi";

import "package:flutter/material.dart";

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});
  @override
  State<MainApp> createState() {
    return MainAppState();
  }
}

class MainAppState extends State<MainApp> {
  late double size;

  String inputValue = "";
  String calculatedValue = "";
  String operator = "";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                inputValue,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                ),
              ),
            ),
            Row(
              children: [
                calcButton("7", Colors.white38),
                calcButton("8", Colors.white38),
                calcButton("9", Colors.white38),
                calcButton("/", Colors.orange),
              ],
            ),
            Row(
              children: [
                calcButton("4", Colors.white38),
                calcButton("5", Colors.white38),
                calcButton("6", Colors.white38),
                calcButton("*", Colors.orange),
              ],
            ),
            Row(
              children: [
                calcButton("1", Colors.white38),
                calcButton("2", Colors.white38),
                calcButton("3", Colors.white38),
                calcButton("-", Colors.orange),
              ],
            ),
            Row(
              children: [
                calcButton("0", Colors.white38),
                calcButton(".", Colors.white38),
                calcButton("=", Colors.orange),
                calcButton("+", Colors.orange),
              ],
            ),
            calcButton("Clear", Colors.black),
          ],
        ),
      ),
    );
  }

  Widget calcButton(String text, Color bgColor) {
    return InkWell(
      onTap: () {
        setState(() {
          text == "Clear"
              ? {
                  inputValue = "",
                  operator = "",
                  calculatedValue = "",
                }
              : text == "+" || text == "-" || text == "*" || text == "/"
                  ? {
                      calculatedValue = inputValue,
                      operator = text,
                      inputValue = "",
                    }
                  : text == "=" && calculatedValue != ""
                      ? {
                          if (operator == "+")
                            {
                              inputValue = (double.parse(calculatedValue) +
                                      double.parse(inputValue))
                                  .toString()
                            }
                          else if (operator == "-")
                            {
                              inputValue = (double.parse(calculatedValue) -
                                      double.parse(inputValue))
                                  .toString()
                            }
                          else if (operator == "*")
                            {
                              inputValue = (double.parse(calculatedValue) *
                                      double.parse(inputValue))
                                  .toString()
                            }
                          else if (operator == "/")
                            {
                              inputValue = (double.parse(calculatedValue) /
                                      double.parse(inputValue))
                                  .toString()
                            }
                          else
                            {1},
                          operator = "",
                        }
                      : text == "=" && calculatedValue == ""
                          ? 1
                          : inputValue = inputValue + text;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.all(8),
        alignment: Alignment.center,
        height: size,
        width: size,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

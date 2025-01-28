import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    home: SafeArea(child: Text("Hello World")),
    debugShowCheckedModeBanner: false,
  ));
}

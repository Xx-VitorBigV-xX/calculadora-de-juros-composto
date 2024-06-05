import 'package:flutter/material.dart';

class MyTextFild extends StatelessWidget{
  final controller;
  final String hintText;
  final bool obscureText;
  const MyTextFild({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context){
    return    Padding(
      padding:const EdgeInsets.symmetric(horizontal: 255.0),
      child: TextField(
        controller:controller,
        obscureText: obscureText,
        decoration:InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:BorderSide(color:Colors.blue)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color: Colors.orange)
            ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText
        ),
      ),
    );
  }
}
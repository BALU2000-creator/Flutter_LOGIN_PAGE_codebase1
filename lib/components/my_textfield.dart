import 'package:flutter/material.dart';  double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;


class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      stepWidth: 400,
      child: TextField(
                controller: controller,
                obscureText: obscureText,
                
                decoration: InputDecoration(
                  enabledBorder:  const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
            
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.white,
                  filled : true,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey[300]),
                )
                ,
              ),
    );
  }
}

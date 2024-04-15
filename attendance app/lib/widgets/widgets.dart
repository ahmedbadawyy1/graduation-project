import 'package:flutter/material.dart';
const textInputDecoration = InputDecoration(
  filled: true,
 // fillColor: Colors.transparent,
  fillColor: Color(4292275656),
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
        Radius.circular(40)
    ),
    borderSide: BorderSide(color: Color(4292275656),width: 2),

  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(4292275656),width: 2),
    borderRadius: BorderRadius.all(
        Radius.circular(40)
    ),

  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(4292275656),width: 2),
    borderRadius: BorderRadius.all(
        Radius.circular(40)
    ),

  ),
);
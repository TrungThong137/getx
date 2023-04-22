import 'package:flutter/material.dart';

Widget inputWidget({required lable, required hintText, required controller}){
  return Container(
    padding:const EdgeInsets.all(10),
    child: TextField(
      decoration: InputDecoration(
        labelText: lable,
        hintText: hintText,
        border:const OutlineInputBorder(),
      ),
      controller: controller,
    ),
  );
}

Widget informationWidget({required lable, required content}){
  return Container(
    padding:const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(lable),
        ),
        Expanded(
          flex: 1,
          child: Text(content),
        )
      ],
    ),
  );
}

Widget buttonWidget({required lable, required colorButton, required colorText, required onPress}){
  return GestureDetector(
    onTap: onPress,
    child: Container(
      margin:const EdgeInsets.only(top: 20),
      padding:const EdgeInsets.only(top: 15, bottom: 15, right: 40, left: 40),
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        lable,
        style: TextStyle(
          color: colorText,
          fontSize: 15
        ),
      ),
    ),
  );
}
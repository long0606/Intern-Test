import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String? hintText;
  final Widget? widget;
  final Color? color;
  final TextInputType? type;
  final TextEditingController? controller;
  MyInputField({
    Key? key,
    this.hintText,
    required this.title,
    this.widget,
    this.controller,
    this.color,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xffD1D2D4))),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                width: 200,
                child: TextField(
                  keyboardType: type,
                  readOnly: widget==null?false:true,
                  controller: controller,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: color ?? const Color(0xffD1D2D4),
                    ),
                  ),
                ),
              ),
              widget==null?Container():Container(child: widget,)
            ],
          ),
        ),
      ],
    );
  }
}

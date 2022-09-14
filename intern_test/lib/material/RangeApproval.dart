import 'package:flutter/material.dart';

class Range extends StatelessWidget {
  final String title;
  final String hintText;
  final Color? color;
  final TextEditingController? controller;
  Range({
    Key? key,
    required this.title,
    required this.hintText,
    this.color,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
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
                  width: 48,
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text('IDR',
                    style: TextStyle(
                    color: Colors.black
                  ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: 200,
                  child: TextField(
                    keyboardType: TextInputType.number,
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
              ],
            ),
          ),
        ],
      ),
    );;
  }
}

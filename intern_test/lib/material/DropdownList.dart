import 'package:flutter/material.dart';

class DropdownList extends StatelessWidget {
  final String Check;
  final String text;
  final Widget widget;
  const DropdownList({
    Key? key,
    required this.text,
    required this.widget,
    required this.Check
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60,
      margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Check=='true'?const Color(0xffED8B00):const Color(0xffD1D2D4)),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            width: 150,
            child: Text(text,
              style: TextStyle(
              fontSize: 15,
              color: Check=='true'?const Color(0xffED8B00):Colors.black,
            ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 11, left: 11),
            color: Check=='true'?const Color(0xffED8B00):Colors.black,
            height: 40,
            width: 1,
          ),

          Container(
            width: 110,
            child: Text(text,
              style: TextStyle(
                fontSize: 15,
                color: Check=='true'?const Color(0xffED8B00):Colors.black,
              ),
            ),
          ),
          widget,
        ],
      ),
    );
  }
}
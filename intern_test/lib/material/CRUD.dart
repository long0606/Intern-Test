import 'package:flutter/material.dart';

import 'ListData.dart';

class CRUD extends StatefulWidget {

  late int index;

  CRUD(int index) {
    this.index = index;
  }

  @override
  _CRUDState createState() {
    return _CRUDState();
  }
}

class _CRUDState extends State<CRUD> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        Text(ListData.listData[widget.index].name.toString())
      ],
    );
  }
}
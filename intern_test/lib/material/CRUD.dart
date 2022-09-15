import 'package:flutter/material.dart';
import 'ApprovalData.dart';
import 'ListData.dart';

class CRUD extends StatefulWidget {
  late int index;

  CRUD(this.index, {super.key});

  @override
  State<CRUD> createState() => _CRUDState();
}

class _CRUDState extends State<CRUD> {
////////////////////// chuc nang xoa matrix /////////////////////////////
  delete(){
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          // side: BorderSide(color: Colors.green, width: 3),
            borderRadius: BorderRadius.all(
                Radius.circular(15))),
        title: const Text('CONFIRM',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
        content: const Text(
          'Do you want to delete this Task?',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text(
              'Cancel',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {
              ListData.listData.removeAt(widget.index);
              --widget.index ;
              Navigator.pop(context, 'OK');

            },
            child: const Text(
              'OK',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  ///////////////////////////////// Chuc nang xem chi tiet////////////////////////
  view(){
    TextEditingController minimumChange = TextEditingController();
    TextEditingController maximumChange = TextEditingController();
    TextEditingController nameChange = TextEditingController();
    TextEditingController numberChange = TextEditingController();

    return showDialog(
        context: context,
        builder: (BuildContext context) => SingleChildScrollView(
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15),
              ),
            ),
            title: const Text('Detail of Approval Matrix', style: TextStyle(
              color: Color(0xffED8B00)
            ),),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Name of Approval Matrix'),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xffD1D2D4)),
                  ),
                  child: TextField(
                    controller: nameChange,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: ListData.listData[widget.index].name,
                      hintStyle: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Minimum Range'),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xffD1D2D4)),
                  ),
                  child: TextField(
                    controller: minimumChange,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: ListData.listData[widget.index].minimum,
                      hintStyle: const TextStyle(color: Colors.black)
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Maximum Range'),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xffD1D2D4)),
                  ),
                  child: TextField(
                    controller: maximumChange,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ListData.listData[widget.index].maximum,
                        hintStyle: const TextStyle(color: Colors.black)
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Number of Approval'),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xffD1D2D4)),
                  ),
                  child: TextField(
                    controller: numberChange,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ListData.listData[widget.index].number,
                        hintStyle: const TextStyle(color: Colors.black)
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    ListData.listData.insert(widget.index,
                      Data(
                        minimum: minimumChange.text,
                        maximum: maximumChange.text,
                        number: numberChange.text,
                        name: nameChange.text,
                      ),
                    );
                    ListData.listData[widget.index];
                  });
                  Navigator.pop(context, 'Save');
                },
                child: const Text(
                  'Save',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ),
            ],
          ),
        ),);
  }




  ///////////***********///////////////*************//////////////***********////////
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
      onPressed: view,
      onLongPress: delete,
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
        padding: const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color(0xffD1D2D4),
            )),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Range Limit of Approval',
                  style: TextStyle(
                    fontSize: 12,
                      color: Colors.black
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    'Minimum IDR ',
                    style: TextStyle(
                      fontSize: 12,
                        color: Color(0xff171C8F)
                    ),
                  ),
                ),
                Container(
                  width: 65,
                  alignment: Alignment.centerRight,
                  child: Text(
                    ListData.listData[widget.index].minimum.toString(),
                    style: const TextStyle(
                        color: Color(0xff171C8F)
                    ),
                  ),
                ),
              ],
            ),
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 115,),
                    const Text('Maximum IDR',
                      style: TextStyle(
                        fontSize: 12,
                          color: Color(0xff171C8F)
                      ),
                    ),
                    Text(ListData.listData[widget.index].maximum.toString(),
                    style: const TextStyle(
                        color: Color(0xff171C8F)
                    ),
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Number of Approval',
                  style: TextStyle(
                    fontSize: 12,
                      color: Colors.black
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(ListData.listData[widget.index].number.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                        color: Color(0xff171C8F)
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              width: double.maxFinite,
              height: 1,
              color: const Color(0xffD1D2D4),
            ),
            if (ListData.listData[widget.index].number==1) Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Approval 1',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    Container(
                      width: 150,
                      alignment: Alignment.centerRight,
                      child: const Text(
                        'GROUPMG1, GROUPMG2',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                            color: Color(0xff171C8F)
                        ),
                      ),
                    ),
                  ],
                ) else if(ListData.listData[widget.index]==2) Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Approval 1',
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            ),
                            Container(
                              width: 150,
                              alignment: Alignment.centerRight,
                              child: const Text(
                                'GROUPMG1,GROUPMG2, GROUPMG3',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 12,
                                    color: Color(0xff171C8F)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Approval 2',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          Container(
                            width: 150,
                            alignment: Alignment.centerRight,
                            child: const Text(
                              'GROUPFI1, GROUPFI2, GROUPCROSS',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12,
                                  color: Color(0xff171C8F)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}


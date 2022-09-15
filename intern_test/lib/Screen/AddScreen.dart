import 'package:flutter/material.dart';
import 'package:intern_test/material/ApprovalData.dart';
import 'package:intern_test/material/ListData.dart';
import 'package:intern_test/material/RangeApproval.dart';
import 'package:intern_test/material/Textfield.dart';

class AddMatrix extends StatefulWidget {


  const AddMatrix({
    Key? key,
    // required this.addData,
  }) : super(key: key);

  @override
  _AddMatrixState createState() {
    return _AddMatrixState();
  }
}

List<String> feature = ['Default', 'Transfer Online'];

class _AddMatrixState extends State<AddMatrix> {

  //khai bao
  final TextEditingController _inputname = TextEditingController();
  final TextEditingController _maximum = TextEditingController();
  final TextEditingController _minimum = TextEditingController();
  final TextEditingController _approvalNumber = TextEditingController();
  String DropdownItem = '';

 // get listData => listData;

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
    _addData(){
      setState(() {
        ListData.listData.add(
          Data(
            maximum: _maximum.text,
            minimum: _minimum.text,
            name: _inputname.text,
            feature: DropdownItem,
            number: _approvalNumber.text,
          )
        );
        for (int index = 0; index < ListData.listData.length; index++);
      });
    }

    
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_circle_left_sharp,
                    size: 24,
                  ),
                ),
                title: const SizedBox(
                    width: 280,
                    child: Center(
                        child: Text(
                      'Approval Matrix',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ))),
                backgroundColor: const Color(0xffED8B00),
              ),
              Container(
                padding: const EdgeInsets.only(
                    right: 30, left: 30, top: 20, bottom: 20),
                child: const Text(
                  'Create New Approval Matrix',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xffED8B00),
                  ),
                ),
              ),
              Container(
                height: 1,
                width: 315,
                color: const Color(0xffD1D2D4),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
                child: Column(
                  children: [
                    MyInputField(
                      title: 'Approval Matrix Alias',
                      hintText: 'Input Matrix Name',
                      controller: _inputname,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: MyInputField(
                        color:
                            DropdownItem == '' ? null : const Color(0xff0b0e0e),
                        hintText: DropdownItem == ''
                            ? 'Select Feature'
                            : DropdownItem,
                        title: 'Feature',
                        widget: DropdownButton(
                          underline: Container(
                            height: 0,
                          ),
                          elevation: 8,
                          items: feature
                              .map<DropdownMenuItem<String>>((String? value) {
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value!,
                                ));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              DropdownItem = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          right: 30, left: 30, top: 40, bottom: 20),
                      height: 1,
                      width: 315,
                      color: const Color(0xffD1D2D4),
                    ),
                    Range(
                        title: 'Range of Approval (Maximum)',
                        hintText: 'Input Text Here',
                      controller: _maximum,
                    ),
                    Range(
                        title: 'Range of Approval (Minimum)',
                        hintText: 'Input Text Here',
                      controller: _minimum,
                    ),
                    MyInputField(
                      controller: _approvalNumber,
                      title: 'Number of Approval',
                      hintText: 'Input Number',
                      type: TextInputType.number,
                    ),
                    GestureDetector(
                      onTap: (){
                        _addData();
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 60),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xffF3F2F2)),
                        height: 56,
                        width: double.maxFinite,
                        child: const Center(
                            child: Text(
                          'Add To List',
                          style: TextStyle(color: Color(0xffD1D2D4)),
                        ),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Text(ListData.listData.first.toString());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xffF3F2F2)),
                        height: 56,
                        width: double.maxFinite,
                        child: const Center(
                          child: Text(
                            'Reset',
                            style: TextStyle(color: Color(0xffD1D2D4)),
                          ),),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


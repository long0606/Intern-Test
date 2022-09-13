import 'package:flutter/material.dart';
import 'package:intern_test/material/DropdownList.dart';

class ListviewScreen extends StatefulWidget {

  static bool DefaultCheck = true;
  static bool TransferCheck = true;
  ListviewScreen({Key? key}) : super(key: key);

  @override
  _ListviewScreenState createState() {
    return _ListviewScreenState();
  }
}

class _ListviewScreenState extends State<ListviewScreen> {
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
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Center(child: Text(
                'Approval Matrix',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              ),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                  ),
                  width: double.maxFinite,
                  height: 65,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff171C8F),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    margin: const EdgeInsets.only(
                        right: 30, top: 20, left: 200, bottom: 15),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Icon(Icons.add_circle, color: Colors.white,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text('Make New Matrix', style: TextStyle(
                            color: Colors.white,
                          ),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              pinned: true,
              expandedHeight: 150,
              flexibleSpace: const FlexibleSpaceBar(
              ),
              backgroundColor: const Color(0xffED8B00),
            ),
            SliverToBoxAdapter(child: Column(
              children: [
                DropdownList(text: 'Default',
                Check: ListviewScreen.DefaultCheck.toString(),
                widget: TextButton(
                  onPressed: (){
                    setState(() {
                      if(ListviewScreen.DefaultCheck){
                        ListviewScreen.DefaultCheck = false;
                      }
                      else ListviewScreen.DefaultCheck = true;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      ListviewScreen.DefaultCheck?
                      Icons.keyboard_arrow_down_rounded:Icons.keyboard_arrow_up_rounded,
                      color: ListviewScreen.DefaultCheck?Color(0xffED8B00):Colors.black,
                    ),
                  ),
                ),
                ),
                DropdownList(text: 'Transfer Online',
                  Check: ListviewScreen.TransferCheck.toString(),
                  widget: TextButton(
                    onPressed: (){
                      setState(() {
                        if(ListviewScreen.TransferCheck){
                          ListviewScreen.TransferCheck = false;
                        }
                        else ListviewScreen.TransferCheck = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(
                        ListviewScreen.TransferCheck?
                        Icons.keyboard_arrow_down_rounded:Icons.keyboard_arrow_up_rounded,
                        color: ListviewScreen.TransferCheck?Color(0xffED8B00):Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
              ),
          ],
        ),
      );
  }
}
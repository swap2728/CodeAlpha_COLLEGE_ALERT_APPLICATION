import 'dart:convert';

import 'package:alert_app/page_notification.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Notificaton_page extends StatefulWidget {
  const Notificaton_page({super.key});

  @override
  State<Notificaton_page> createState() => _Notificaton_pageState();
}



class _Notificaton_pageState extends State<Notificaton_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getalert();
  }
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
   List? items;

  // get http => null;
  void getalert() async {
    var response = await http.get(Uri.parse("http://192.168.42.31:5000/findalert/"),
        headers: {"Content-Type":"application/json"},
        // body: jsonEncode(regBody)
    );
    print("xxxxxxxxxxxxxxxx");  //404
    var jsonResponse = jsonDecode(response.body);
    items = jsonResponse['data'];
    print(items?[0]);
    setState(() {
    });
  }

  // void deleteItem(id) async{
  //   var regBody = {
  //     "id":id
  //   };
  //
  //   var response = await http.post(Uri.parse(deleteTodo),
  //       headers: {"Content-Type":"application/json"},
  //       body: jsonEncode(regBody)
  //   );
  //
  //   var jsonResponse = jsonDecode(response.body);
  //   if(jsonResponse['status']){
  //     getalert();
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications",style:TextStyle(color: Colors.purple),),
          backgroundColor: Colors.orange,
          actions: [
            IconButton(onPressed: (){}, icon:Icon(Icons.settings,color: Colors.white,) )
          ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // color: Col,
        ),
        child: items == null ? null : ListView.separated(

          padding: const EdgeInsets.all(8),
          itemCount:  items!.length,

          itemBuilder: (BuildContext context, int index) {
            final item = items?[index];
            return GestureDetector(
              child: Expanded(
                child: Container(
                  height: 100,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.yellow[400],
                  ),
                  // color: Colors.amber[colorCodes[index]],
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: ListTile(
                      leading: Icon(Icons.task),
                      title: Text( items?[index]['name'] ),
                      trailing: IconButton( onPressed: (){
                        // print(entries);
                        // widget.removeFunc(widget.index);
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Delete ',style: TextStyle(color: Colors.red),),
                            content: const Text('Delete this notification' ),
                            actions: <Widget>[
                              InkWell(
                                onTap: ()
                             {
                               // deleteItem(items[index]['_id']);
                               Navigator.pop(context, 'ok');},
                                child: const Text('ok'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('cancle'),
                              ),
                            ],
                          ),
                        );
                
                        // setState(() {
                        //   // entries.remove(entries[index]);
                        //   // Navigator.push(context).pop();
                        // });
                        // entries.remove('A');
                        }, icon: Icon(Icons.more_vert),),
                
                    ),
                    // child: Row(
                    //   children: [
                      //   Icon(
                      //     Icons.connected_tv_sharp,
                      //     size: 50,
                      //     color: Colors.white,
                      //   ),
                      //   SizedBox(width: 10,),
                      //   Expanded(child: Text('Entry ${entries[index]} , to day is our collage '
                      //       'fastival so we have to gather at collage auditorium' ,
                      //     style:TextStyle(color: Colors.black , fontWeight: FontWeight.w900),)),
                      //   SizedBox(width: 10),
                      //   Icon(
                      //     Icons.more_vert,
                      //     size: 30,
                      //     color: Colors.white,
                      //   ),
                      // ],
                    // ),
                  )
                ),
              ),
              onTap: (){
                print('plese dont press');
                print(items?[index]);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> open_notification(data :item,)
                    ));
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
    );
  }
}


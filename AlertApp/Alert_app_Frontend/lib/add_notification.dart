import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class addNotification extends StatefulWidget {
  const addNotification({super.key});
  // TextEditingController value = new TextEditingController();
  @override
  State<addNotification> createState() => _addNotificationState();
}

class _addNotificationState extends State<addNotification> {
  @override
  Widget build(BuildContext context) {
    TextEditingController value1 = new TextEditingController();
    TextEditingController value2 = new TextEditingController();
    TextEditingController value3 = new TextEditingController();
    TextEditingController value4 = new TextEditingController();
    List<String> post=[];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ADD NEWS"
        ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: value1,
              decoration: const InputDecoration(
                icon: const Icon(Icons.person,color: Colors.orange,),
                hintText: 'Enter your name of message writer',
                labelText: 'Name',
              ),
            ),
            TextFormField(
              controller: value2,
              decoration: const InputDecoration(
                icon: const Icon(Icons.portrait_sharp,color: Colors.orange,),
                hintText: 'Topic to post',
                labelText: 'Topic',
              ),
            ),
            TextFormField(
              controller: value3,
              decoration: const InputDecoration(
                icon: const Icon(Icons.calendar_today,color: Colors.orange,),
                hintText: 'Enter your venue of message',
                labelText: 'venue',
              ),
            ),
          SizedBox(height:20),
          Expanded(
            child: TextField(
              maxLines: 15,
              controller: value4,
              decoration: InputDecoration(
                icon: const Icon(Icons.calendar_today ,color: Colors.orange,),
                hintText: 'Write the message to post ',
                labelText: 'TEXT MESSAGE',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                constraints: BoxConstraints.tightFor(width: 500, height: 500),
              ),
            ),
          ),

          new Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                // color: Colors.yellow,
                child: new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow
                  ),
                  child: const Text('Submit'),
                  onPressed: () async {
                    print(value4);
                    if(value4.text.isNotEmpty && value3.text.isNotEmpty){
                      if(value1.text.isNotEmpty && value2.text.isNotEmpty){
                        var regBody = {
                          "name":value1.text,
                          "topic":value2.text,
                          "date":value3.text,
                          "message":value4.text
                        };
                        print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                        var response = await http.post(Uri.parse("http://192.168.42.31:5000/insertalert/"),
                            headers: {"Content-Type":"application/json"},
                            body: jsonEncode(regBody)
                        );
                        var jsonResponse = jsonDecode(response.body);
                        if(jsonResponse['success']){
                          value4.clear();
                          value3.clear();
                          value2.clear();
                          value1.clear();
                          // setState(() {
                          //
                          // });
                        }else{
                          print("SomeThing Went Wrong");
                        }
                        // print(jsonResponse["succ);
                      }
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}

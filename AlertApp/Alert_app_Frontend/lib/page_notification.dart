import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class open_notification extends StatefulWidget {
  final data ;
  // pr
   open_notification({   required this.data});

  @override
  State<open_notification> createState() => _open_notificationState();
}
class _open_notificationState extends State<open_notification> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(data);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data["topic"]),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Expanded(
          // padding: EdgeInsets.all(20),
          // color: Colors.amberAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Text("Writen by :"
              //     " ${widget.data["name"]}",style: TextStyle(fontSize: 20),),
              HStack([
                "Writen by : ".text.yellow500.size(25).make(),
                " ${widget.data["name"]}".text.size(25).make()
                // TextStyle()
              ]).centered(),
              SizedBox(height: 10),
              HStack([
                "Date of writen by : ".text.yellow500.size(25).make(),
                " ${widget.data["date"]}".text.size(25).make()
                // TextStyle()
              ]).centered(),
              // Text("Date of writen by   : ",style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              HStack([
                "Topic of writing ".text.yellow500.size(25).make(),
                "  ${widget.data["topic"]}".text.size(25).make()
                // TextStyle()
              ]).centered(),
              // Text("Topic of writing   :",style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                      scrollDirection: Axis.vertical,
                      child: Text("Message   : ${widget.data["message"]}",
                        style: TextStyle(fontSize: 25),)),
              ),
            ],
          ),
        ),
      )
    );
  }
}

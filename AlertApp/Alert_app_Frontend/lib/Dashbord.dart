import 'package:flutter/material.dart';

import 'add_notification.dart';
import 'notification_alert.dart';

class Dashbord extends StatefulWidget {
  final token;
  final pre;
  const Dashbord({super.key, required this.token, required this.pre});
  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  // final pre=widget.tokan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Aler App"),
      ),
      body: Container(
        child: ListView(
          children: [
            // ListTile(
            //   leading: Icon(Icons.connected_tv_sharp),
            //   title: Text('MORE about app'),
            //   trailing: Icon(Icons.subdirectory_arrow_right_outlined),
            //   // style:,
            // ),
            Container(
              // height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[200],
                    fixedSize: const Size(150, 70)
                ),
                onPressed: () {
                  // Respond to button press
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const Notificaton_page()));
                },
                child: Text('Notification page'),
              ),
            ),
            Expanded(
              child: Center(
                child: Builder(
                  builder: (context) {
                    if (widget.pre == true) {
                      return Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[300],
                              fixedSize: const Size(400, 80)
                          ),
                          onPressed: () {
                            // Respond to button press
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const addNotification()));
                          },
                          child: Text('adding notificatoin'),
                        ),
                      );
                    } else {
                      return Container(

                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

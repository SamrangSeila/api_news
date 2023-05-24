import 'dart:ffi';

import 'package:flutter/material.dart';
class Delete extends StatelessWidget {
  const Delete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search))],
        centerTitle: true,
        title: Text('Delete'),
      ),
      drawer: Drawer(
          child:Column(
            children: [
              DrawerHeader(
                child: Text(
                    'Samrang Seila'
                ),
              ),
              ListTile(
                leading: IconButton(onPressed: (){},icon: Icon((Icons.group)),),
                title: Text('New Group'),

              ),
              ListTile(
                leading: IconButton(onPressed: (){},icon: Icon((Icons.person)),),
                title: Text('Contacts'),
                trailing: IconButton(onPressed: (){},icon: Icon(Icons.notification_add),),
              ),
              ListTile(
                leading: IconButton(onPressed: (){},icon: Icon((Icons.call)),),
                title: Text('Call'),

              ),
              ListTile(
                leading: IconButton(onPressed: (){},icon: Icon((Icons.near_me)),),
                title: Text('People Nearby'),

              ),
              ListTile(
                leading: IconButton(onPressed: (){},icon: Icon((Icons.message)),),
                title: Text('Saved Messages'),

              ),
              ListTile(
                leading: IconButton(onPressed: (){},icon: Icon((Icons.settings)),),
                title: Text('Settings'),
                trailing: IconButton(onPressed: (){},icon: Icon(Icons.notification_add),),
              ),
              ListTile(
                leading: IconButton(onPressed: (){},icon: Icon((Icons.person_add)),),
                title: Text('Invite Friends'),
                trailing: IconButton(onPressed: (){},icon: Icon(Icons.notification_add),),
              ),
              ListTile(
                leading: IconButton(onPressed: (){},icon: Icon((Icons.question_mark)),),
                title: Text('Telegram Features'),

              ),
            ],

          ),

      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Expanded(

                    child:Container(
                  height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
              ) ,
                ),
                Expanded(

                  child:Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ) ,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

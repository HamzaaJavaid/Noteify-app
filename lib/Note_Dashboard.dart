

import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Note_Dashboard extends StatefulWidget {
  const Note_Dashboard({Key? key}) : super(key: key);

  @override
  _Note_DashboardState createState() => _Note_DashboardState();
}

class _Note_DashboardState extends State<Note_Dashboard> {
  String title = 'nn' ;
  String description = 'nn';
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  late User user;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(auth.currentUser!=null){
      user = auth.currentUser as User;
    }
  }
  String title_update = 'nn';
  String description_update = 'nn';

  Future bottom_sheet(){
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            borderSide: BorderSide(width: 2,color: Colors.transparent)
        ),
        backgroundColor: Colors.white.withOpacity(0.9),
        context: context,
        builder: (context){
          return Padding(padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: 400,
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      cursorColor: Colors.white,
                      onChanged: (String value){
                        //title text
                        setState(() {
                          title_update = value;
                        });

                      },
                      decoration: InputDecoration(
                          labelText: 'ADD TITLE',
                          labelStyle: TextStyle(
                              color: Colors.orange
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(width: 1,color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(width: 1,color: Colors.white),

                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      cursorColor: Colors.white,
                      onChanged: (String value){
                        //description text
                        setState(() {
                          description_update = value;
                        });
                      },
                      decoration: InputDecoration(
                          hintMaxLines: 3,
                          labelText: 'Description',
                          labelStyle: TextStyle(
                              color: Colors.orange
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(width: 1,color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(width: 1,color: Colors.white),

                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: ()  {
                      //firestore set data

                      print(title);
                      print(description);
                      print(user.email);
                      print(DateTime.now().toString());
                      firestore.collection('Data').doc(DateTime.now().millisecondsSinceEpoch.toString()).update({
                        'time' : DateTime.now().toString(),
                        'title' : title_update,
                        'description' : description_update,
                      });

                      Navigator.pop(context);


                    },
                    color: Colors.greenAccent,
                    minWidth: 160,
                    height: 70,
                    elevation: 4,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(width: 1,color: Colors.transparent),
                    ),
                    child: Text("ADD TASK"),
                  )
                ],
              ),
            ),);
        }


    );

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,


        floatingActionButton: GestureDetector(
         onTap: (){

           showModalBottomSheet(
               isScrollControlled: true,
               shape: OutlineInputBorder(
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(40),
                     topRight: Radius.circular(40),
                   ),
                   borderSide: BorderSide(width: 2,color: Colors.transparent)
               ),
               backgroundColor: Colors.white.withOpacity(0.9),
               context: context,
               builder: (context){
                 return Padding(padding: MediaQuery.of(context).viewInsets,
                   child: Container(
                     height: 400,
                     width: double.maxFinite,
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         SizedBox(height: 20,),
                         Padding(
                           padding: EdgeInsets.symmetric(horizontal: 20),
                           child: TextField(
                             cursorColor: Colors.white,
                             onChanged: (String value){
                               //title text
                               setState(() {
                                 title = value;
                               });

                             },
                             decoration: InputDecoration(
                                 labelText: 'ADD TITLE',
                                 labelStyle: TextStyle(
                                     color: Colors.orange
                                 ),
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(20)),
                                   borderSide: BorderSide(width: 1,color: Colors.white),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(20)),
                                   borderSide: BorderSide(width: 1,color: Colors.white),

                                 )
                             ),
                           ),
                         ),
                         SizedBox(height: 30,),
                         Padding(
                           padding: EdgeInsets.symmetric(horizontal: 20),
                           child: TextField(
                             cursorColor: Colors.white,
                             onChanged: (String value){
                               //description text
                               setState(() {
                                 description = value;
                               });
                             },
                             decoration: InputDecoration(
                                 hintMaxLines: 3,
                                 labelText: 'Description',
                                 labelStyle: TextStyle(
                                     color: Colors.orange
                                 ),
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(20)),
                                   borderSide: BorderSide(width: 1,color: Colors.white),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(20)),
                                   borderSide: BorderSide(width: 1,color: Colors.white),

                                 )
                             ),
                           ),
                         ),
                         SizedBox(
                           height: 30,
                         ),
                         MaterialButton(
                           onPressed: ()  {
                             //firestore set data

                             print(title);
                             print(description);
                             print(user.email);
                             print(DateTime.now().toString());
                             String id = DateTime.now().millisecondsSinceEpoch.toString();
                              firestore.collection('Data').doc(id).set({
                               'time' : DateTime.now().toString(),
                                'id' : id,
                               'title' : title,
                               'description' : description,
                             });

                             Navigator.pop(context);


                           },
                           color: Colors.greenAccent,
                           minWidth: 160,
                           height: 70,
                           elevation: 4,
                           shape: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(20)),
                             borderSide: BorderSide(width: 1,color: Colors.transparent),
                           ),
                           child: Text("ADD TASK"),
                         )
                       ],
                     ),
                   ),);
               }


           );



         },
          child: CircleAvatar(
            radius: 30,
            child: Icon(Icons.add),
            backgroundColor: Colors.blueAccent,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
            child: Container(

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.greenAccent.withOpacity(0.4),
                    //Colors.blue.withOpacity(0.4),
                    Colors.yellowAccent.withOpacity(0.4)
                  ]
                ),
                //color: Colors.greenAccent,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.yellowAccent.withOpacity(0.3),
                  spreadRadius: 4
                )
              ]
              ),
              width: double.maxFinite,
              height: 630,

              child: Stack(
                children: [
                  StreamBuilder(
                      stream: firestore.collection('Data').orderBy('time').snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
                        if(snapshot.connectionState== ConnectionState.waiting){
                          return CircularProgressIndicator();
                        }


                        return snapshot.hasData ?
                        ListView.builder(

                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context , index)  {
                              String Title = snapshot.data!.docs[index]['title'];
                              String Description = snapshot.data!.docs[index]['description'];
                              return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),

                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 4,
                                                blurRadius: 4,
                                                offset: Offset(0,0)
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                        ),
                                        width: double.maxFinite,
                                        height: 100,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: Column(

                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('$Title',
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 18,fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              SizedBox(height: 5,),
                                              Text('$Description',
                                                style: TextStyle(
                                                  fontSize: 13,color: Colors.grey,fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),


                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 20,),
                                          MaterialButton(

                                            onPressed: (){
                                              showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  shape: OutlineInputBorder(
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(40),
                                                        topRight: Radius.circular(40),
                                                      ),
                                                      borderSide: BorderSide(width: 2,color: Colors.transparent)
                                                  ),
                                                  backgroundColor: Colors.white.withOpacity(0.9),
                                                  context: context,
                                                  builder: (context){
                                                    return Padding(padding: MediaQuery.of(context).viewInsets,
                                                      child: Container(
                                                        height: 400,
                                                        width: double.maxFinite,
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            SizedBox(height: 20,),
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 20),
                                                              child: TextField(

                                                                cursorColor: Colors.white,
                                                                onChanged: (String value){
                                                                  //title text
                                                                  setState(() {
                                                                    title_update = value;
                                                                  });

                                                                },
                                                                decoration: InputDecoration(
                                                                    labelText: 'ADD TITLE',
                                                                    labelStyle: TextStyle(
                                                                        color: Colors.orange
                                                                    ),
                                                                    border: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                      borderSide: BorderSide(width: 1,color: Colors.white),
                                                                    ),
                                                                    enabledBorder: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                      borderSide: BorderSide(width: 1,color: Colors.white),

                                                                    )
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(height: 30,),
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 20),
                                                              child: TextField(
                                                                cursorColor: Colors.white,
                                                                onChanged: (String value){
                                                                  //description text
                                                                  setState(() {
                                                                    description_update = value;
                                                                  });
                                                                },
                                                                decoration: InputDecoration(
                                                                    hintMaxLines: 3,
                                                                    labelText: 'Description',
                                                                    labelStyle: TextStyle(
                                                                        color: Colors.orange
                                                                    ),
                                                                    border: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                      borderSide: BorderSide(width: 1,color: Colors.white),
                                                                    ),
                                                                    enabledBorder: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                      borderSide: BorderSide(width: 1,color: Colors.white),

                                                                    )
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 30,
                                                            ),
                                                            MaterialButton(
                                                              onPressed: ()  {
                                                                //firestore set data



                                                                firestore.collection('Data').doc(snapshot.data!.docs[index]['id'].toString()).update({
                                                                  'time' : DateTime.now().toString(),
                                                                  'title' : title_update,
                                                                  'description' : description_update,
                                                                });

                                                                Navigator.pop(context);


                                                              },
                                                              color: Colors.greenAccent,
                                                              minWidth: 160,
                                                              height: 70,
                                                              elevation: 4,
                                                              shape: OutlineInputBorder(
                                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                borderSide: BorderSide(width: 1,color: Colors.transparent),
                                                              ),
                                                              child: Text("ADD TASK"),
                                                            )
                                                          ],
                                                        ),
                                                      ),);
                                                  }


                                              );


                                            },
                                            minWidth: 90,
                                            shape: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                              borderSide: BorderSide(width: 1  , color: Colors.transparent),
                                            ),
                                            color: Colors.greenAccent,
                                            child: Text('EDIT'),

                                          ),
                                          SizedBox(width: 90,),
                                          MaterialButton(
                                            onPressed: (){


                                              firestore.collection('Data').doc(snapshot.data!.docs[index]['id'].toString()).delete();

                                            },
                                            minWidth: 90,
                                            shape: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                              borderSide: BorderSide(width: 1  , color: Colors.transparent),
                                            ),
                                            color: Colors.redAccent,
                                            child: Text('DELETE'),

                                          )
                                        ],
                                      )
                                    ],
                                  )
                              );


                            }

                        ) : Container();

                      }),
                ],









                ),
              ),

            ),
          ),
        ),

    );


  }
}

class Tile extends StatefulWidget {

Tile(this.title , this.subtitle );
String title;
String subtitle;



  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  String title_edit = '';
  String description_edit = '';



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),

      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: Offset(0,0)
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            width: double.maxFinite,
            height: 100,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.title}',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18,fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text('${widget.subtitle}',
                    style: TextStyle(
                      fontSize: 13,color: Colors.grey,fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),


          ),
          Row(
            children: [
              SizedBox(width: 20,),
              MaterialButton(

                  onPressed: (){


                  },
                minWidth: 90,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(width: 1  , color: Colors.transparent),
                ),
                color: Colors.greenAccent,
                child: Text('EDIT'),

                  ),
              SizedBox(width: 90,),
              MaterialButton(
                onPressed: (){},
                minWidth: 90,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(width: 1  , color: Colors.transparent),
                ),
                color: Colors.redAccent,
                child: Text('DELETE'),

              )
            ],
          )
        ],
      )
    );
  }
}



import 'package:flutter/material.dart';
import 'package:hello/Account_login.dart';
import 'package:hello/Note_Dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Create_account extends StatefulWidget {
  const Create_account({Key? key}) : super(key: key);

  @override
  _Create_accountState createState() => _Create_accountState();
}

class _Create_accountState extends State<Create_account> {
  String email='' ;
  String password_one = '';
  String confirm_password = '';
  final auth = FirebaseAuth.instance;


  void dialog(String title , String description){
     showDialog(context: context, builder: (context){
        return AlertDialog(
        title: Text(title),
          content: Text(description),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child:  SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 150,),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.blueAccent.withOpacity(0.4),
                          Colors.lightGreen.withOpacity(0.4)
                        ]
                    ),
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(5,7)
                    )
                  ]
                  ),
                  width: 300,
                  height: 450,
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Text('CREATE ACCOUNT',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: Colors.orange
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          onChanged: (String value){
                            setState(() {
                              email = value;
                            });
                          },
                          decoration: InputDecoration(
                              label: Text('Enter Email'),
                              labelStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              border: OutlineInputBorder(
                                gapPadding: 8,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    width: 2 , color: Colors.red
                                ),

                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    width: 2 , color: Colors.orange
                                ),
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          onChanged: (String value){
                            setState(() {
                              password_one = value;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              label: Text('Enter Password'),
                              labelStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              border: OutlineInputBorder(
                                gapPadding: 8,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    width: 2 , color: Colors.red
                                ),

                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    width: 2 , color: Colors.orange
                                ),
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          onChanged: (String value){

                            setState(() {
                              confirm_password = value;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(

                              label: Text('Confirm Password'),
                              labelStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              border: OutlineInputBorder(
                                gapPadding: 8,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    width: 2 , color: Colors.red
                                ),

                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    width: 2 , color: Colors.orange
                                ),
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                      MaterialButton(onPressed: () async{


                        if(email==''){
                          print('Enter EMAIL');
                          dialog('WARNING' , 'ENTER EMAIL PLEASE');
                        }
                        else if(password_one == ''){
                          print('Enter Password');
                          dialog('WARNING' , 'ENTER PASSWORD PLEASE');
                        }
                        else if(confirm_password == ''){
                          print('Confirm Password');
                          dialog('WARNING' , ' CONFIRM PASSWORD PLEASE');
                        }
                        else if(confirm_password != password_one){
                          print('Password Mismatch');
                          dialog('WARNING' , 'PASSWORD MISMATCH');
                        }
                        else if(password_one.length<7){
                          print('');
                          dialog('WARNING' , 'Password Length cant be Less than 7');
                        }
                        else if(confirm_password.length<7){
                          print('');
                          dialog('WARNING' , 'Confirm Password Length cant be Less than 7');
                        }

                        else if (!email.contains('@')){
                          print('');
                          dialog('WARNING' , 'Invalid Email');
                        }
                        else if (confirm_password == password_one){

                           try{
                             await auth.createUserWithEmailAndPassword(email: email, password: password_one);
                             print('Account created');
                             dialog('SUCCESS', 'ACCOUNT CREATED');
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Note_Dashboard()));
                           }
                           catch(e) {
                             print(e);
                           }

                        }



                      },
                        minWidth: 150,
                        height: 50,
                        color: Colors.greenAccent,
                        child: Text('Sign Up'),
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(width: 1,color: Colors.transparent),
                        ),
                        elevation: 7,
                      ),
                    ],
                  ),



                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('Already Have an Account ? '),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Account_login()));
                    }, child: Text(' Sign In'))
                  ],
                ),
                SizedBox(height: 60,),
                Text('VERSION 1.0',style: TextStyle(
                  letterSpacing: 5,
                  fontSize: 7
                ),)
              ],
            ),
          )
          ),
        ),
    );
  }
}

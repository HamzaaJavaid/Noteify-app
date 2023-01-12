import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello/Note_Dashboard.dart';
import 'package:hello/create_account.dart';


class Account_login extends StatefulWidget {
  const Account_login({Key? key}) : super(key: key);

  @override
  _Account_loginState createState() => _Account_loginState();
}

class _Account_loginState extends State<Account_login> {
 String email = '' ;
 String passsword = '';
 final auth = FirebaseAuth.instance;
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
                            Colors.yellowAccent.withOpacity(0.4),
                            Colors.lightGreen.withOpacity(0.4)
                          ]
                      ),
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    width: 300,
                    height: 450,
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Text('LOGIN ACCOUNT',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.orange
                          ),
                        ),
                        SizedBox(
                          height: 70,
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
                          height: 60,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            onChanged: (String value){
                              passsword = value;
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
                        SizedBox(height: 40,),
                        MaterialButton(onPressed: () async{

                          if(email==''){
                            print('enter Email');
                          }
                          else if(passsword==''){
                            print('Enter Password');
                          }
                          else if(passsword.length<7){
                            print('password length cant be less than 7 ');
                          }
                          else if(!email.contains('@')){
                            print("Invalid Email");
                          }
                          else{
                             try{
                               await auth.signInWithEmailAndPassword(email: email, password: passsword);
                               print('Login Succesfully');
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Note_Dashboard()));
                             }
                             catch(e){
                               print(e);
                             }
                          }


                        },
                          minWidth: 150,
                          height: 50,
                          color: Colors.greenAccent,
                          child: Text('Login'),
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
                      Center(child: Text('Dont Have an Account ? '),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Create_account()));
                      }, child: Text(' Sign Up'))
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

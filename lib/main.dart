import 'package:flutter/material.dart';
import 'package:hello/Account_login.dart';
import 'create_account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
runApp( const MaterialApp(


  home: MyApp(),
)
);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) =>Scaffold(
            appBar: AppBar(
              shadowColor: Colors.amber,
              backgroundColor: Colors.cyan.withOpacity(0.5),
              title: Text('NOTIFY'),
              centerTitle: true,
            ),
            body: SafeArea(

              child: Column(
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      MaterialButton(

                        minWidth: 290,
                        height: 90,
                        highlightColor: Colors.white,
                        elevation: 6,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(width: 2 , color: Colors.white10),
                        ),
                        color: Colors.blueAccent.withOpacity(0.4),
                        child: Text('CREATE ACCOUNT',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),),
                        onPressed: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context) =>Create_account()));



                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      MaterialButton(
                        minWidth: 290,
                        height: 90,
                        highlightColor: Colors.white,
                        elevation: 6,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(width: 1 , color: Colors.transparent),
                        ),
                        color: Colors.greenAccent.withOpacity(0.4),
                        child: Text('LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Account_login()));
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      MaterialButton(
                        minWidth: 290,
                        height: 90,
                        highlightColor: Colors.white,
                        elevation: 6,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(width: 1 , color: Colors.transparent),
                        ),
                        color: Colors.orange.withOpacity(0.4),
                        child: Text('HELP',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),),
                        onPressed: (){},
                      ),
                    ],
                  ),





                ],
              ),
            )
        ),
      ),
    );
  }
}

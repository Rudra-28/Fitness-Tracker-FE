import 'package:fitnesstrackerfe/loginpage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
   TextEditingController namecontroller = TextEditingController();

  TextEditingController emailcontroller= TextEditingController();

  @override
  void dispose(){
    namecontroller.dispose();
    emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body:  Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey[100]),
                fillColor: Colors.grey[900], 
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), 
                  borderSide: BorderSide(color: Colors.blue), 
                ), 
                label: Text("Enter your name"),
              ),
              controller: namecontroller,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), 
            ),
            child: TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey[100]),
                fillColor: Colors.grey[900], 
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), 
                  borderSide: BorderSide(color: Colors.blue),
                ),
                label: Text("Enter your email"),
              ),
            ),
          ),
          Row(
          children: [
            Text("Already Registered, Login"),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            }, child: Text("Login"),),
          ],
          )
        ],
      ),
 
    );
  }
}
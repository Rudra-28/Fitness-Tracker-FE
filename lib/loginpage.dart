import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
        title: Text("Fitness Tracker", style: TextStyle(),),
      ),
      body: Column(
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
        ],
      ),
    );
  }
}
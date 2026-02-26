import 'package:fitnesstrackerfe/project/provider/authprovider.dart';
import 'package:fitnesstrackerfe/project/widgets/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  @override
  void dispose() {
    passwordcontroller.dispose();
    emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration")),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey[100]),
                fillColor: Colors.grey[900],
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                label: Text("Enter your email"),
              ),
              controller: emailcontroller,
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey[100]),
                fillColor: Colors.grey[900],
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                label: Text("Enter your password"),
              ),
            ),
          ),
          Consumer<Authprovider>(
      builder: (context, auth, child) {

        if (auth.isloading) {
          return CircularProgressIndicator();
        }

        return ElevatedButton(
          onPressed: () async {
            await auth.register(
              passwordcontroller.text.trim(),
              emailcontroller.text.trim(),
            );

            if (auth.token != null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            }
          },
          child: Text("Register"),
        );
      },
    ),
        ],
      ),
    );
  }
}

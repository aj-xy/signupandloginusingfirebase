import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginusingfirebase/main.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  signup({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Homepage();
        },
      ));
    } catch (e) {
      print('Error logging in: $e');
    }
  }

  TextEditingController signupemailController = TextEditingController();
  TextEditingController signuppasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(47, 1, 71, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 1, 71, 1),
        foregroundColor: const Color.fromRGBO(248, 244, 251, 1),
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                    color: const Color.fromRGBO(248, 244, 251, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: signupemailController,
                style: TextStyle(
                    color: Color.fromRGBO(2, 0, 30, 1),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(248, 244, 251, 1),
                  filled: true,
                  hintText: "Email",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: const Color.fromRGBO(248, 244, 251, 1))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: const Color.fromRGBO(248, 244, 251, 1))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: signuppasswordController,
                style: TextStyle(
                    color: Color.fromRGBO(2, 0, 30, 1),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(248, 244, 251, 1),
                  filled: true,
                  hintText: "Password",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: const Color.fromRGBO(248, 244, 251, 1))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: const Color.fromRGBO(248, 244, 251, 1))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(2, 0, 30, 1),
                      foregroundColor: Color.fromRGBO(248, 244, 251, 1),
                      fixedSize: Size(150, 60)),
                  onPressed: () async {
                    await signup(
                        email: signupemailController.text,
                        password: signuppasswordController.text);
                  },
                  child: Text("Create Account")),
            ],
          ),
        ),
      )),
    );
  }
}

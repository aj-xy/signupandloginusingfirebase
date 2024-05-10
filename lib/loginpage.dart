import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginusingfirebase/signup.dart';
import 'package:loginusingfirebase/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  login({
    required String email,
    required String password,
  }) async {
    try {
      print(email);
      print(password);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
       Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return welcome();
        },
      ));
    } catch (e) {
      print('Error logging in: $e');
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
    Future saveuserdata (String email,String password)async{
   final SharedPreferences pref = await SharedPreferences.getInstance();
    print(email);
     await pref.setString("Email", email);
    await pref.setString("Password", password);
   }
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Signin",
                style: TextStyle(
                    color: const Color.fromRGBO(248, 244, 251, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailController,
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
                controller: passwordController,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(2, 0, 30, 1),
                          foregroundColor: Color.fromRGBO(248, 244, 251, 1),
                          fixedSize: Size(100, 40)),
                      onPressed: () async {
                            await saveuserdata(emailController.text,passwordController.text);

                         login(
                            email: emailController.text,
                            password: passwordController.text);
                      },
                      child: Text("Login")),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(2, 0, 30, 1),
                          foregroundColor: Color.fromRGBO(248, 244, 251, 1),
                          fixedSize: Size(100, 40)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return signup();
                          },
                        ));
                      },
                      child: Text("SignUP")),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

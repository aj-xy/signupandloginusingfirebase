import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  String email = "";
  String password = "";
  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString("Email")!;
      password = prefs.getString("Password")!;
    });
    print(email);
    print(password);
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
            children: [
              Text(
                email,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                password,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              )
            ],
          ),
        ),
      )),
    );
  }
}

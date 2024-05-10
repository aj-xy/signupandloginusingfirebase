import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginusingfirebase/loginpage.dart';
import 'firebase_options.dart';
import 'package:lottie/lottie.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(47, 1, 71, 1),
      body: SafeArea(
          child: Center(
        child: Padding(padding: EdgeInsets.all(10),child: 
        Column(children: [
          LottieBuilder.network('https://lottie.host/4f2c8bf6-8ce5-4510-a6cb-f06603b3ec41/PnKFkC0I96.json'),
          SizedBox(height: 20,),
          ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(2, 0, 30, 1),
                          foregroundColor: Color.fromRGBO(248, 244, 251, 1),
                          fixedSize: Size(100, 40)),
                      onPressed: ()  {
                       Navigator.push(context, MaterialPageRoute(builder: (context) {
                         return Login();
                       },));
                      },
                      child: Text("Login")),
        ],)
        ,),
      )),
    );
  }
}

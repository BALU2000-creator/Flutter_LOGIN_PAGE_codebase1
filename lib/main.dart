import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/auth_page.dart';
import 'package:flutter_application_1/pages/loginDialogWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
}


class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  final user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Center(
          child: ElevatedButton(
          onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                      insetPadding: const EdgeInsets.symmetric(horizontal: 520, vertical: 20),
                      insetAnimationCurve:Curves.bounceInOut,
                      child: LoginDialogWidget(context),
                    
                  );
                },
              );
            },
            child: const Text("logIn")),
        ),
      );
  }

  void signalDismissLoginDailog(){
    Navigator.pop(context);
  }
}

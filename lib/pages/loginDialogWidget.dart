import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textfield.dart';
import 'package:flutter_application_1/components/squaretile.dart';
import 'package:flutter_application_1/main.dart';

class LoginDialogWidget extends StatefulWidget{
  LoginDialogWidget(BuildContext context, {super.key});

  @override
  State<LoginDialogWidget> createState() => _LoginDialogWidgetState();
}

class _LoginDialogWidgetState extends State<LoginDialogWidget> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn () async {

    showDialog(
      context: context, 
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context){
    var theme = Theme.of(context);
    // final textcolor = theme.textTheme.displayMedium!.copyWith(color: theme.colorScheme.onPrimary );
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const IntrinsicHeight(child: SizedBox(height: 2)),


                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const IntrinsicHeight(child: SizedBox(height: 40)),


                Text('Welcome back, you\'ve been missed',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 20,
                  ),
                ),


                const IntrinsicHeight(child: SizedBox(height: 40)),


                MyTextField(
                  controller: emailController,
                  obscureText: false,
                  hintText: 'Username or Email',
                ),


                const IntrinsicHeight(child: SizedBox(height: 25,)),


                MyTextField(
                  controller: passwordController,
                  obscureText: true,
                  hintText: 'Password',
                ),  


                const IntrinsicHeight(child: SizedBox(height:10)),
      
                IntrinsicWidth(
                  stepWidth: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forget Password?', style: TextStyle(color: Colors.grey[600]),),
                    ],
                  ),
                ),
      
                const IntrinsicHeight(child: SizedBox(height: 25,)),
      
                MyButton(onTap: signUserIn),   
      
                const IntrinsicHeight(child: SizedBox(height: 20,)),
      
                IntrinsicWidth(
                  stepWidth: 400,
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey.shade400,
                        ) 
                      ),
                      const Text('Or continue with', style: TextStyle(color: Colors.black),),
                      Expanded(
                        child: Divider(
                          thickness:1,
                          color: Colors.grey.shade400,
                        ) 
                      ),
                    ],
                  ),
                ),
      
                const IntrinsicHeight(child: SizedBox(height:20)),



                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(path: 'lib/Images/Google.png'),
                    SizedBox(width: 30,),
                    SquareTile(path: 'lib/Images/Apple_logo_black.svg.png')
                  ],
                ),
      
                const SizedBox(height:15),
      
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    SizedBox(width: 5,),
                    Text('Register now',
                      style:  TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
      
                  ],
                )   
              ],
            ),
          ),
        ),
      );
  }
  
}
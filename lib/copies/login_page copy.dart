import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textfield.dart';
import 'package:flutter_application_1/components/squaretile.dart';

class LoginPage extends StatelessWidget{
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  void signUserIn (){}
  @override
  Widget build(BuildContext context){
    var theme = Theme.of(context);
    // final textcolor = theme.textTheme.displayMedium!.copyWith(color: theme.colorScheme.onPrimary );
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: IntrinsicHeight(
        
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 40),
                Text('Welcome back, you\'ve been missed',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 40),
                MyTextField(
                  controller: usernameController,
                  obscureText: false,
                  hintText: 'Username or Email',
                ),
                const SizedBox(height: 25,),
                MyTextField(
                  controller: passwordController,
                  obscureText: true,
                  hintText: 'Password',
                ),  
                const SizedBox(height:10),
      
                IntrinsicWidth(
                  stepWidth: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forget Password?', style: TextStyle(color: Colors.grey[600]),),
                    ],
                  ),
                ),
      
                const SizedBox(height: 25,),
      
                MyButton(onTap: signUserIn),   
      
                const SizedBox(height: 20,),
      
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
      
                const SizedBox(height:20),
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
      ),
    );
  }
}
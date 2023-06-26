import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/squareTile.dart';
import '../widgets/textField.dart';


class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  // onTap function
  void signUserUp() async {
    // show loading bar
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        );
      },
    );

    try {

      // check if password is confirmed
      if(passwordController.text == confirmPasswordController)
        {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
          );
          Navigator.pop(context);
        }
      else
        {

          // show error message, passwords dont match...
          errorMessage("Passwords don't match..!");

        }
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      // Wrong email/pass
      errorMessage(e.code);
    }
  }

  void errorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white, fontSize: 16),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                // logo
                Icon(
                  Icons.lock,
                  size: 50,
                ),

                SizedBox(
                  height: 25,
                ),

                // welcome back
                Text("Let's create an account for you.. !",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 18, color: Colors.grey[700])),

                SizedBox(
                  height: 25,
                ),

                // username textField
                MyTextField(
                  controller: emailController,
                  hint: 'Email',
                  obscureText: false,
                ),

                // password TextField
                SizedBox(
                  height: 25,
                ),
                MyTextField(
                  controller: passwordController,
                  hint: 'Password',
                  obscureText: true,
                ),

                SizedBox(
                  height: 10,
                ),

                //Confirm Password
                MyTextField(
                  controller: confirmPasswordController,
                  hint: 'Confirm Password',
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),

                // forgot pass?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                ),

                // sign in button
                SizedBox(
                  height: 25,
                ),

                MyButton(
                  onTap: signUserUp, bName: 'Sign Up',
                ),

                SizedBox(
                  height: 50,
                ),

                // or continue with...
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'or continue with..',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.grey[700], fontSize: 16),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 50,
                ),

                //google/apple sign in
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google
                    MySquareTile(imageAdd: 'asset/google.png'),

                    SizedBox(
                      width: 25,
                    ),

                    // apple
                    MySquareTile(imageAdd: 'asset/apple.jpg')
                  ],
                ),

                SizedBox(
                  height: 50,
                ),

                // register now....

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account..?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.grey[700], fontSize: 14),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Login now',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.blue, fontSize: 14),
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

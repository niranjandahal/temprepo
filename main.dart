import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:o1loginsignupphp/main.dart';
import 'package:o1loginsignupphp/ui/textfieldui.dart';
import 'package:o1loginsignupphp/ui/login.dart';

class SignUpUi extends StatefulWidget {
  const SignUpUi({super.key});

  @override
  State<SignUpUi> createState() => _SignUpUiState();
}

class _SignUpUiState extends State<SignUpUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("lib/assets/background.png"),
          //   fit: BoxFit.fill,
          // ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.cyan.shade300,
              Color.fromARGB(255, 26, 95, 151),
              Color.fromARGB(255, 5, 152, 172),
              Colors.cyan.shade300,
            ],
          ),
        ),
        child: Center(
          child: GlassContainer(
            height: 440,
            width: MediaQuery.of(context).size.width * 0.85,
            blur: 95,
            color: Colors.white.withOpacity(0.1),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.grey.withOpacity(0.3),
              ],
            ),
            //--code to remove border
            border: Border.fromBorderSide(BorderSide.none),
            shadowStrength: 5,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            shadowColor: Colors.white.withOpacity(0.24),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFieldUi("Username", "Full Name", Icons.person, false),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldUi("Email", "Email Adress", Icons.email, false),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldUi("Password", "Password", Icons.key_outlined, true),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldUi("Confirm password", "confirm password",
                      Icons.key_outlined, true),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: ElevatedButton(
                      onPressed: () {
                        //alert dialoge
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Sign Up Successful"),
                              content: Text(""),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyHomePage(),
                                      ),
                                    );
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );

                        
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black.withOpacity(0.3),
                        onPrimary: Colors.white.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        "  Already have an account?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      TextButton(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 14),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

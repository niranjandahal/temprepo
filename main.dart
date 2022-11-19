import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:o1loginsignupphp/ui/signup.dart';
import 'package:o1loginsignupphp/ui/textfieldui.dart';

class loginpageui extends StatefulWidget {
  const loginpageui({super.key});

  @override
  State<loginpageui> createState() => _loginpageuiState();
}

class _loginpageuiState extends State<loginpageui> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //uncomment if you want to load a picture as a background
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
          height: 295,
          width: MediaQuery.of(context).size.width * 0.8,
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
                TextFieldUi(
                    "Email / username", "Emial adress", Icons.email, false),
                SizedBox(
                  height: 20,
                ),
                TextFieldUi("Password", "Password", Icons.lock, true),
                SizedBox(
                  height: 35,
                ),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
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
                        "Doesn't have an account?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      TextButton(
                          child: Text(
                            "Register now",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 14),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpUi()));
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

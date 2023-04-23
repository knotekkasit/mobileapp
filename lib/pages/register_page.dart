import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/profile.dart';
import 'package:modernlogintute/components/square_tile.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  Profile profile = Profile();

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(child: Text("${snapshot.error}")),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                backgroundColor: Colors.grey[300],
                body: SafeArea(
                    child: Form(
                  key: formkey,
                  child: Center(
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Image.asset(
                            'lib/images/meowfood.png',
                            height: 300,
                            width: 300,
                          ),

                          const SizedBox(height: 40),

                          // welcome back, you've been missed!
                          Text(
                            'Welcome to Meowfood delivery !',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 30),

                          // username textfield
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: TextFormField(
                              key: UniqueKey(),
                              controller: usernameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: "Email",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: .5)),
                              ),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "Please enter your email !"),
                                EmailValidator(
                                    errorText: "Invalid email entered !")
                              ]),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (String email) {
                                profile.email = email;
                              },
                            ),
                          ),

                          const SizedBox(height: 20),

                          // password textfield
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: TextFormField(
                              key: UniqueKey(),
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: .5)),
                              ),
                              validator: RequiredValidator(
                                  errorText: "Please enter your password !"),
                              onSaved: (String password) {
                                profile.password = password;
                              },
                            ),
                          ),

                          const SizedBox(height: 20),

                          // button sign in
                          Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 100, right: 100),
                                  child: ElevatedButton(
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      primary:
                                          Colors.blueAccent, // Background color
                                    ),
                                    onPressed: () async {
                                      if (formkey.currentState.validate()) {
                                        formkey.currentState.save();
                                        try {
                                          await FirebaseAuth.instance
                                              .createUserWithEmailAndPassword(
                                                  email: profile.email,
                                                  password: profile.password)
                                              .then((value) {
                                            formkey.currentState.reset();
                                            Fluttertoast.showToast(
                                                msg: "Create a new account !",
                                                gravity: ToastGravity.TOP);
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return LoginPage();
                                            }));
                                          });
                                        } on FirebaseAuthException catch (e) {
                                          print(e.code);
                                          String message;
                                          if (e.code == 'email-alrey-in-use') {
                                            message =
                                                "This email is unavailable !";
                                          } else if (e.code ==
                                              'weak-password') {
                                            message =
                                                'Password must be at least 6 characters long !';
                                          } else {
                                            message = e.message;
                                          }
                                          Fluttertoast.showToast(
                                              msg: message,
                                              gravity: ToastGravity.CENTER);
                                        }
                                      }
                                    },
                                  )),
                            ],
                          ),
                        ])),
                  ),
                )));
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

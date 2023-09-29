// ignore: file_names
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:learning/Widgets/homepage.dart';
import 'package:learning/Widgets/register.dart';

// ignore: must_be_immutable
class LogIn extends StatefulWidget {
  String logkey;
  LogIn({
    Key? key,
    required this.logkey,
  }) : super(key: key);

  @override
  State<LogIn> createState() => LogInState();
}

class LogInState extends State<LogIn> {
  var username = TextEditingController();
  var password = TextEditingController();

  bool userError = false;
  bool passError = false;

  bool logged = false;

  var dialogue = 'User Not Registered !!!';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // backgroundColor: Colors.transparent,
      // ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.61,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 215, 213, 213),
                          blurRadius: 3.0,
                          blurStyle: BlurStyle.outer),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 38.0, left: 20, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'To get started',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Column(
                        children: [
                          TextField(
                            controller: username,
                            cursorHeight: 21,
                            onTap: () {},
                            decoration: InputDecoration(
                                labelText: "Username",
                                errorText: userError
                                    ? 'Please enter Your Username'
                                    : null,
                                labelStyle: const TextStyle(fontSize: 16),
                                hintText: "EG : abcd_12",
                                contentPadding: const EdgeInsets.all(13),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 225, 225, 225),
                                        width: 1.5)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Color.fromARGB(255, 241, 239, 239),
                                  width: 1.8,
                                )),
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: password,
                            cursorHeight: 21,
                            onTap: () {},
                            decoration: InputDecoration(
                                errorText: passError
                                    ? "Please Enter Your Password"
                                    : null,
                                labelText: "Password",
                                labelStyle: const TextStyle(fontSize: 16),
                                hintText: "EG : 12@Pass",
                                contentPadding: const EdgeInsets.all(13),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 225, 225, 225),
                                        width: 1.5)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Color.fromARGB(255, 241, 239, 239),
                                  width: 1.8,
                                )),
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10))),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    "This option is not available yet!!",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Ok"))
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('Forgot Passoword?')),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 4, 102, 183),
                          minimumSize: Size(MediaQuery.of(context).size.width,
                              MediaQuery.of(context).size.height / 15),
                        ),
                        onPressed: () async {
                          valField();
                          varifyUser();

                          setState(() {});
                          // if (!UserError && !passError) {}
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 4, top: 19),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Register(),
                              ));
                        },
                        child: RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "New User?",
                              style: TextStyle(
                                  color: Theme.of(context).highlightColor)),
                          TextSpan(
                              text: " Register",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).highlightColor))
                        ])),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void valField() {
    username.text.isEmpty ? userError = true : userError = false;
    password.text.isEmpty ? passError = true : passError = false;
  }

  void varifyUser() async {
    var pref = await SharedPreferences.getInstance();

    if (password.text == pref.getString(username.text)) {
      pref.setBool(widget.logkey, true);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => homePage(
              keylog: widget.logkey,
            ),
          ));
    } else {
      if (pref.getString(username.text) != null &&
          password.text != pref.getString(username.text)) {
        dialogue = 'Incorrect Password Entered';
      }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              dialogue,
              style: const TextStyle(fontSize: 16),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        },
      );
    }
  }
}

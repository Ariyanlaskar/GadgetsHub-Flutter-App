// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

// ignore: duplicate_ignore
class _RegisterState extends State<Register> {
  //For Taking Input from TextField;
  var username = TextEditingController();
  var password = TextEditingController();
  var cfPassword = TextEditingController();

//For Chechking If Pasword Contains all Reqd.
  bool isSpec = false;
  bool isDigit = false;
  bool isLowChar = false;
  bool isUpperChar = false;

//For validating the Textfiled
  bool userError = false;
  bool passError = false;
  bool cfError = false;
  bool isChecked = false;
  bool obsPassText = true;
  bool obsCfPassText = true;

//To Show Error Msg;
  var userErrMsg;

  var passErrMsg;
  var cfErrMsg;
  var dialogue = "You Are Successfully Registered With Us";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.4,
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
                            'SignUp',
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
                                errorText: userError ? userErrMsg : null,
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
                            obscureText: obsPassText,
                            controller: password,
                            cursorHeight: 21,
                            onTap: () {},
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      obsPassText = !obsPassText;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.black,
                                    )),
                                errorText: passError ? passErrMsg : null,
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
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            obscureText: obsCfPassText,
                            controller: cfPassword,
                            cursorHeight: 21,
                            onTap: () {},
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      obsCfPassText = !obsCfPassText;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.black,
                                    )),
                                errorText: cfError ? cfErrMsg : null,
                                labelText: "Confirm Password",
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
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              }),
                          const Text(
                            "Agree to Our Terms And Conditions",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
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
                          checkUserName();
                          checkPass();
                          checkCF();
                          var pref = await SharedPreferences.getInstance();

                          if (!cfError &&
                              !userError &&
                              !passError &&
                              isChecked) {
                            var name = pref.getString(username.text);

                            name == null
                                ? dialogue =
                                    "You Are Successfully Registered With Us"
                                : dialogue = "User Already Registered";

                            pref.setString(username.text.toString(),
                                password.text.toString());
                            // ignore: use_build_context_synchronously
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

                          setState(() {});
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 4.5,
                          top: 19),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Already Registered?",
                              style: TextStyle(
                                  color: Theme.of(context).highlightColor)),
                          TextSpan(
                              text: " Login",
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

  void checkPass() {
    if (password.text.isEmpty) {
      passError = true;
      passErrMsg = "Please Enter Your Password";
    } else if (password.text.isNotEmpty) {
      if (!password.text.contains((RegExp(r'[A-Z]')))) {
        passError = true;
        passErrMsg = "Password Must Contain UpperCase Letter";
      } else if (!password.text.contains((RegExp(r'[a-z]')))) {
        passError = true;
        passErrMsg = "Password Must Contain LowerCase Letter";
      } else if (!password.text.contains((RegExp(r'[0-9]')))) {
        passError = true;
        passErrMsg = "Password Must Contain Digit";
      } else if (!password.text.contains((RegExp(r'[~!@#$%^&*()_+?><]')))) {
        passError = true;
        passErrMsg = "Password Must Contain A Special Character";
      } else if (password.text.length < 6) {
        passError = true;
        passErrMsg = 'Password must contains atleast 6 character';
      } else {
        passError = false;
      }
    }
  }

  void checkUserName() {
    if (username.text.isEmpty) {
      userError = true;
      userErrMsg = "Please Enter Your Username";
    } else {
      userError = false;
    }
  }

  void checkCF() {
    if (cfPassword.text.isEmpty) {
      cfError = true;
      cfErrMsg = "Please Confirm Your Password";
    } else if (cfPassword.text != password.text) {
      cfErrMsg = "Password doesn't matches";
      cfError = true;
    } else {
      cfError = false;
    }
  }
}

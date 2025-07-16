import 'package:flutter/material.dart';

import 'home_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  String username = '';
  bool hidePass = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController  = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  //(0xFF9A47A5
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Log In"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60),
                // Optionally keep Name field if you plan to use it

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    enabled: true,
                    validator: (value) {
                      if (value != null && !value.contains("@")) {
                        return 'Mail not valid';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value != null && value.length < 6) {
                        return 'Invalid Password';
                      }
                      return null;
                    },
                    controller: passController,
                    obscureText: hidePass,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePass = !hidePass;
                          });
                        },
                        icon: Icon(
                          hidePass ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 60),

                SizedBox(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Color(0xFFA361AE)) ,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await dialog();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Enter valid data"),
                            duration: Duration(seconds: 3),
                            action: SnackBarAction(label: "Ok", onPressed: () {}),
                          ),
                        );
                      }
                    },
                    child: Text("Log In" , style: TextStyle(fontSize: 20 , color: Colors.black),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> dialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Welcome"),
          titleTextStyle: TextStyle(fontSize: 30 , color:Color(0xFFB284BE) , fontWeight: FontWeight.bold),

          content: Text("Account sign-in successfully"),
          contentTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFB284BE),
            fontSize: 20,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Center(
                widthFactor: 50,
                child: Text(
                  "Close",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFFB284BE)),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}


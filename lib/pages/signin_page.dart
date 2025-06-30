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
  final TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB284BE),
        title: Text("Logging In"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 40),
            // Optionally keep Name field if you plan to use it

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
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
                    return 'Password must contain 6 characters';
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


            SizedBox(height: 40),

            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              height: 50,
              child: ElevatedButton(
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
                        action: SnackBarAction(label: "ok", onPressed: () {}),
                      ),
                    );
                  }
                },
                child: Text("Log In" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , color: Color(0xFFB284BE)),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> dialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFB284BE),
          title: Text("Welcome $username"),
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),

          content: Text("Account sign-in successfully"),
          contentTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}


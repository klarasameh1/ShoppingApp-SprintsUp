import 'package:flutter/material.dart';
import 'package:shopping_app/pages/home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String username = '';
  bool hidePass = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 60),
              // Optionally keep Name field if you plan to use it
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (value[0] != value[0].toUpperCase()) {
                      return 'First letter must be uppercase';
                    }
                    username=value ;
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Full Name'),
                ),
              ),

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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value != passController.text) {
                      return 'Password do not match ';
                    }
                    return null;
                  },
                  controller: confirmPassController,
                  obscureText: hidePass,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
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
                  child: Text("Sign Up" , style: TextStyle(fontSize: 20 , color: Colors.black),),
                ),
              ),
            ],
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
          titleTextStyle: TextStyle(fontSize: 30 , color:Color(0xFFB284BE)),

          content: Text("Account created successfully"),
          contentTextStyle: TextStyle(
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


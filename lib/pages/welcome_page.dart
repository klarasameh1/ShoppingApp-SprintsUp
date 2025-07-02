import 'package:flutter/material.dart';
import 'package:shopping_app/pages/signin_page.dart';
import 'package:shopping_app/pages/signup_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Welcome to Shoppy App" )) , backgroundColor: Colors.transparent,),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
              child:
              Image.asset('assets/welcomePage/welcome1.jpg',
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height*0.3,
              ),
          ),
          Center(
              child:
              Image.asset('assets/welcomePage/shopbag.jpg',
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height*0.3,
              ),
          ),
          SizedBox(height: 30,),

          SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            height: 50,
            child: ElevatedButton(
              onPressed: () => {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> SignupPage()))},
              child: Text('Sign Up' , style: TextStyle(fontSize: 20 , color: Colors.black),),
            ),
          ),
          SizedBox(height: 30,),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            height: 50,
            child: ElevatedButton(
              onPressed: () => {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> SigninPage()))},
              child: Text('Log In' , style: TextStyle(fontSize: 20 , color: Colors.black ),),
            ),
          ),
        ],

      ),
    );
  }
}

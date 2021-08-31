import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:offline/widgets/background.dart';
import 'package:offline/routes/pageRoute.dart';

class Login extends StatefulWidget{
  static const String routeName = '/loginPage';  
  
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  final formKey = GlobalKey<FormState>(); //key for form
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
          body: Background(
            child: Form(
              key: formKey, //key for form
              child:Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA),
                        fontSize: 36
                        ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                SizedBox(height: size.height * 0.03),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                        decoration: InputDecoration( 
                          labelText: 'Username'
                        ),
                        controller: name,
                        validator: (value){
                          if (value!.isEmpty){
                            return 'Please fill this field';
                          }
                          if(!value.contains('@')){
                            return 'Email is invalid';
                          }
                          if(!value.contains(".")){
                            return 'Email is invalid';
                          }
                        },
                     ),
                ),
                     
                      //SizedBox(height: size.height * 0.03),

                     Container(
                       alignment: Alignment.center,
                       margin: EdgeInsets.symmetric(horizontal: 40),
                       child: TextFormField(
                         decoration: InputDecoration( 
                           labelText: 'Password',
                           hintText: 'Password should be greater than 6 characters.'
                           ),
                           obscureText: true,
                           validator: (value){
                             if(value.toString().length < 6){
                               //  r'^[0-9]{10}$' pattern plain match number with length 10
                               return "Enter Correct Password";
                               }else{
                                 return null;
                                 }
                            },
                     ),
                     ),

                     SizedBox(height: size.height * 0.05),

                                 SizedBox(height: size.height * 0.05),

            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){                            
                    Navigator.pushReplacementNamed(context, PageRoutes.user);
                    }
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: new LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 136, 34),
                        Color.fromARGB(255, 255, 177, 41)
                      ]
                    )
                  ),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "LOGIN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
     )
   );
  }
}
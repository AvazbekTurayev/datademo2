import 'package:datademo2/model/account_model.dart';
import 'package:datademo2/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();

  void doSignup()async{
    String email = emailController.text.toString().trim();
    String number = numberController.text.toString().trim();
    String addres = addressController.text.toString().trim();


    var user1 = new Account(email: 'email', address: 'address',number: 'number');
    var box = Hive.box('pdponline');
    box.put("user", user1.toJson());

    var user2 = new Account.fromJson(box.get('user'));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF27736c),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(30),
                  width: double.infinity,
                  color: Color(0xFF27736c),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40,),
                      Text("Welcome", style: TextStyle(color: Color(0xFF35a197), fontWeight: FontWeight.bold, fontSize: 19),),
                      SizedBox(height: 10,),
                      Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
                    ],
                  ),
                )
            ),

            Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF27736c), width: 2.1)),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300, width: 0.1)),
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1),
                              hintText: "Enter Email",
                              hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextField(
                            controller: numberController,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF27736c), width: 2.1)),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0.1)),
                              labelText: "Number",
                              labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1),
                              hintText: "Enter Number",
                              hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextField(
                            controller: addressController,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF27736c), width: 2.1)),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0.1)),
                              labelText: "Address",
                              labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1),
                              hintText: "Enter Address",
                              hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Color(0xFF27736c),
                            ),
                            child: Center(
                              child: TextButton(child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  //_doSignUp();
                                },
                              ),
                            ),
                          ),
                          Center(
                            child: Text("OR", style: TextStyle(color: Colors.grey.shade300, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.facebook, color: Colors.blueAccent.shade700,),
                              SizedBox(width: 30,),
                              Icon(Icons.flutter_dash_sharp, color: Colors.lightBlue,),
                              SizedBox(width: 30,),
                              Icon(Icons.linked_camera_rounded,),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text("Already have an account?", style: TextStyle(color: Colors.grey.shade300, fontWeight: FontWeight.bold),),
                              ),
                              SizedBox(width: 1,),
                              Center(
                                child: TextButton(
                                  child: Text("SignIn",
                                    style: TextStyle(
                                        color: Color(0xFF27736c),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SigninPage()),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

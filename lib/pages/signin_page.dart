import 'package:datademo2/model/user_model.dart';
import 'package:datademo2/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void doSignin (){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var user1 = new User(email: 'email',password: 'passord');
    var box = Hive.box('pdponline');
    box.put("user", user1.toJson());

    var user2 = new User.fromJson(box.get('user'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF27736c),
      body: Container(
        child: Column(
          children: [
            Expanded(
                  child: Container(
        margin: EdgeInsets.all(30),
        width: double.infinity,
        color: Color(0xFF27736c),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 3),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/ic_image.jpg"),
                  ),
                  shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 20,),
            Text("Welcome", style: TextStyle(color: Color(0xFF35a197), fontWeight: FontWeight.bold, fontSize: 19),),
            SizedBox(height: 10,),
            Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
          ],
        ),
      ),

                ),
            Expanded(flex: 2,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
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
                            controller: passwordController,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF27736c), width: 2.1)),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0.1)),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1),
                              hintText: "Enter Password",
                              hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Center(
                            child: Text("Forget Password?", style: TextStyle(color: Colors.grey.shade300, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 7,),
                          Container(
                            height: 40,
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Color(0xFF27736c),
                            ),
                              child: TextButton(child: Text("Sign In", style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),),
                                onPressed: (){
                                 doSignin();
                                },
                              ),
                          ),
                            Center(
                             child: Text("OR", style: TextStyle(color: Colors.grey.shade300, fontWeight: FontWeight.bold),),
                            ),
                          SizedBox(height: 34,),
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
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text("Don't have an account",style: TextStyle(color: Colors.grey.shade300,fontWeight: FontWeight.bold),),
                              ),
                              SizedBox(width: 1,),
                              Center(
                                child: TextButton(
                                  child: Text("SignUp",
                                    style: TextStyle(
                                        color: Color(0xFF27736c),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SignupPage()),
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            )

          ],
        ),
      ),
    );
  }
}

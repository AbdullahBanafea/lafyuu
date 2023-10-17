import 'package:flutter/material.dart';
import 'package:lafyuu/screens/login_screen.dart';
import 'package:lafyuu/screens/slider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 112),
              Image.asset('assets/images/blue icon.png',
                  height: 72, width: 72),
              Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Let's get started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff223263),
                        fontWeight: FontWeight.bold
                    ),
                  )),
              Text(
                'Create an new account',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Color(0xff9098B1), fontWeight: FontWeight.w400),
              ),
              Container(
                width: 343,
                height: 57,
                margin: EdgeInsets.only(top: 20,bottom: 10),
                child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(width: 1, color: Color(0xffEBF0FF))),
                        prefixIcon: Icon(Icons.person_2_outlined),
                        label: (Text('Full Name', style: TextStyle(fontSize: 12, color: Color(0xff9098B1), fontWeight: FontWeight.w400),)))),
              ),
              Container(
                width: 343,
                height: 57,
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(width: 1, color: Color(0xffEBF0FF))),
                        prefixIcon: Icon(Icons.email_outlined),
                        label: (Text('Your Email', style: TextStyle(fontSize: 12, color: Color(0xff9098B1), fontWeight: FontWeight.w400),)))),
              ),
              Container(
                width: 343,
                height: 57,
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(width: 1, color: Color(0xffEBF0FF))),
                        prefixIcon: Icon(Icons.lock_outline_sharp),
                        label: (Text('Password', style: TextStyle(fontSize: 12, color: Color(0xff9098B1), fontWeight: FontWeight.w400),)))),
              ),
              Container(
                width: 343,
                height: 57,
                margin: EdgeInsets.only(bottom: 15),
                child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(width: 1, color: Color(0xffEBF0FF))),
                        prefixIcon: Icon(Icons.lock_outline_sharp),
                        label: (Text('Password Again', style: TextStyle(fontSize: 12, color: Color(0xff9098B1), fontWeight: FontWeight.w400),)))),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                width: 343,
                height: 57,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius : BorderRadius.circular(5),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SliderScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff40BFFF),
                      fixedSize: Size(
                          MediaQuery.of(context).size.width, 57
                      ),
                    ),
                  child: Text('Sign In', style: TextStyle(color: Color(0xffFFFFFF), fontSize: 15, fontWeight: FontWeight.bold),),
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(140, 10, 0, 0),
                child: Row(
                  children: [
                    Text('have a account? ', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff9098B1), fontSize: 12, fontWeight: FontWeight.w400),),

                    GestureDetector(
                      child: Text('Sign in', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff40BFFF), fontSize: 12, fontWeight: FontWeight.w700),),
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

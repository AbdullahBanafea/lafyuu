import 'package:flutter/material.dart';
import 'package:lafyuu/screens/register.dart';
import 'package:lafyuu/screens/slider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              Image.asset(
                'assets/images/blue icon.png',
                height: 72,
                width: 72,
              ),
              const SizedBox(height: 16),
              Text(
                'Welcome to Lafyuu',
                style: TextStyle(
                  color: Color(0xff223263),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue',
                style: TextStyle(
                  color: Color(0xff9098B1),
                  fontSize: 12,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 57,
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(width: 1, color: Color(0xffEBF0FF))),
                        prefixIcon: Icon(Icons.email_outlined),
                        label: (Text('Your Email', style: TextStyle(fontSize: 15, color: Color(0xff9098B1), fontWeight: FontWeight.w400),)))),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 57,
                child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(width: 1, color: Color(0xffEBF0FF))),
                        prefixIcon: Icon(Icons.lock_outline_sharp),
                        label: (Text('Password', style: TextStyle(fontSize: 15, color: Color(0xff9098B1), fontWeight: FontWeight.w400),)))),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
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
                  child: Text('Sign In', style: TextStyle(fontSize: 15),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xffEBF0FF),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('OR', style: TextStyle(color: Color(0xff9098B1), fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xffEBF0FF),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffEBF0FF), width: 1),
                    borderRadius: BorderRadius.circular(5)
                ),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: Size(
                        MediaQuery.of(context).size.width, 57
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20, right: 80),
                        child: Image.asset('assets/images/Google.png', width: 30, height: 30,),),
                      Text('Login With Google', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff9098B1), fontSize: 17, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffEBF0FF), width: 1),
                    borderRadius: BorderRadius.circular(5)
                ),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: Size(
                        MediaQuery.of(context).size.width, 57
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20, right: 80),
                        child: Image.asset('assets/images/Facebook.png', width: 30, height: 30,),),
                      Text('Login with facebook', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff9098B1), fontSize: 17, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Forgot Password?', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff40BFFF), fontSize: 15, fontWeight: FontWeight.w700),),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have a account? ', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff9098B1), fontSize: 15, fontWeight: FontWeight.w400),),
                    GestureDetector(
                      child: Text('Register', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff40BFFF), fontSize: 15, fontWeight: FontWeight.bold),),
                        onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()),
                        );
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

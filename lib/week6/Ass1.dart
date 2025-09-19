import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

const Color bgColor = Color(0xFF202020);
const Color Icon = Color.fromARGB(255, 240, 167, 32);

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.45,
                child: Image.asset('assets/img/baking.jpg'),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'SIGN IN',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 100),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 16, color: Icon),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    Image.network(
                      'https://icons.iconarchive.com/icons/icons8/windows-8/256/Users-Email-icon.png',
                      width: 20,
                      height: 20,
                      color: Icon,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                        decoration: InputDecoration(hintText: 'Email Address'),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: [
                    Image.network(
                      'https://icons.iconarchive.com/icons/pictogrammers/material/256/lock-open-outline-icon.png',
                      width: 22,
                      height: 22,
                      color: Icon,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        obscureText: true,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                        decoration: InputDecoration(hintText: 'Password'),
                      ),
                    ),
                  ],
                ),
              ),

         
            ],
          ),
        ),
      ),
    );
  }
}

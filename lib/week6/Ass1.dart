import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

const Color bgColor = Color(0xFF202020);
const Color IconColor = Color.fromARGB(255, 207, 134, 66);
const Color Icon2 = Color.fromARGB(255, 73, 73, 72);

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
                child: Image.asset('assets/images/baking.jpg'),
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
                        style: TextStyle(fontSize: 16, color: IconColor),
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
                      color: IconColor,
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
                      color: IconColor,
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
              Spacer(),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Ink(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(side: BorderSide(color: Icon2)),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.android),
                        iconSize: 24,
                        color: Icon2,
                        onPressed: () {},
                      ),
                    ),

                    SizedBox(width: 14),

                    Ink(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(side: BorderSide(color: Icon2)),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.message),
                        iconSize: 24,
                        color: Icon2,
                        onPressed: () {},
                      ),
                    ),
                    Spacer(),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: IconColor,
                        shape: CircleBorder(side: BorderSide(color: IconColor)),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        iconSize: 26,
                        color: bgColor,
                        onPressed: () {},
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

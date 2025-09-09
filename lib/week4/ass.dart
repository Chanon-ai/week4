import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController tcUser = TextEditingController();
  TextEditingController tcPass = TextEditingController();

  String message = "";
  String name = "admin";
  String password = "1234";

  void Login() {
    setState(() {
      if (tcUser.text == name && tcPass.text == password) {
        message = "Welcome " + name;
      } else {
        message = "Wrong Username or Password";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login",
            style: TextStyle(
              fontSize: 28,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 48, 162, 255),
        ),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: tcUser,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  suffixIcon: IconButton(
                    onPressed: tcUser.clear,
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              TextField(
                controller: tcPass,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: tcPass.clear,
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: Login,
                child: const Text(
                  'Login',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 48, 162, 255),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                message,
                style: const TextStyle(fontSize: 15, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

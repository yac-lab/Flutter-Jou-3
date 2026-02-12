import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'home_screen.dart';
import 'data.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void SeConnecter() {
    if (formKey.currentState!.validate()) {
      bool succes = InfoEmail.login(emailController.text, passwordController.text);

      if (succes) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Imèl oubyen modpas la pa bon")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Koneksyon")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Image.network(
    'https://cdn-icons-png.flaticon.com/512/5087/5087579.png', 
    height: 100,
  ),
              Text("Nou kontan w la !", style: TextStyle(fontSize: 30)),
              SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Imèl",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || !value.contains('@')) return 'Antre yon imèl ki bon';
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Modpas",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Antre modpas ou a';
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: SeConnecter,
                child: Text("WAP KONEKTE"),
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: Text("Ou pa gen kont? Enskri"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
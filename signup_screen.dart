import 'package:flutter/material.dart';
import 'data.dart';

class SignupScreen extends StatefulWidget {
  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  void Inscription() {
    if (formKey.currentState!.validate()) {
      InfoEmail.signup(emailController.text, passController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kont lan kreye. Ou ka konekte kounya.")),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enskripsyon")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Imèl"),
                validator: (value) {
                  if (value == null || !value.contains('@')) return 'Imèl lan pa bon';
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Modpas (pipiti 6 lèt oubyen senbol.)"),
                validator: (value) {
                  if (value == null || value.length < 6) return 'Pipiti 6 lèt oubyen senbol';
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: confirmPassController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Konfime modpas lan"),
                validator: (value) {
                  if (value != passController.text) return 'Modpas yo pa menm';
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: Inscription,
                child: Text("Map enskri"),
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
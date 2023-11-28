import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_button/sign_in_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    //first Name Field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value)
      {
        firstNameEditingController.text = value!;

      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          ),
      ),
    );

    //second Name Field
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value)
      {
        secondNameEditingController.text = value!;

      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Second Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          ),
      ),
    );

    //email Field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value)
      {
        emailEditingController.text = value!;

      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          ),
      ),
    );

    //password Field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      onSaved: (value)
      {
        firstNameEditingController.text = value!;

      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          ),
      ),
    );

    //confirm Password Field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      onSaved: (value)
      {
        confirmPasswordEditingController.text = value!;

      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          ),
      ),
    );

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: const Text("SignUp", textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold)),
        ),
    );

    //Google auth
    final FirebaseAuth auth = FirebaseAuth.instance;

    User? user;

    void _handleGoogleSignIn(){
      try {
        GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
        auth.signInWithProvider(googleAuthProvider);
      } catch (error) {
        print(error);
      }
    }

    @override
    initState(){
      super.initState();
      auth.authStateChanges().listen((event) {
        setState(() {
          user = event;
        });
      });
    }

    final googleAuth = SignInButton (
      Buttons.google,
      text: "Google Sign In",
      onPressed: () {
        _handleGoogleSignIn();
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Replace leading property with back button functionality
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back on back arrow press
          },
    ),
  ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    SizedBox(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Image.asset("assets/images/blacksymbol.png",
                      fit: BoxFit.contain,)
                    ),
                  ),

                    const SizedBox(height: 45),
                    firstNameField,

                    const SizedBox(height: 20),
                    secondNameField,

                    const SizedBox(height: 20),
                    emailField,

                    const SizedBox(height: 20),
                    passwordField,

                    const SizedBox(height: 20),
                    confirmPasswordField,

                    const SizedBox(height: 15),
                    signUpButton,

                    const SizedBox(height: 15),
                    googleAuth,

                  ],  
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
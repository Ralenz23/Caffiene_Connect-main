import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

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
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: Text("SignUp", textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold)),
        ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Replace leading property with back button functionality
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
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
                        padding: EdgeInsets.only(bottom: 0),
                        child: Image.asset("assets/images/blacksymbol.png",
                      fit: BoxFit.contain,)
                    ),
                  ),

                    SizedBox(height: 45),
                    firstNameField,

                    SizedBox(height: 20),
                    secondNameField,

                    SizedBox(height: 20),
                    emailField,

                    SizedBox(height: 20),
                    passwordField,

                    SizedBox(height: 20),
                    confirmPasswordField,

                    SizedBox(height: 15),
                    signUpButton,

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
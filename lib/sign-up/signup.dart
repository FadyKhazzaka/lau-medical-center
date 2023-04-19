import 'package:flutter/material.dart';
import 'package:laumedicalcenter/sign-up/signup_age_class.dart';
import '../client/client_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController firstController = TextEditingController();

  final TextEditingController lastController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String? errorFirstText;
  String? lastFirstText;
  String? emailFirstText;

  void _onTextFirstFieldClick() {
    setState(() {
      errorFirstText = null;
    });
  }

  void _onTextLastFieldClick() {
    setState(() {
      lastFirstText = null;
    });
  }

  void _onTextEmailFieldClick() {
    setState(() {
      emailFirstText = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                const SizedBox(height: 22.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                        width: 330,
                        child: Image.network(
                          'https://www.laumcrh.com/images/logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 9.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value == '') {
                                    setState(() {
                                      errorFirstText =
                                          'Please enter your Fisrt Name';
                                    });
                                  }
                                  return null;
                                },
                                controller: firstController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your First Name',
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorText: errorFirstText,
                                ),
                                onTap: _onTextFirstFieldClick,
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value == '') {
                                    setState(() {
                                      lastFirstText =
                                          'Please enter your Last Name';
                                    });
                                  }
                                  return null;
                                },
                                controller: lastController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your Last Name',
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorText: lastFirstText,
                                ),
                                onTap: _onTextLastFieldClick,
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value == '') {
                                    setState(() {
                                      emailFirstText =
                                          'Please enter your Email';
                                    });
                                  }
                                  return null;
                                },
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your Email',
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorText: emailFirstText,
                                ),
                                onTap: _onTextEmailFieldClick,
                              ),
                              const SizedBox(height: 21),
                              const AgeTextField(),
                              const SizedBox(height: 28),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF11574A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                        return const ClientScreen();
                                      }),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

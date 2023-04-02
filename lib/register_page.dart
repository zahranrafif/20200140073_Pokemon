import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_pam/dashboard.dart';
import 'package:pokedex_pam/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool passToggle = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 110,
                  padding: EdgeInsets.all(0),
                  child: Row(children: [
                    FloatingActionButton(
                      child: Icon(Icons.arrow_back),
                      backgroundColor: Colors.amber,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                    )
                  ]),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("images/pikacu.jpg"),
                  radius: 60,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      prefixIcon: Icon(Icons.person),
                      border: UnderlineInputBorder(),
                      hintText: "Enter your name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      } else if (value.length < 6) {
                        return "Name must be atleast 6 characters";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: UnderlineInputBorder(),
                      hintText: "Enter your email",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      } else if (!value.contains("@") || !value.contains(".")) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Password",
                      hintText: "Enter your password",
                      prefixIcon: Icon(Icons.lock),
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 6) {
                        return "Password must be atleast 6 characters";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: TextFormField(
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: UnderlineInputBorder(),
                      labelText: "Re-Password",
                      hintText: "Re-Enter your password",
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please re-enter your password";
                      } else if (value.length < 6) {
                        return "Password must be atleast 6 characters";
                      } else if (value != _passwordController.text) {
                        return "Password must be the same";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dashboard(User(
                                _usernameController.text,
                                _emailController.text,
                                _passwordController.text)),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                          child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

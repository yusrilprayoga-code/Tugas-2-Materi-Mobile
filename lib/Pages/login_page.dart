import 'package:Layout_Flutter/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key? key}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  String usernameError = "";
  String passwordError = "";
  String username = "";
  String password = "";
  bool isLoginSuccess = true;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 183, 161, 223), // Warna atas
                Color.fromARGB(202, 180, 211, 236), // Warna tengah
                Color.fromARGB(255, 255, 178, 147), // Warna bawah
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                    Expanded(
                      flex: 6,
                      child: Lottie.network(
                          'https://lottie.host/a6373f4a-ab25-41c3-9b37-fe3d6825b278/id7APsUqpl.json'),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: 20),
                _usernameField(),
                _passwordField(),
                _loginButton(context),
                _registerButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          setState(() {
            username = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person, color: Colors.deepPurple),
          hintText: "Username",
          errorText: (usernameError.isNotEmpty)
              ? usernameError
              : null, // Warna teks hint
          filled: true,
          fillColor: Colors.white, // Warna latar belakang field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50), // Border radius
            borderSide: BorderSide.none, // Menghilangkan border
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50), // Border radius
            borderSide: BorderSide(
              color: Colors.deepPurple, // Warna border ketika dalam fokus
              width: 2.0, // Lebar border ketika dalam fokus
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: Colors.deepPurple),
          hintText: "Password",
          errorText: (passwordError.isNotEmpty)
              ? passwordError
              : null, // Warna teks hint
          filled: true,
          fillColor: Colors.white, // Warna latar belakang field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50), // Border radius
            borderSide: BorderSide.none, // Menghilangkan border
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50), // Border radius
            borderSide: BorderSide(
              color: Colors.deepPurple, // Warna border ketika dalam fokus
              width: 2.0, // Lebar border ketika dalam fokus
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            backgroundColor: isHovered
                ? const Color.fromARGB(255, 94, 39, 247)
                : Colors.deepPurple,
          ),
          onPressed: () {
            setState(() {
              usernameError = "";
              passwordError = "";
            });

            if (username == "admin" && password == "admin123") {
              // Login berhasil
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            } else {
              // Login gagal
              if (username != "admin") {
                setState(() {
                  usernameError = "Username salah";
                });
              }
              if (password != "admin123") {
                setState(() {
                  passwordError = "Password salah";
                });
              }
            }

            if (usernameError.isEmpty && passwordError.isEmpty) {
              SnackBar snackBar = SnackBar(
                content: Text("Login Success"),
                duration: Duration(seconds: 1),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: const Text(
            "SIGN IN",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _registerButton(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: 20, vertical: 10), // Adjust vertical padding as needed
        width: MediaQuery.of(context).size.width,
        height: 70,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text("don't have an account?"),
          TextButton(
            onPressed: () {},
            child: Text(
              "Register",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontFamily: "Poppins"),
            ),
          ),
        ]));
  }
}

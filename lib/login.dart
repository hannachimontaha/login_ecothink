import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:login/register.dart';

class User {
  int userId;
  String nom;
  String prenom;
  String email;
  String numero_telephone;
  String ville;
  String quartier;
  String password;
  String role;
  String type;

  User(
      {required this.userId,
      required this.nom,
      required this.prenom,
      required this.email,
      required this.numero_telephone,
      required this.ville,
      required this.quartier,
      required this.password,
      required this.role,
      required this.type});

  factory User.fromMap(Map<String, dynamic> json) => User(
        userId: json['userId'],
        nom: json['nom'],
        prenom: json['prenom'],
        email: json['email'],
        numero_telephone: json['numero_telephone'],
        ville: json['ville'],
        quartier: json['quartier'],
        password: json['password'],
        role: json['role'],
        type: json['type'],
      );
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  User user = User(userId: 0, nom: '', prenom: '', email: '', numero_telephone: '', ville: '', quartier: '', password: '', role: '', type: '');

  Future save() async {
    final response  = await http.post(Uri.parse('http://192.168.1.191:8081/users'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': user.email, 'password': user.password}));
    print(response.body);
    if (response.body != null) {

      print('Login successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 750,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(20, 126, 27, 1.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 5))
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text("Login",
                            style: GoogleFonts.pacifico(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Email",
                            style: GoogleFonts.roboto(
                              // fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: user.email),
                          onChanged: (val) {
                            user.email = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is Empty';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 30, color: Colors.white),
                          decoration: InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 8,
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Password",
                            style: GoogleFonts.roboto(
                              // fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          controller:
                              TextEditingController(text: user.password),
                          onChanged: (val) {
                            user.password = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password is Empty';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 30, color: Colors.white),
                          decoration: InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 8,
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text(
                              "Dont have Account ?",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 90,
                  width: 90,
                  child: ElevatedButton(
                      //  color: Color.fromRGBO(233, 65, 82, 1),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          save();
                        }
                      },
                      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      )),
                )
              ],
            )),
      ),
    );
  }
}

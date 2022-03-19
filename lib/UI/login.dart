import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import 'inscription.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController numero = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Connexion',
            style: TextStyle(
                color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Form(
        key: formGlobalKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 3.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Form(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(30),
                            child: Image.asset('assets/book.png')),
                        TextFormField(
                          controller: numero,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "entrer votre numero";
                            } else if (value.trim().length < 9) {
                              return "numéro incorrecte";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.withOpacity(0.3),
                              filled: true,
                              hintText: "entrez votre identifiant",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              prefixIcon: const IconButton(
                                onPressed: null,
                                icon: CircleAvatar(child: Icon(Icons.phone)),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "entrer votre mots de passe";
                            } else if (value.trim().length < 8) {
                              return "mots de passe doit avoir au moins 8 caracteres";
                            }
                          },
                          obscureText: visible,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.withOpacity(0.3),
                            filled: true,
                            hintText: "mots de passe",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            prefixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                              icon: visible
                                  ? CircleAvatar(child: Icon(Icons.lock))
                                  : CircleAvatar(child: Icon(Icons.lock_open)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "mots de passe oublier?",
                          style: TextStyle(color: Colors.blue),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          margin: const EdgeInsets.all(15),
                          child: TextButton(
                            onPressed: () async {
                              if (formGlobalKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      alignment: Alignment.bottomCenter,
                                      curve: Curves.easeInOut,
                                      duration:
                                          const Duration(milliseconds: 600),
                                      reverseDuration:
                                          const Duration(milliseconds: 600),
                                      type: PageTransitionType.rightToLeft,
                                      child: const Inscription(),
                                      childCurrent: const Login()),
                                );
                              } else {
                                return null;
                              }
                            },
                            child: const Text(
                              "Connexion",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.blue,
                              elevation: 3,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // ignore: prefer_const_literals_to_create_immutables
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  alignment: Alignment.bottomCenter,
                                  curve: Curves.easeInOut,
                                  duration: const Duration(milliseconds: 600),
                                  reverseDuration:
                                      const Duration(milliseconds: 600),
                                  type: PageTransitionType.leftToRightJoined,
                                  child: const Inscription(),
                                  childCurrent: const Login()),
                            );
                          },
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("pas de compte?"),
                                Text("Inscrivez vous",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                      ],
                    )),
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

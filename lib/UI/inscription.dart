import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monprof/UI/home.dart';
import 'package:monprof/UI/login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:monprof/UI/firebase/firebase.dart';
import 'package:logger/logger.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'otp.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  late TextEditingController classe;
  late TextEditingController numero;
  late TextEditingController nom;
  late TextEditingController ecole;
  late TextEditingController password;
  String selectedclasse = "";
  bool isloading = false;
  final formGlobalKey = GlobalKey<FormState>();

  set value(Object? value) {}
  // AuthService auth = AuthService();
  @override
  void initState() {
    super.initState();
    classe = TextEditingController();
    numero = TextEditingController();
    nom = TextEditingController();
    ecole = TextEditingController();
    password = TextEditingController();
  }

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Inscription',
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
                      children: [
                        Container(
                            height: 150,
                            padding: const EdgeInsets.all(20),
                            child: Image.asset('assets/book.png')),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.grey, width: 2)),
                          child: DropdownButton(
                            isExpanded: true,
                            items: <String>[
                              'troisieme',
                              '4e année TC',
                              '4e année Elec',
                              'Premiere A4',
                              'Premiere C,D',
                              'Premiere F3',
                              'Premiere F2',
                              'Premiere F4',
                              'Premiere CG',
                              'Terminale F3',
                              'Terminale F2',
                              'Terminale CG',
                              'Terminale C,D',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: const Text(
                              'Choisir votre classe',
                              style: TextStyle(fontSize: 15),
                            ),
                            onChanged: (value) {
                              setState(() {
                                this.value = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "entrer un numero";
                            } else if (value.trim().length < 9) {
                              return "entrer un numero valide";
                            } else {
                              return null;
                            }
                          },
                          controller: numero,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              prefixText: '+237',
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
                          height: 15,
                        ),

                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "entrer un nom";
                            } else {
                              return null;
                            }
                          },
                          controller: nom,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.withOpacity(0.3),
                              filled: true,
                              hintText: "nom",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              prefixIcon: const IconButton(
                                onPressed: null,
                                icon: CircleAvatar(child: Icon(Icons.person)),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "entrer une ecole";
                            } else {
                              return null;
                            }
                          },
                          controller: ecole,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.withOpacity(0.3),
                            filled: true,
                            hintText: "ecole nom cours",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            prefixIcon: const IconButton(
                              onPressed: null,
                              icon: CircleAvatar(child: Icon(Icons.school)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "entrer un mots de passe";
                            } else if (value.trim().length < 8) {
                              return "au moins 8 caracteres requis";
                            } else {
                              return null;
                            }
                          },
                          controller: password,
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
                          height: 10,
                        ),
                        // TextFormField(
                        //   obscureText: visible,
                        //   decoration: InputDecoration(
                        //     fillColor: Colors.grey.withOpacity(0.3),
                        //     filled: true,
                        //     hintText: "confirmé le mots de passe",
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(3),
                        //     ),
                        //     prefixIcon: IconButton(
                        //       onPressed: () {
                        //         setState(() {
                        //           visible = !visible;
                        //         });
                        //       },
                        //       icon: visible
                        //           ? CircleAvatar(child: Icon(Icons.lock))
                        //           : CircleAvatar(child: Icon(Icons.lock_open)),
                        //     ),
                        //   ),
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          margin: const EdgeInsets.all(15),
                          child: TextButton(
                            onPressed: isloading
                                ? () {}
                                : () async {
                                    if (formGlobalKey.currentState!
                                        .validate()) {
                                      try {
                                        setState(() {
                                          isloading = true;
                                        });
                                        bool result = await DBservice()
                                            .verifyIfPhoneExist(numero.text);
                                        setState(() {
                                          isloading = false;
                                        });
                                        Logger()
                                            .d("result " + result.toString());
                                        if (result) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Ce numéro de téléphone existe déjà",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 4,
                                              backgroundColor: Colors.grey,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        } else {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OTPScreen(
                                                        classe: classe.text,
                                                        numero: numero.text,
                                                        nom: nom.text,
                                                        ecole: ecole.text,
                                                        password: password.text,
                                                      )));
                                        }
                                      } catch (e) {
                                        Logger().d(e);
                                        setState(() {
                                          isloading = false;
                                        });
                                        Fluttertoast.showToast(
                                            msg: "Une erreur est survenue",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 4,
                                            backgroundColor: Colors.grey,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    }
                                  },
                            child: const Text(
                              "S'inscrire",
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("déja un compte ?"),
                                Text("Connectez vous",
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

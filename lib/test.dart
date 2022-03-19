// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class TestVideo extends StatefulWidget {
//   const TestVideo({Key? key}) : super(key: key);

//   @override
//   _TestVideoState createState() => _TestVideoState();
// }

// class _TestVideoState extends State<TestVideo> {
//   getVido() async {
//     var url = "http://localhos/ecole/getback/getcours.php";
//     var uri = Uri.parse(url);
//     http.Response videos = await http.get(uri);
//     if (videos.statusCode == 200) {
//       var list = [];
//       final data = videos.body;
//       final taille = json.decode(data);
//       for (var cour in taille) {
//         list.add(cour['cours']);
//       }
//       return list;
//     } else {
//       // ignore: avoid_print
//       print('erreur');
//       return [];
//     }
//   }

//   // var taille = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "test de vidéo",
//           style: TextStyle(
//             fontSize: 30,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//           itemCount: getVido().lenght,
//           itemBuilder: (context, index) {
//             return Text(getVido().lenght == 0 ? "vide" : getVido()[index]);
//           }),
//     );
//   }
// }

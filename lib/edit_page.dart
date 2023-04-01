import 'dart:html';

import 'package:carrot/show_profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (editPage())
    );
  }
}

class editPage extends StatefulWidget {
  const editPage({super.key});

  @override
  State<editPage> createState() => _editPageState();
}

// class _editPageState extends State<editPage> {
//   TextEditingController inputController = TextEditingController();
//   String inputText = '';
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.black),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.white,
//         actions: [
//           TextButton(onPressed: (() {
//             Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: ((context) => showProfile())));  
//           }),
//           child: Text('완료', style: TextStyle(color: Colors.black)))
//         ],
//         title: Text('프로필 수정', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
//       ),
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 8),
//           child: ListView(
//             children: [
//               profileImage(),
//               userName(context)
//             ]
//         )
//       )
//     );
//   }
// }

class _editPageState extends State<editPage> {
  TextEditingController inputController = TextEditingController();
  String inputText = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(onPressed: (() {
            setState(() {
                      inputText = inputController.text;
                    });
            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => showProfile())));  
          }),
          child: Text('완료', style: TextStyle(color: Colors.black)))
        ],
        title: Text('프로필 수정', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            children: [
              SizedBox(height: 10),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/person.jpg"),
              ),
              Container(
                child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$inputText'),
        SizedBox(height: 15),
        Text('닉네임', style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: GestureDetector(
            onTap: (() => FocusScope.of(context).unfocus()),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                labelText: '닉네임을 입력해주세요.',
                hintText: '닉네임을 입력해주세요!'
            ),
        )
          )
        ),      
      ]
    ),
              )
            ]
        )
      )
    );
  }
}

// Widget profileImage() {
//   return Container(
//     child: Column(
//       children: [
//       SizedBox(height: 10),
//         CircleAvatar(
//           radius: 50,
//           backgroundImage: AssetImage("assets/images/person.jpg"),
//         )
//     ],)
//   );
// }

// Widget userName(BuildContext context){
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 15),
//         Text('닉네임', style: TextStyle(fontWeight: FontWeight.bold)),
//         TextField(
//               // controller: inputController,
//               decoration: InputDecoration(
//                 enabledBorder: InputBorder.none,
//                 labelText: '닉네임을 입력해주세요.',
//             ),
//         )
//       ]
//           )
//         );
    
// }



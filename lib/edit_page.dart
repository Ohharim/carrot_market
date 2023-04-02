import 'package:carrot/profile_page.dart';
import 'package:flutter/material.dart';

class editPage extends StatefulWidget {
  const editPage({super.key});

  @override
  State<editPage> createState() => _editPageState();
}

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
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(inputText);
              setState(() {
                      inputText = inputController.text;}); 
                    },
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
              SizedBox(
                height: 200,
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
                            //controller: TextEditingController(text: inputText),
                            onChanged: (inputText) {
                            setState(() {
                              inputText = inputController.text;
                            });
                          },
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


import 'package:carrot/edit_page.dart';
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
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "user_name";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.ios_share_rounded))
        ],
        title: const Text("프로필",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            children: [EditProfileWidget()],
          )
        )
    );    
  }
}

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  TextEditingController inputController = TextEditingController();
  String inputText = '';
  @override
  Widget build(BuildContext cnotext) {
    return SizedBox(
      child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/person.jpg"),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(('user_name'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
          ],
        ),
        SizedBox(height: 20),
        Row(          
          children: [            
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => editPage())));
                  },
                    style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade100,
                    onPrimary: Colors.black,
                    shadowColor: Colors.transparent,
                  ),
                  child: Text('프로필 수정', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),))
                ],
              )
            )
          ],
        )
      ],
    )

    );
  }
}
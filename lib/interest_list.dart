import 'dart:html';
import 'package:carrot/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: interestList(),
    );
  }
}

class interestList extends StatefulWidget {
  const interestList({super.key});

  @override
  State<interestList> createState() => _interestListState();
}


class _interestListState extends State<interestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("관심목록",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        ),
        body: const Center(
          child: Text("아직 관심 목록이 없어요.")
      )
    );
        
      
    
  }
}

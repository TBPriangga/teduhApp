// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class renunganScreen extends StatefulWidget {
  const renunganScreen({Key? key}) : super(key: key);

  static const routeName = '/renunganscreen';
  @override
  State<renunganScreen> createState() => _renunganScreenState();
}

class _renunganScreenState extends State<renunganScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pockets"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {},
              child: Text("Accounts"),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text("Add"),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text("Deduct"),
            ),
          ],
        ),
      ),
    );
  }
}

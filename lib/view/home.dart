import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pockets/controller/hive/boxes.dart';
import 'package:pockets/model/hive/account.dart';
import 'package:pockets/view/account/accounts.dart';

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountScreen(),
                  ),
                );
              },
              child: Text("Accounts"),
            ),
            MaterialButton(
              onPressed: () {
                final accountBox = Boxes.getAccounts();
                accountBox.add(
                  Account(
                    name: "Test Account",
                    amount: 5000,
                  ),
                );
              },
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

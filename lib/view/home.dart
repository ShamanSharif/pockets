import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pockets/controller/hive/boxes.dart';
import 'package:pockets/model/hive/account.dart';
import 'package:pockets/view/account/account_screen.dart';
import 'package:pockets/view/model/pockets_account_hero.dart';

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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: PocketsAccountHero(
                height: MediaQuery.of(context).size.height * 0.4,
                amount: 5000,
              ),
            ),
            Row(
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: Text("Add"),
                ),
                MaterialButton(
                  onPressed: () async {
                    final accountBox = Boxes.getAccounts();
                    await accountBox.clear();
                  },
                  child: Text("Deduct"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

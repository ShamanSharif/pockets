import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pockets/controller/hive/boxes.dart';
import 'package:pockets/model/hive/account.dart';
import 'package:pockets/view/account/account_screen.dart';
import 'package:pockets/view/account/add_to_account.dart';
import 'package:pockets/view/account/deduct_from_account.dart';
import 'package:pockets/view/model/pockets_account_hero.dart';
import 'package:pockets/view/model/pockets_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? totalAmount;

  @override
  void initState() {
    fetchFromDB();
    super.initState();
  }

  fetchFromDB() {
    final box = Boxes.getAccounts();
    List<Account> accounts = box.values.toList();
    int total = 0;
    for (Account account in accounts) {
      total += account.amount;
    }
    setState(() {
      totalAmount = total;
    });
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pockets"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: PocketsAccountHero(
                height: MediaQuery.of(context).size.height * 0.4,
                amountString: totalAmount == null
                    ? "Calculating"
                    : totalAmount == 0
                        ? "Please Add an Account"
                        : "Calculated to \n$totalAmount BDT",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountScreen(),
                    ),
                  ).then((value) => fetchFromDB());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: PocketsButton(
                      child: const Text("Add"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddToAccount(),
                          ),
                        ).then((value) => fetchFromDB());
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: PocketsButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DeductFromAccount(),
                          ),
                        ).then((value) => fetchFromDB());
                      },
                      child: const Text("Deduct"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

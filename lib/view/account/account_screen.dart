import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pockets/controller/hive/boxes.dart';
import 'package:pockets/model/hive/account.dart';
import 'package:pockets/view/account/add_account.dart';
import 'package:pockets/view/model/pockets_account_card.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accounts"),
      ),
      body: SafeArea(
        child: ValueListenableBuilder<Box<Account>>(
          valueListenable: Boxes.getAccounts().listenable(),
          builder: (context, box, _) {
            final accounts = box.values.toList().cast<Account>();
            return buildAccountsWidget(accounts);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddAccountScreen();
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildAccountsWidget(List<Account> accounts) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          for (Account account in accounts)
            PocketsAccountCard(
              name: account.name,
              amount: account.amount,
            )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pockets/controller/hive/boxes.dart';
import 'package:pockets/model/hive/account.dart';

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
    );
  }

  Widget buildAccountsWidget(List<Account> accounts) {
    return Column(
      children: [
        for (Account account in accounts)
          Container(
            child: Column(
              children: [
                Text(account.name),
                Text(account.amount.toString()),
              ],
            ),
          )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pockets/model/hive/account.dart';
import 'package:pockets/view/account/account_delete.dart';
import 'package:pockets/view/account/account_edit_screen.dart';
import 'package:pockets/view/model/pockets_account_edit_hero.dart';

import '../model/pockets_button.dart';

class AccountViewScreen extends StatefulWidget {
  final Account account;
  const AccountViewScreen({
    Key? key,
    required this.account,
  }) : super(key: key);

  @override
  State<AccountViewScreen> createState() => _AccountViewScreenState();
}

class _AccountViewScreenState extends State<AccountViewScreen> {
  late Account account;

  @override
  void initState() {
    account = widget.account;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Account"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              PocketsAccountEditHero(
                height: MediaQuery.of(context).size.height * 0.4,
                name: account.name,
                amount: account.amount,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25.0,
                  horizontal: 5.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: PocketsButton(
                        isWhite: true,
                        child: const Text("Edit"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AccountEditScreen(
                                account: account,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: PocketsButton(
                        primary: false,
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AccountDeleteScreen(
                                account: account,
                              ),
                            ),
                          );
                        },
                        child: const Text("Delete"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

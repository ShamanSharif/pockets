import 'package:flutter/material.dart';
import 'package:pockets/model/hive/account.dart';
import 'package:pockets/view/model/pocket_text_form_field.dart';
import 'package:pockets/view/model/pockets_button.dart';

class AccountEditScreen extends StatefulWidget {
  final Account account;
  const AccountEditScreen({
    Key? key,
    required this.account,
  }) : super(key: key);

  @override
  State<AccountEditScreen> createState() => _AccountEditScreenState();
}

class _AccountEditScreenState extends State<AccountEditScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Account account;
  late String name;
  late int amount;

  @override
  void initState() {
    account = widget.account;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Account"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: PocketsTextFormField(
                    labelText: "Account Name",
                    initialValue: account.name,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter account name";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        name = val!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: PocketsTextFormField(
                    labelText: "Edit Amount",
                    keyboardType: TextInputType.number,
                    initialValue: account.amount.toString(),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter a valid amount";
                      }
                      if (int.tryParse(val) == null) {
                        return "Please enter a valid number";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        amount = int.parse(val!);
                      });
                    },
                  ),
                ),
                const Spacer(),
                PocketsButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    _formKey.currentState?.save();
                    account.name = name;
                    account.amount = amount;
                    account.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          "Account Updated Successfully",
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        // behavior: SnackBarBehavior.floating,
                      ),
                    );
                    int count = 0;
                    Navigator.popUntil(context, (route) {
                      return count++ == 2;
                    });
                  },
                  child: const Center(
                    child: Text("Save"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

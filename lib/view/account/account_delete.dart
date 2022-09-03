import 'package:flutter/material.dart';
import 'package:pockets/model/hive/account.dart';
import 'package:pockets/view/model/pocket_text_form_field.dart';
import 'package:pockets/view/model/pockets_button.dart';

class AccountDeleteScreen extends StatefulWidget {
  final Account account;
  const AccountDeleteScreen({
    Key? key,
    required this.account,
  }) : super(key: key);

  @override
  State<AccountDeleteScreen> createState() => _AccountDeleteScreenState();
}

class _AccountDeleteScreenState extends State<AccountDeleteScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Account account;
  late String confirm;

  @override
  void initState() {
    account = widget.account;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delete Account"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "You really want to delete the account ${account.name}?",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Write 'Yes' to confirm",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: PocketsTextFormField(
                    labelText: "Confirm Delete",
                    validator: (val) {
                      if (val == null || val.isEmpty || val != 'Yes') {
                        return "Please write 'Yes'";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        confirm = val!;
                      });
                    },
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: PocketsButton(
                    primary: false,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      _formKey.currentState?.save();
                      account.delete();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            "Account Deleted Successfully",
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          // behavior: SnackBarBehavior.floating,
                        ),
                      );
                      int count = 0;
                      Navigator.popUntil(context, (route) {
                        return count++ == 2;
                      });
                    },
                    child: const Center(
                      child: Text("Delete"),
                    ),
                  ),
                ),
                PocketsButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Center(
                    child: Text("Go Back"),
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

import 'package:flutter/material.dart';
import 'package:pockets/controller/hive/boxes.dart';
import 'package:pockets/model/hive/account.dart';
import 'package:pockets/view/model/pocket_text_form_field.dart';

class AddAccountScreen extends StatefulWidget {
  const AddAccountScreen({Key? key}) : super(key: key);

  @override
  State<AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<AddAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Account"),
      ),
      body: SafeArea(
        child: Form(
          child: Column(
            children: [
              PocketsTextFormField(),
              PocketsTextFormField(),
              Spacer(),
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
                child: Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

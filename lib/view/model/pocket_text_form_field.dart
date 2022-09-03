import 'package:flutter/material.dart';

class PocketsTextFormField extends StatelessWidget {
  final String? initialValue;
  final String? labelText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  const PocketsTextFormField({
    Key? key,
    this.initialValue,
    this.labelText,
    this.onSaved,
    this.validator,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).colorScheme.primary,
      initialValue: initialValue,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceVariant,
        isDense: true,
        border: const OutlineInputBorder(),
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}

import 'package:flutter/material.dart';

class PocketsButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final bool primary;
  final bool isWhite;
  const PocketsButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.primary = true,
    this.isWhite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: isWhite
          ? Theme.of(context).colorScheme.surfaceVariant
          : primary
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.error,
      textTheme: ButtonTheme.of(context).textTheme,
      textColor: isWhite ? Colors.black : Theme.of(context).colorScheme.surface,
      height: 50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: child,
    );
  }
}

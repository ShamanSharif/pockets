import 'package:flutter/material.dart';

class PocketsAccountEditHero extends StatelessWidget {
  final String name;
  final int amount;
  final double height;
  const PocketsAccountEditHero({
    super.key,
    required this.height,
    required this.name,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  "Account $name",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.surface,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "has $amount BDT",
                  style: TextStyle(
                    fontSize: 36,
                    color: Theme.of(context).colorScheme.surface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

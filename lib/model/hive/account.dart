import 'package:hive/hive.dart';

part 'account.g.dart';

@HiveType(typeId: 0)
class Account extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int amount;

  Account({
    required this.name,
    required this.amount,
  });

  @override
  String toString() {
    return name;
  }
}

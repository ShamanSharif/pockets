import 'package:hive/hive.dart';
import 'package:pockets/model/hive/account.dart';

class Boxes {
  static Box<Account> getAccounts() => Hive.box<Account>('accounts');
}

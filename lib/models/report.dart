import 'expense.dart';
import 'transaction.dart';
import 'budget.dart';


class Report {
  List<Expense> expenses;
  List<Transaction> transactions;
  Budget budget;

  Report({
    required this.expenses,
    required this.transactions,
    required this.budget,
  });
}

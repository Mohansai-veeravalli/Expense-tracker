class Transaction {
  double amount;
  String party;
  DateTime date;
  String type; // "borrowed" or "lent"

  Transaction({
    required this.amount,
    required this.party,
    required this.date,
    required this.type,
  });
}

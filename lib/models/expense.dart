
class Expense {
  String description;
  double amount;
  DateTime date;
  String categoryId;

  Expense({
    required this.description,
    required this.amount,
    required this.date,
    required this.categoryId,
  });

// Define a static method to create an Expense object from JSON
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      description: json['description'],
      amount: json['amount'],
      date: DateTime.parse(json['date']), // Assuming date is stored as a string
      categoryId: json['categoryId'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'amount': amount,
      'date': date.toIso8601String(),
      'categoryId': categoryId,
    };
  }
}

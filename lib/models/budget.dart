class Budget {
  double totalBudget;
  Map<String, double> categoryBudgets; // Map<categoryId, budget>

  Budget({
    required this.totalBudget,
    required this.categoryBudgets,
  });
}

enum Category { food, travel, leisure, work, other }

class Expense {
  final Category category;
  final String id, title;
  final double amount;
  final DateTime date;
  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });
}

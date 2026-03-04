import 'package:uuid/uuid.dart';

final uuid = Uuid();

enum Category { food, travel, leisure, work, other }

class Expense {
  final Category category;
  final String id, title;
  final double amount;
  final DateTime date;
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    String? id,
  }) : id = id ?? uuid.v4();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': category.name,
    };
  }

  // 2. Builds an object back from the JSON Map when loading
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      category: Category.values.firstWhere((c) => c.name == json['category']),
    );
  }
}

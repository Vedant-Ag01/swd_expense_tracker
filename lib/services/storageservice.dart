import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:expense_tracker/models/expense.dart';

class LocalStorageService {
  static const _key = 'expenses_data';
  Future<void> saveExpenses(List<Expense> expenses) async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(
      expenses.map((e) => e.toJson()).toList(),
    );
    await prefs.setString(_key, encodedData);
  }

  Future<List<Expense>> loadExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final String? expensesString = prefs.getString(_key);

    if (expensesString == null) return [];
    final List<dynamic> decodedData = jsonDecode(expensesString);
    return decodedData.map((item) => Expense.fromJson(item)).toList();
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseCountNotifier extends Notifier<List<Expense>> {
  @override
  List<Expense> build() {
    return [];
  }

  void addExpense(Expense expense) {
    state = [...state, expense];
  }

  void removeExpense(String id) {
    state = state.where((expense) => expense.id != id).toList();
  }
}

final expenseCountProvider =
    NotifierProvider<ExpenseCountNotifier, List<Expense>>(() {
      return ExpenseCountNotifier();
    });

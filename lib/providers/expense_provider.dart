import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/services/storageservice.dart';

class ExpenseCountNotifier extends Notifier<List<Expense>> {
  final LocalStorageService _storageService = LocalStorageService();

  @override
  List<Expense> build() {
    _loadInitialData();
    return [];
  }

  Future<void> _loadInitialData() async {
    final savedExpenses = await _storageService.loadExpenses();
    state = savedExpenses;
  }

  void addExpense(Expense expense) {
    state = [...state, expense];
    _storageService.saveExpenses(state); // Saving after adding
  }

  void removeExpense(String id) {
    state = state.where((expense) => expense.id != id).toList();
    _storageService.saveExpenses(state); // Saving after removing
  }
}

final expenseCountProvider =
    NotifierProvider<ExpenseCountNotifier, List<Expense>>(() {
      return ExpenseCountNotifier();
    });

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/providers/expense_provider.dart';

class ExpenseList extends ConsumerWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expenseCountProvider);
    if (expenses.isEmpty) {
      return const Center(child: Text('No expenses found. Add some!'));
    }
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        final expense = expenses[index];

        return Dismissible(
          key: ValueKey(expense.id),
          background: Container(
            color: Colors.red.withValues(alpha: 0.7),
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
          onDismissed: (direction) {
            ref.read(expenseCountProvider.notifier).removeExpense(expense.id);
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(expense.title),
              subtitle: Text('\$${expense.amount.toStringAsFixed(2)}'),
              trailing: Text(expense.category.name.toUpperCase()),
            ),
          ),
        );
      },
    );
  }
}

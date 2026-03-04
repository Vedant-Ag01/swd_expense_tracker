import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/providers/expense_provider.dart';
import 'package:expense_tracker/widgets/new_expenses.dart';

class ExpenseList extends ConsumerWidget {
  final Category? filter;

  const ExpenseList({super.key, this.filter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expenseCountProvider);

    final displayExpenses = filter == null
        ? expenses
        : expenses.where((e) => e.category == filter).toList();

    final totalSpent = displayExpenses.fold(
      0.0,
      (sum, item) => sum + item.amount,
    );

    if (displayExpenses.isEmpty) {
      return const Center(child: Text('No expenses found for this category.'));
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Total Spent: \$${totalSpent.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: displayExpenses.length,
            itemBuilder: (context, index) {
              final expense = displayExpenses[index];
              return Dismissible(
                key: ValueKey(expense.id),
                background: Container(
                  color: Colors.red.withValues(alpha: 0.7),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                ),
                onDismissed: (direction) {
                  ref
                      .read(expenseCountProvider.notifier)
                      .removeExpense(expense.id);
                },
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (ctx) => NewExpense(expenseToEdit: expense),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
                      title: Text(expense.title),
                      subtitle: Text('\$${expense.amount.toStringAsFixed(2)}'),
                      trailing: Text(expense.category.name.toUpperCase()),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

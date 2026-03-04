import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:expense_tracker/widgets/new_expenses.dart';
import 'package:expense_tracker/models/expense.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Category? _selectedFilter;
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_alt),
            onSelected: (value) {
              setState(() {
                if (value == 'All') {
                  _selectedFilter = null;
                } else {
                  _selectedFilter = Category.values
                      .where((c) => c.name == value)
                      .first;
                }
              });
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(value: 'All', child: Text('All')),
              ...Category.values.map(
                (c) => PopupMenuItem(
                  value: c.name,
                  child: Text(c.name.toUpperCase()),
                ),
              ),
            ],
          ),
        ],
      ),

      body: ExpenseList(filter: _selectedFilter),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddExpenseOverlay,
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'bottomNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/expense.dart';

class AddExpensePage extends StatefulWidget {
  @override
  _AddExpensePageState createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  int _selectedIndex = 0;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  List<Expense> _expenses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
              ),
              TextButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != _selectedDate)
                    setState(() {
                      _selectedDate = picked;
                    });
                },
                child: Text('Select Date'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save expense
                    saveExpense(Expense(
                      description: _descriptionController.text, 
                      amount: double.parse(_amountController.text), 
                      date: _selectedDate, 
                      categoryId: 'Food'));
                  }
                },
                child: Text('Save Expense'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Get and display expenses
                  getAndDisplayExpenses();
                },
                child: Text('Get Expenses'),
              ),
              // Display saved expenses here
              Expanded(
                child: ListView.builder(
                  itemCount: _expenses.length,
                  itemBuilder: (context, index) {
                    final expense = _expenses[index];
                    return ListTile(
                      title: Text(expense.description),
                      subtitle: Text('Amount: ${expense.amount.toStringAsFixed(2)}'),
                      trailing: Text('Date: ${expense.date.toString()}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  void saveExpense(Expense expense) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? expensesJson = prefs.getStringList('expenses') ?? [];
    expensesJson.add(json.encode(expense.toJson()));
    await prefs.setStringList('expenses', expensesJson);
  }

  void getAndDisplayExpenses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? expensesJson = prefs.getStringList('expenses');
    if (expensesJson != null) {
      List<Expense> expenses = [];
      for (String expenseJsonString in expensesJson) {
        Map<String, dynamic> expenseMap = json.decode(expenseJsonString);
        Expense expense = Expense.fromJson(expenseMap);
        expenses.add(expense);
      }
      setState(() {
        _expenses = expenses;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

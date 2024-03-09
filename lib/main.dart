// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// void main() {
//   runApp(ExpenseTrackerApp());
// }

// class ExpenseTrackerApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Expense Tracker',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ExpenseTrackerScreen(),
//     );
//   }
// }

// class ExpenseTrackerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Expense Tracker'),
//       ),
//       body: ExpenseForm(), // Display the ExpenseForm widget
//     );
//   }
// }

// class ExpenseForm extends StatefulWidget {
//   const ExpenseForm({Key? key}) : super(key: key); // Add named 'key' parameter

//   @override
//   _ExpenseFormState createState() => _ExpenseFormState();
// }

// class _ExpenseFormState extends State<ExpenseForm> {
//   final _expenseController = TextEditingController();
//   String _expense = '';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           const Text(
//             'Enter Expense:',
//             style: TextStyle(fontSize: 18.0),
//           ),
//           TextField(
//             controller: _expenseController,
//             keyboardType: TextInputType.text,
//             onChanged: (value) {
//               setState(() {
//                 _expense = value;
//               });
//             },
//           ),
//           SizedBox(height: 16.0),
//           ElevatedButton(
//             onPressed: _saveExpense,
//             child: Text('Save Expense'),
//           ),
//         ],
//       ),
//     );
//   }

//   // Function to save the entered expense to local storage
//   void _saveExpense() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String>? expenses = prefs.getStringList('expenses') ?? [];
//     expenses.add(_expense);
//     await prefs.setStringList('expenses', expenses);
    
//     // Clear the text field after saving the expense
//     _expenseController.clear();
    
//     // Display a message to the user
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Expense saved successfully')),
//     );
//   }
// }
//   final _expenseController = TextEditingController(); // Controller for expense input
//   String _expense = ''; // Variable to store the entered expense

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0), // Use const here
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           const Text( // Use const here
//             'Enter Expense:',
//             style: TextStyle(fontSize: 18.0),
//           ),
//           TextField(
//             controller: _expenseController,
//             keyboardType: TextInputType.text,
//             onChanged: (value) {
//               setState(() {
//                 _expense = value;
//               });
//             },
//           ),
//           const SizedBox(height: 16.0),
//           ElevatedButton( // Use ElevatedButton instead of RaisedButton
//             onPressed: () {
//               // Add functionality to save the expense
//               if (_expense.isNotEmpty) {
//                 // You can add the logic to save the expense here
//                 print('Expense: $_expense');
//                 // Clear the text field after saving the expense
//                 _expenseController.clear();
//               }
//             },
//             child: Text('Save Expense'),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() => runApp(MyExpenseTrackerApp());

class MyExpenseTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpenseTrackerHomePage(),
    );
  }
}

class ExpenseTrackerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good afternoon, Enjelin Morgaena',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Balance',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$2,548.00',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Income \$1,840.00'),
                        Text('Expenses \$284.00'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Transactions History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Replace with your transaction list widget
            // Example: ListView.builder(itemBuilder: ...)
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to all transactions screen
                },
                child: const Text('See all'),
              ),
            ),
             const SizedBox(height: 24),
            // Replace with your "Send Again" section
            // Example: Circular icons with contacts
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new transaction
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


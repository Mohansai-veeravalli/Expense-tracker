// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'Home.dart';

void main() => runApp(MyExpenseTrackerApp());

class MyExpenseTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpenseTrackerHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


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
//                 print('Expense: ' +currencyType + '_expense');
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

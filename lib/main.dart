// import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart'; // Import the Transaction model
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

class ExpenseTrackerHomePage extends StatefulWidget {
  @override
  _ExpenseTrackerHomePageState createState() => _ExpenseTrackerHomePageState();
}

class _ExpenseTrackerHomePageState extends State<ExpenseTrackerHomePage> {
  int _selectedIndex = 0;

  final List<Transaction> transactions = [
    Transaction(
      logo: Icon(Icons.handshake),
      amount: 200.00,
      party: 'John Doe',
      date: DateTime.now(),
      type: 'borrowed',
    ),
    Transaction(
      logo: Icon(Icons.money),
      amount: 100.00,
      party: 'John Doe',
      date: DateTime.now(),
      type: 'borrowed',
    ),
    Transaction(
      logo: Icon(Icons.money),
      amount: 50.00,
      party: 'Jane Smith',
      date: DateTime.now().subtract(Duration(days: 1)),
      type: 'lent',
    ),
    Transaction(
      logo: Icon(Icons.handshake),
      amount: 200.00,
      party: 'Alice Johnson',
      date: DateTime.now().subtract(Duration(days: 2)),
      type: 'borrowed',
    ),
    // Add more transactions as needed
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Expense Tracker')),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: const BoxDecoration(
                color: Color.fromARGB(
                    255, 63, 160, 153), // Set background color to #358882
                borderRadius: BorderRadius.only(
                  bottomLeft:
                      Radius.circular(80), // Adjust bottom-left corner radius
                  // bottomRight: Radius.circular(80), // Adjust bottom-right corner radius
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Good afternoon,',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                const Text(
                  'Sakshi Dhaiphule',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Card(
                  elevation: 4,
                  color: Color(0xFF2F7E79), // Set card color to #2f7e79
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Balance',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white, // Set text color to white
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$2,548.00',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Set text color to white
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Income \$1,840.00',
                              style: TextStyle(
                                color: Colors.white, // Set text color to white
                              ),
                            ),
                            Text(
                              'Expenses \$284.00',
                              style: TextStyle(
                                color: Colors.white, // Set text color to white
                              ),
                            ),
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
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: transaction.logo,
                        ),
                        title: Text(transaction.party),
                        subtitle: Text(
                            '${transaction.type} \$${transaction.amount.toStringAsFixed(2)}'),
                        trailing: Text(
                          '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigate to all transactions screen
                    },
                    child: const Text('See all'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new transaction
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Icon(Icons.home_filled)
                : Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Icon(Icons.bar_chart_sharp,
                )
                : Icon(Icons.bar_chart_outlined),
            label: 'Expense Stats',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Icon(Icons.description_sharp,
                )
                : Icon(Icons.description_outlined),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Icon(Icons.person_2_sharp)
                : Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            Color.fromARGB(255, 63, 160, 153), // Color of selected tab
        onTap: _onItemTapped,
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

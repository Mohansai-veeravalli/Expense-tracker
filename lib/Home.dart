import 'constants.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart'; // Import the Transaction model
import 'AddExpense.dart';
import 'bottomNavigationBar.dart';

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

class BezierClipper1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var height = size.height;
    var width = size.width;
    var heightOffSet = height * 0.2;
    Path path = Path();
    path.lineTo(
       0, //x
       height - heightOffSet); //y
    path.quadraticBezierTo(width* 0.5, height, width, height - heightOffSet);
    path.lineTo(width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
return true;
  }
}
class _ExpenseTrackerHomePageState extends State<ExpenseTrackerHomePage> {
  int _selectedIndex = 0;

  final List<Transaction> transactions = [
    Transaction(
      logo: Icon(Icons.handshake),
      amount: 2000.00,
      party: 'Mohansai Veeravalli',
      date: DateTime.now(),
      type: 'borrowed',
    ),
    Transaction(
      logo: Icon(Icons.money),
      amount: 1000.00,
      party: 'Sanjay Ramabuddi',
      date: DateTime.now(),
      type: 'lent',
    ),
    Transaction(
      logo: Icon(Icons.money),
      amount: 500.00,
      party: 'Shaddha Vishwakarma',
      date: DateTime.now().subtract(Duration(days: 1)),
      type: 'lent',
    ),
    Transaction(
      logo: Icon(Icons.handshake),
      amount: 2000.00,
      party: 'Mohansai Veeravalli',
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
          
        ClipPath(
            clipper: BezierClipper1(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              color: const Color.fromARGB(
                    255, 63, 160, 153),
            ),
        ),
          Padding(
padding: const EdgeInsets.only(top: 80, left: 16, right: 16, bottom: 16),            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Good afternoon,',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                const Text(
                  'Sakshi Dhaiphule',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Card(
                  
                  elevation: 3,
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
                          currencyType + '2,5480.00',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Set text color to white
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment : MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Income ' +currencyType + '1,8400.00',
                              style: TextStyle(
                                color: Colors.white, // Set text color to white
                              ),
                            ),
                            Text(
                              'Expenses ' +currencyType + '2840.00',
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
                            '${transaction.type} ' +currencyType + '${transaction.amount.toStringAsFixed(2)}'),
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
          Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddExpensePage()),
    );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
    );
  }
}

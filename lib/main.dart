import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:planer_wydatkow/widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

const Color myPrimaryColor = Color(0xFF6200ee);
const Color mySecondaryColor = Color(0xff03dac4);

void main() {
  initializeDateFormatting('pl');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planer wydatków',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'TiltNeon',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.orange,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 1, title: 'Banany', price: 4.50, date: DateTime.now()),
    Transaction(id: 2, title: 'Jogurt', price: 2.50, date: DateTime.now()),
    Transaction(id: 3, title: 'Pizza', price: 15.00, date: DateTime.now()),
    Transaction(id: 4, title: 'Kebab', price: 23.00, date: DateTime.now()),
    Transaction(id: 5, title: 'Koktajl', price: 8.00, date: DateTime.now()),
    Transaction(id: 6, title: 'Kawa', price: 10.00, date: DateTime.now()),
    Transaction(id: 4, title: 'Kebab', price: 23.00, date: DateTime.now()),
    Transaction(id: 5, title: 'Koktajl', price: 8.00, date: DateTime.now()),
    Transaction(id: 6, title: 'Kawa', price: 10.00, date: DateTime.now()),
  ];

  void _addNewTransaction(
    int id,
    String title,
    double price,
  ) {
    setState(() {
      _userTransactions.add(Transaction(
          id: id, title: title, price: price, date: DateTime.now()));
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () => _startAddNewTransaction(context),
          child: const Icon(Icons.add, color: Colors.white),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => _startAddNewTransaction(context),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Container(
                margin: const EdgeInsets.all(4.0),
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Pn'),
                        Text('Wt'),
                        Text('Śr'),
                        Text('Czw'),
                        Text('Pt'),
                        Text('Sob'),
                        Text('Nd')
                      ],
                    ),
                  ),
                ),
              ),
              TransactionList(_userTransactions)
            ],
          ),
        ));
  }
}

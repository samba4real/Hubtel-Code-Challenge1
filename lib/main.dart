import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction History',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TransactionHistoryPage(),
    );
  }
}

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TransactionHistoryPageState createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transaction History'),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildTransactionHeader(),
                      _buildTransactionSearch(),
                      _buildTransactionList(),
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: _buildBottomNavigationBar());
  }

  Widget _buildTransactionHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'History',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'Transaction Summary',
          style: TextStyle(fontSize: 24, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildTransactionSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.filter_list),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTransactionItem(
          time: '14:45PM',
          name: 'Emmanuel Rockson\nKwabena Uncle Ebo',
          phone: '024 123 4567',
          amount: 'GHS 500',
          status: 'Successful',
          statusColor: Colors.green,
          icon: Icons.person,
          note: 'Personal • Cool your heart wai',
        ),
        _buildTransactionItem(
          time: '14:45PM',
          name: 'Absa Bank',
          phone: '024 123 4567',
          amount: 'GHS 500',
          status: 'Failed',
          statusColor: Colors.red,
          icon: Icons.book,
          note: 'Personal • Cool your heart wai',
        ),
        const SizedBox(height: 16),
        const Text(
          'May 23, 2022',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 8),
        FloatingActionButton.extended(
          icon: const Icon(
            Icons.add,
          ),
          onPressed: () {},
          label: const Text('SEND NEW'),
        ),
      ],
    );
  }

  Widget _buildTransactionItem({
    required String time,
    required String name,
    required String phone,
    required String amount,
    required String status,
    required Color statusColor,
    required IconData icon,
    required String note,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(icon, color: Colors.black),
          ),
          title: Text(name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(phone),
              Row(
                children: [
                  Text(
                    status,
                    style: TextStyle(color: statusColor),
                  ),
                  const SizedBox(width: 8),
                  Text(amount),
                ],
              ),
              Text(note),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {},
          ),
          const SizedBox(width: 40), // Space for the floating action button
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.schedule),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  final List<Map<String, String>> paymentMethods = [
    {
      'type': 'UPI',
      'detail': 'ravi@ybl',
    },
    {
      'type': 'Bank Account',
      'detail': 'HDFC Bank ••••1234',
    },
  ];

  final TextEditingController _newMethodController = TextEditingController();
  String selectedType = 'UPI';

  void _showAddPaymentDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Add Payment Method'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: selectedType,
                items: const [
                  DropdownMenuItem(value: 'UPI', child: Text('UPI')),
                  DropdownMenuItem(value: 'Bank Account', child: Text('Bank Account')),
                ],
                onChanged: (val) => setState(() => selectedType = val!),
                decoration: const InputDecoration(labelText: 'Type'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _newMethodController,
                decoration: const InputDecoration(labelText: 'Details'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                _newMethodController.clear();
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE67E22)),
              child: const Text('Add'),
              onPressed: () {
                final newMethod = _newMethodController.text.trim();
                if (newMethod.isNotEmpty) {
                  setState(() {
                    paymentMethods.add({'type': selectedType, 'detail': newMethod});
                  });
                  _newMethodController.clear();
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _removeMethod(int index) {
    setState(() {
      paymentMethods.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
        backgroundColor: const Color(0xFFE67E22),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddPaymentDialog,
          ),
        ],
      ),
      body: paymentMethods.isEmpty
          ? const Center(child: Text('No payment methods added.'))
          : ListView.builder(
              itemCount: paymentMethods.length,
              itemBuilder: (context, index) {
                final method = paymentMethods[index];
                return ListTile(
                  leading: Icon(
                    method['type'] == 'UPI' ? Icons.account_balance_wallet : Icons.account_balance,
                    color: Colors.orange,
                  ),
                  title: Text(method['detail']!),
                  subtitle: Text(method['type']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () => _removeMethod(index),
                  ),
                );
              },
            ),
    );
  }
}

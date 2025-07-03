import 'package:flutter/material.dart';

class BookPersonPage extends StatelessWidget {
  final String name;
  final String location;
  final String imageUrl;

  const BookPersonPage({
    super.key,
    required this.name,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    String selectedDuration = '1 hour';
    String selectedBudget = '₹500 – ₹800';

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Book A Person'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(height: 16),
            Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(location, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            DropdownButtonFormField<String>(
              value: selectedDuration,
              items: const [
                DropdownMenuItem(value: '1 hour', child: Text('1 hour')),
                DropdownMenuItem(value: '2 hours', child: Text('2 hours')),
                DropdownMenuItem(value: '3 hours', child: Text('3 hours')),
                DropdownMenuItem(value: '4 hours', child: Text('4 hours')),
                DropdownMenuItem(value: '5 hours', child: Text('5 hours')),
                DropdownMenuItem(value: '6 hours', child: Text('6 hours')),
                DropdownMenuItem(value: '7 hours', child: Text('7 hours')),
                DropdownMenuItem(value: '8 hours', child: Text('8 hours')),
                DropdownMenuItem(value: '9 hours', child: Text('9 hours')),
                DropdownMenuItem(value: '10 hours', child: Text('10 hours')),
              ],
              decoration: const InputDecoration(labelText: 'Duration'),
              onChanged: (value) {
                selectedDuration = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedBudget,
              items: const [
                DropdownMenuItem(value: '₹500 – ₹800', child: Text('₹500 – ₹800')),
                DropdownMenuItem(value: '₹800 – ₹1000', child: Text('₹800 – ₹1000')),
              ],
              decoration: const InputDecoration(labelText: 'Budget (₹)'),
              onChanged: (value) {
                selectedBudget = value!;
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  // Continue button action here
                },
                child: const Text('Continue', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

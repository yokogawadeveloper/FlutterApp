import 'package:flutter/material.dart';

class NeedWorkerPage extends StatefulWidget {
  const NeedWorkerPage({super.key});

  @override
  State<NeedWorkerPage> createState() => _NeedWorkerPageState();
}

class _NeedWorkerPageState extends State<NeedWorkerPage> {
  String searchQuery = '';
  final List<Map<String, String>> jobs = [
    {
      'title': 'Painter Needed',
      'description': 'Paint 2BHK apartment',
      'location': 'Rajendra Park',
      'price': '₹1000'
    },
    {
      'title': 'Tutor for Class 10',
      'description': 'Teach Science and Maths',
      'location': 'Laxmi Nagar',
      'price': '₹3000/month'
    },
    {
      'title': 'Cook Required',
      'description': 'Need part-time cook for lunch/dinner',
      'location': 'Sector 21',
      'price': '₹500/day'
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredJobs = jobs.where((job) {
      final lower = searchQuery.toLowerCase();
      return job['title']!.toLowerCase().contains(lower) ||
             job['location']!.toLowerCase().contains(lower);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Jobs'),
        backgroundColor: const Color(0xFFE67E22),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by job or location',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (value) => setState(() => searchQuery = value),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredJobs.length,
              itemBuilder: (context, index) {
                final job = filteredJobs[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                  child: ListTile(
                    title: Text(job['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(job['description']!),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(job['location']!),
                          ],
                        ),
                      ],
                    ),
                    trailing: Text(job['price']!, style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

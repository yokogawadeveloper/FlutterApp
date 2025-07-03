// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MyJobsScreen extends StatefulWidget {
  const MyJobsScreen({super.key});

  @override
  State<MyJobsScreen> createState() => _MyJobsScreenState();
}

class _MyJobsScreenState extends State<MyJobsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'My Jobs',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TabBar(
          controller: _tabController,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.orange,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600),
          tabs: const [
            Tab(text: 'Hired'),
            Tab(text: 'Applied'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildJobList(hiredJobs),
              _buildJobList(appliedJobs),
            ],
          ),
        ),
      ],
    );
  }

  final List<Map<String, dynamic>> hiredJobs = [
    {
      'title': 'Electrician needed',
      'description': 'Fixing faulty wiring in the living room.',
      'location': 'Shivaji Nagar',
      'price': '₹ 800',
      'status': 'Ongoing',
      'statusColor': Colors.blue,
    },
    {
      'title': 'Plumbing repair',
      'description': 'Leaky faucet in the kitchen sink.',
      'location': 'MG Road',
      'price': '₹ 500',
      'status': 'Completed',
      'statusColor': Colors.green,
    },
  ];

  final List<Map<String, dynamic>> appliedJobs = [
    {
      'title': 'House Cleaning',
      'description': 'Deep cleaning for a 2BHK apartment.',
      'location': 'Koramangala',
      'price': '₹ 1200',
      'status': 'Pending',
      'statusColor': Colors.orange,
    },
    {
      'title': 'Wall Painting',
      'description': 'Paint required for 1 BHK flat.',
      'location': 'Banashankari',
      'price': '₹ 1500',
      'status': 'Pending',
      'statusColor': Colors.orange,
    },
  ];

  Widget _buildJobList(List<Map<String, dynamic>> jobs) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: _buildJobCard(
            title: job['title'],
            description: job['description'],
            location: job['location'],
            price: job['price'],
            status: job['status'],
            statusColor: job['statusColor'],
          ),
        );
      },
    );
  }

  Widget _buildJobCard({
    required String title,
    required String description,
    required String location,
    required String price,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                location,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              price,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

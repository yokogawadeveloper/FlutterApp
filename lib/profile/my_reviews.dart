// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MyReviewsPage extends StatelessWidget {
  const MyReviewsPage({super.key});

  final List<Map<String, dynamic>> reviews = const [
    {
      'name': 'Ramesh Kumar',
      'rating': 4,
      'comment': 'Very polite and clear instructions. Payment was on time.',
      'date': 'June 15, 2025',
    },
    {
      'name': 'Priya Sharma',
      'rating': 5,
      'comment': 'It was a pleasure working with you. Great communication!',
      'date': 'June 10, 2025',
    },
    {
      'name': 'Arun Mehta',
      'rating': 3,
      'comment': 'Job was delayed by a day, but payment was fair.',
      'date': 'May 25, 2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reviews'),
        backgroundColor: const Color(0xFFE67E22),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: reviews.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final review = reviews[index];
          return _buildReviewCard(review);
        },
      ),
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reviewer Name & Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                review['name'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                review['date'],
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Star Rating
          Row(
            children: List.generate(5, (i) {
              return Icon(
                i < review['rating'] ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 18,
              );
            }),
          ),
          const SizedBox(height: 10),

          // Comment
          Text(
            review['comment'],
            style: TextStyle(fontSize: 14, color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}

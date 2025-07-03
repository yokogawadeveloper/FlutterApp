import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  final List<Map<String, String>> faqs = const [
    {
      'question': 'How can I post a job?',
      'answer': 'Go to Home, tap "Need a Worker", fill out job details, and submit.',
    },
    {
      'question': 'How do I contact support?',
      'answer': 'You can email or call us using the contact options below.',
    },
    {
      'question': 'How do I delete my account?',
      'answer': 'Go to Settings > Account > Delete Account. You may also contact support.',
    },
    {
      'question': 'Is there a fee for posting a job?',
      'answer': 'No, posting jobs is currently free for all users.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: const Color(0xFFE67E22),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          // ignore: unnecessary_to_list_in_spreads
          ...faqs.map((faq) => _buildFaqTile(faq)).toList(),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 16),
          const Text(
            'Contact Us',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.email, color: Colors.orange),
            title: const Text('Email'),
            subtitle: const Text('support@kaamdekho.in'),
            onTap: () {
              // Add email launch logic if needed
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Launching email client...')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone, color: Colors.orange),
            title: const Text('Phone'),
            subtitle: const Text('+91 9876543210'),
            onTap: () {
              // Add phone call logic if needed
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Calling support...')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFaqTile(Map<String, String> faq) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 0),
      title: Text(
        faq['question']!,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            faq['answer']!,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}

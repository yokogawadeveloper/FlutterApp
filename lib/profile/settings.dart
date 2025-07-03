// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  String _language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xFFE67E22),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          _buildSectionTitle('General'),

          ListTile(
            leading: const Icon(Icons.language, color: Colors.orange),
            title: const Text('Language'),
            subtitle: Text(_language),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: _changeLanguage,
          ),
          SwitchListTile(
            title: const Text('Push Notifications'),
            subtitle: const Text('Receive updates about jobs & messages'),
            value: _notificationsEnabled,
            onChanged: (val) {
              setState(() => _notificationsEnabled = val);
            },
            secondary: const Icon(Icons.notifications_active, color: Colors.orange),
          ),

          const Divider(height: 32),

          _buildSectionTitle('Account'),

          ListTile(
            leading: const Icon(Icons.lock_outline, color: Colors.orange),
            title: const Text('Change Password'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Change Password pressed')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined, color: Colors.orange),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text('Logout'),
            onTap: () {
              
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        // Clear session or tokens here
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Logged out')),
                        );
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void _changeLanguage() {
    showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Select Language', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('English'),
              leading: Radio(
                value: 'English',
                groupValue: _language,
                onChanged: (value) {
                  setState(() => _language = value.toString());
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Hindi'),
              leading: Radio(
                value: 'Hindi',
                groupValue: _language,
                onChanged: (value) {
                  setState(() => _language = value.toString());
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

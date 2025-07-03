// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kaam_dekho/profile/select_language.dart';
import 'package:kaam_dekho/profile/personal_details.dart';
import 'package:kaam_dekho/profile/payment_methods.dart';
import 'package:kaam_dekho/profile/my_reviews.dart';
import 'package:kaam_dekho/profile/settings.dart';
import 'package:kaam_dekho/profile/help_support.dart';

// ignore: use_key_in_widget_constructors
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F2),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),

            // Profile avatar
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                backgroundImage: const AssetImage('assets/profile/user-icon.png'),
              ),
            ),

            const SizedBox(height: 24),

            // Name
            const Text(
              'Seema Sharma',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 8),

            // Phone
            Text(
              '+91 9876543210',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),

            const SizedBox(height: 8),

            // Location
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.grey[600], size: 20),
                const SizedBox(width: 4),
                Text(
                  'Vijay Nagar, Delhi',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Menu Items
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: ListView(
                  children: [
                    _buildMenuItem(
                      icon: Icons.language,
                      title: 'Select Language',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SelectLanguageScreen(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.person_outline,
                      title: 'Personal Details',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PersonalDetailsPage(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'Payment Methods',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PaymentMethodsPage(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.star_border,
                      title: 'My Reviews',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MyReviewsPage(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SettingsPage(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.help_outline,
                      title: 'Help & Support',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HelpSupportPage(),
                          ),
                        );
                      },
                      showDivider: false,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.grey[700]),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: onTap,
        ),
        if (showDivider)
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 16),
            child: Divider(height: 1, color: Colors.grey[200]),
          ),
      ],
    );
  }
}

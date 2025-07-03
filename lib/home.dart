import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaam_dekho/message.dart';
import 'package:kaam_dekho/my_jobs.dart';
import 'package:kaam_dekho/profile.dart';
import 'package:provider/provider.dart';
import 'package:kaam_dekho/providers/language_provider.dart';
// jobs imports
import 'package:kaam_dekho/jobs/book_person.dart';
import 'package:kaam_dekho/jobs/need_worker.dart';
import 'package:kaam_dekho/jobs/find_works.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isHindi = Provider.of<LanguageProvider>(context).isHindi;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _currentIndex == 1
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              title: Text(
                isHindi ? 'संदेश' : 'Messages',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              centerTitle: true,
            )
          : AppBar(
              backgroundColor: const Color(0xFFE67E22),
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              title: Text(
                isHindi ? 'काम लगाओ' : 'KaamLagao',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
      body: _buildBody(isHindi),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFE67E22),
        unselectedItemColor: Colors.grey[600],
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: isHindi ? 'होम' : 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.message),
            label: isHindi ? 'संदेश' : 'Messages',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.work),
            label: isHindi ? 'मेरे कार्य' : 'My Jobs',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: isHindi ? 'प्रोफ़ाइल' : 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildBody(bool isHindi) {
    if (_currentIndex == 1) return MessagesPage();
    if (_currentIndex == 2) return MyJobsScreen();
    if (_currentIndex == 3) return ProfilePage();

    return SingleChildScrollView(
      child: Column(
        children: [
          // Search Bar
          Container(
            color: const Color(0xFFE67E22),
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: isHindi
                      ? 'पिन कोड या स्थान से खोजें'
                      : 'Search by pin code or landmark',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
              ),
            ),
          ),

          // Action Buttons
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NeedWorkerPage(),
                        ),
                      );
                    },
                    child: _actionButton(
                      icon: Icons.campaign,
                      label: isHindi ? 'मज़दूर\nचाहिए' : 'Need a\nWorker',
                      color: const Color(0xFFE67E22),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FindWorkPage()),
                      );
                    },
                    child: _actionButton(
                      icon: Icons.check,
                      label: isHindi ? 'काम\nखोजें' : 'Find\nWork',
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Jobs Section
          _jobSection(isHindi),

          // Categories
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isHindi ? 'लोकप्रिय श्रेणियाँ' : 'Popular Categories',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCategoryItem(
                      Icons.build,
                      isHindi ? 'प्लंबर' : 'Plumber',
                      const Color(0xFFE67E22),
                    ),
                    _buildCategoryItem(
                      Icons.school,
                      isHindi ? 'ट्यूशन' : 'Tuition',
                      const Color(0xFFE67E22),
                    ),
                    _buildCategoryItem(
                      Icons.kitchen,
                      isHindi ? 'घरेलू काम' : 'Household',
                      const Color(0xFFE67E22),
                    ),
                    _buildCategoryItem(
                      Icons.cleaning_services,
                      isHindi ? 'सफाई' : 'Cleaning',
                      const Color(0xFFE67E22),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _jobSection(bool isHindi) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isHindi ? 'हाल ही के छोटे काम' : 'Recent Micro-Jobs',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          _jobCard(
            isHindi ? 'पेंटर चाहिए' : 'Painter wanted',
            isHindi
                ? '1 कमरे के लिए पेंटिंग चाहिए'
                : 'Require painting for 1 room',
            'Mohan Nagar',
            '₹ 600',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const BookPersonPage(
                    name: 'Ajay Kumar',
                    location: 'Delhi, India',
                    imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
                  ),
                ),
              );
            },
          ),
          _jobCard(
            isHindi ? 'होम ट्यूटर चाहिए' : 'Home tutor needed',
            isHindi
                ? '10वीं कक्षा के लिए गणित पढ़ाना है'
                : 'Teach Maths for class 10th',
            'Laxmi Colony',
            '₹ 2000',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const BookPersonPage(
                    name: 'Ravi Sharma',
                    location: 'Delhi, India',
                    imageUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
                  ),
                ),
              );
            },
          ),
          _jobCard(
            isHindi ? 'रसोइया' : 'Cook',
            isHindi ? 'पार्ट-टाइम रसोइया चाहिए' : 'Looking for part-time cook',
            'Rajendra Park',
            '₹ 500/day',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const BookPersonPage(
                    name: 'Suresh Verma',
                    location: 'Delhi, India',
                    imageUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _jobCard(
    String title,
    String subtitle,
    String location,
    String price, {
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle, style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(width: 4),
                      Text(location, style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kaam_dekho/home.dart';
import 'package:provider/provider.dart';
import 'package:kaam_dekho/providers/language_provider.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);
    final isHindi = langProvider.isHindi;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDFCFB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              isHindi ? 'भाषा चुनें' : 'Select Language',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isHindi ? 'अंग्रेज़ी' : 'English',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: !isHindi ? Colors.black87 : Colors.black54,
                  ),
                ),
                const SizedBox(width: 18),
                Switch(
                  value: isHindi,
                  onChanged: (value) {
                    langProvider.toggleLanguage(value);
                  },
                  activeThumbColor: const Color(0xFFE67E22),
                  inactiveTrackColor: Colors.grey[300],
                  inactiveThumbColor: const Color(0xFFE67E22),
                ),
                const SizedBox(width: 18),
                Text(
                  isHindi ? 'हिन्दी' : 'Hindi',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: isHindi ? Colors.black87 : Colors.black54,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE67E22),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  isHindi ? 'होम' : 'Home',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

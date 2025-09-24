import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String profileText = '';
  int navbarindex = 1;

  @override
  void initState() {
    super.initState();
    _loadProfileText();
  }

  Future<void> _loadProfileText() async {
    final text = await rootBundle.loadString('assets/userinfodata/daniel_trompetter_text.txt');
    setState(() {
      profileText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/Ich_Portrait.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              profileText,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Profile'),
          ],
          onDestinationSelected: (index) {
            navbarindex = index;
            if (index == 0) {
            Navigator.pushNamed(context, '/');
            } else if (index == 1) {
            Navigator.pushNamed(context, '/profile');
            }
          },
        selectedIndex: navbarindex,
      ),
    );
  }
}

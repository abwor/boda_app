import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'contact_us_page.dart';
import 'activity.dart'; // Import ActivityPage
import 'promotions.dart'; // Import PromotionsScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INSTARIDE'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.warning, color: Colors.red),
            onPressed: () {
              _showPanicDialog(context);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('USER'),
              currentAccountPicture: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileScreen()),
                  );
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.green,
                  ),
                ),
              ),
              accountEmail: null,
            ),
            ListTile(
              leading: const Icon(Icons.card_giftcard),
              title: const Text('Promotions'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PromotionsScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('History'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ActivityPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_emergency_rounded),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactUsPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.people,
                color: Color.fromARGB(255, 208, 211, 10),
              ),
              title: const Text(
                'Family Button',
                style: TextStyle(color: Color.fromARGB(255, 40, 42, 44)),
              ),
              onTap: () {
                _showPanicDialog(context);
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Home Screen Content'),
      ),
    );
  }

  void _showPanicDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Family Button Pressed'),
          content: const Text('Are you sure you want to share ride details?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                // Handle the panic button action here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const Center(
        child: Text('Notifications Page Content'),
      ),
    );
  }
}
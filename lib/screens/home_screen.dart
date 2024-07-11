import 'package:flutter/material.dart';
import 'package:instaride/screens/notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'contact_us_page.dart';
import 'activity.dart'; // Import ActivityPage
import 'promotions.dart'; // Import PromotionsScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _userName = 'USER'; // Default value for user name
  // ignore: unused_field
  final String _userProfileImageUrl = ''; // Placeholder for profile image URL, if available

  @override
  void initState() {
    super.initState();
    _loadProfileData(); // Load profile data when the screen initializes
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name') ?? 'USER';
    // You can load other profile information like profile image URL if available
    setState(() {
      _userName = name;
      // Set profile image URL if available
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INSTARIDE'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.warning),
            color: const Color.fromARGB(255, 167, 10, 10),
            onPressed: () {
              _sendAlertToSafeBodas();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(_userName),
              currentAccountPicture: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ActivityPage()),
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
                _showFamilyDialog(context);
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

  void _showFamilyDialog(BuildContext context) {
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
                // Handle the family button action here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _sendAlertToSafeBodas() {
    // Mock function to send alerts to Safe Bodas in your area.
    // Replace this with your actual implementation.
    print('Alert sent to Safe Bodas!');
    // You can use a network request here to send alerts, for example:
    // await http.post('https://api.yourservice.com/sendAlert', body: {...});
  }
}

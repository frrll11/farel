import 'package:flutter/material.dart';
import 'edit_profile_pages.dart'; // ✅ Import halaman edit

class ProfileScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.person, 'title': 'Edit Profile'},
    {'icon': Icons.notifications, 'title': 'Notifications'},
    {'icon': Icons.favorite, 'title': 'My Wishlist'},
    {'icon': Icons.report, 'title': 'Report Center'},
    {'icon': Icons.language, 'title': 'Language (English US)'},
    {'icon': Icons.help, 'title': 'Help Center'},
    {'icon': Icons.group_add, 'title': 'Invite Friends'},
    {'icon': Icons.settings, 'title': 'Settings'},
    {'icon': Icons.logout, 'title': 'Logout'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, size: 40, color: Colors.grey[700]),
          ),
          SizedBox(height: 10),
          Text('user', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Divider(
            thickness: 1,
            color: Colors.grey[300],
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                final isLogout = item['title'] == 'Logout';

                return ListTile(
                  leading: Icon(
                    item['icon'],
                    color: isLogout ? Colors.red : null,
                  ),
                  title: Text(
                    item['title'],
                    style: TextStyle(
                      color: isLogout ? Colors.red : null,
                      fontWeight: isLogout ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    if (item['title'] == 'Edit Profile') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );
                    }
                    // Tambahkan aksi logout di sini jika diperlukan
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Edit'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
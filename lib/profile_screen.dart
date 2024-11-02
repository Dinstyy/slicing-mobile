import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.yellow),
        ),
        iconTheme: IconThemeData(color: Colors.yellow),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[800],
              backgroundImage: AssetImage('assets/images/gemas.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              'Dinstyy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Dinstyy@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 24),
            Divider(color: Colors.yellow[700], thickness: 1),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.yellow[700]),
              title: Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Add settings functionality here
              },
            ),
            Divider(color: Colors.grey[700], thickness: 0.5),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Add logout functionality here
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
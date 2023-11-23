import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFF006664),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'App Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('Notification Preferences'),
              subtitle: Text('Manage how you receive task notifications.'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to notification preferences screen
              },
            ),
            Divider(),
            ListTile(
              title: Text('Change Password'),
              subtitle: Text('Update your account password.'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to change password screen
              },
            ),
            Divider(),
            ListTile(
              title: Text('Privacy Settings'),
              subtitle: Text('Control who can see your profile information.'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to privacy settings screen
              },
            ),
            SizedBox(height: 32),
            Text(
              'About Mynisit',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('App Version'),
              subtitle: Text('1.0.0'),
              onTap: () {
                // Show app version information
              },
            ),
            Divider(),
            ListTile(
              title: Text('Contact Support'),
              subtitle: Text('Get help with any issues or questions.'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to contact support screen
              },
            ),
            Divider(),
            ListTile(
              title: Text('Terms of Service'),
              onTap: () {
                // Show terms of service
              },
            ),
            Divider(),
            ListTile(
              title: Text('Privacy Policy'),
              onTap: () {
                // Show privacy policy
              },
            ),
          ],
        ),
      ),
    );
  }
}

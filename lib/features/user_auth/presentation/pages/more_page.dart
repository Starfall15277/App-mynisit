import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More Options'),
        backgroundColor: Color(0xFF006664),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Additional Options',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('Change Profile Picture'),
              subtitle: Text('Update your profile picture.'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to change profile picture screen
              },
            ),
            Divider(),
            ListTile(
              title: Text('Sync Data'),
              subtitle: Text('Synchronize your data with the cloud.'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to data synchronization screen
              },
            ),
            Divider(),
            ListTile(
              title: Text('App Feedback'),
              subtitle: Text('Provide feedback about the app.'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to app feedback screen
              },
            ),
            Divider(),
            // เพิ่ม ListTiles หรือเนื้อหาเพิ่มเติมตามต้องการ
            ListTile(
              title: Text('Custom Option 1'),
              subtitle: Text('Description of Custom Option 1.'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle custom option 1
              },
            ),
            Divider(),
            ListTile(
              title: Text('Custom Option 2'),
              subtitle: Text('Description of Custom Option 2.'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle custom option 2
              },
            ),
          ],
        ),
      ),
    );
  }
}

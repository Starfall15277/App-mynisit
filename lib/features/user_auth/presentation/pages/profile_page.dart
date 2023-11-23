import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Color(0xFF006664),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Nisit'),
              Tab(text: 'Advisor WSII'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // หน้าโปรไฟล์ของนิสิต
            FutureBuilder(
              future: _fetchStudentData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(), // แสดง Loading Spinner
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final studentData = snapshot.data as Map<String, dynamic>;
                  return SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30.0),
                          CircleAvatar(
                            backgroundImage: AssetImage('images/Nisit_6330202605.jpg'),
                            radius: 90.0,
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nisit Information',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                buildTextField("Student ID :", studentData['Student ID']),
                                buildTextField("Account :", studentData['Account']),
                                buildTextField("Name :", studentData['Name']),
                                buildTextField("ID Card:", studentData['ID Card']),
                                buildTextField("Faculty :", studentData['Faculty']),
                                buildTextField("Degree :", studentData['Degree']),
                                buildTextField("Major :", studentData['Major']),
                                buildTextField("Campus :", studentData['Campus']),
                                buildTextField("Tel :", studentData['Tel']),
                                buildTextField("Email :", studentData['Email']),
                                buildTextField("Advisor :", studentData['Advisor']),
                                buildTextField("Status :", studentData['Status']),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),

            // หน้าโปรไฟล์ของอาจารย์ที่ปรึกษา
            FutureBuilder(
              future: _fetchAdvisorData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(), // แสดง Loading Spinner
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final advisorData = snapshot.data as Map<String, dynamic>;
                  return SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30.0),
                          CircleAvatar(
                            backgroundImage: AssetImage('images/supaporn.jpg'),
                            radius: 90.0,
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Advisor Information',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                buildTextField("Position :", advisorData['Position']),
                                buildTextField("Academic position :", advisorData['Academic position']),
                                buildTextField("Advisor Name :", advisorData['Advisor Name']),
                                buildTextField("Major :", advisorData['Major']),
                                buildTextField("Email :", advisorData['Email']),
                                buildTextField("Room :", advisorData['Room']),
                                buildTextField("Internal phone number :", advisorData['Internal phone number']),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 7.5),
        TextField(
          controller: TextEditingController(text: text),
          enabled: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Future<Map<String, dynamic>> _fetchStudentData() async {
    // ดึงข้อมูลนิสิตจาก Cloud Firestore
    final studentDocument = await FirebaseFirestore.instance
        .collection('student')
        .doc('6G2DuFcEl4TcHEUTcimI')
        .get();

    return studentDocument.data() as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> _fetchAdvisorData() async {
    // ดึงข้อมูลอาจารย์ที่ปรึกษาจาก Cloud Firestore
    final advisorDocument = await FirebaseFirestore.instance
        .collection('advisor information')
        .doc('iOesMTPxEPQR3Eyqb9Su')
        .get();

    return advisorDocument.data() as Map<String, dynamic>;
  }
}

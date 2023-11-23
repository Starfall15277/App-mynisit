import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentCardPage extends StatefulWidget {
  @override
  _StudentCardPageState createState() => _StudentCardPageState();
}

class _StudentCardPageState extends State<StudentCardPage> {
  String Card_ID = "";
  String Expire = "";
  String Faculty = "";
  String Field_of_study = "";
  String Issue = "";
  String Name = "";
  String Student_ID = "";
  String VALID_THRU = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchStudentCardData();
  }

  Future<void> fetchStudentCardData() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('student card')
          .doc('VyXuZWEmOJU8XXG7M1TD')
          .get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

        setState(() {
          Card_ID = data['Card_ID'] ?? "";
          Expire = data['Expire'] ?? "";
          Faculty = data['Faculty'] ?? "";
          Field_of_study = data['Field_of_study'] ?? "";
          Issue = data['Issue'] ?? "";
          Name = data['Name'] ?? "";
          Student_ID = data['Student_ID'] ?? "";
          VALID_THRU = data['VALID_THRU'] ?? "";
          isLoading = false;
        });
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Card'),
        backgroundColor: Color(0xFF006664),
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(), // แสดง Loading Spinner
      )
          : ListView(
        children: [
          // รูปภาพบัตรนักศึกษาด้านหน้า
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16),
            child: Image.asset('images/Nisit_card.jpg'),
          ),

          // ข้อมูลนิสิต
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Student Card Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                // Card ID
                Text(
                  'Card ID :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7.5),
                TextField(
                  controller: TextEditingController(text: Card_ID),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),

                // Expire
                Text(
                  'Expire :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7.5),
                TextField(
                  controller: TextEditingController(text: Expire),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),

                // Faculty
                Text(
                  'Faculty :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7.5),
                TextField(
                  controller: TextEditingController(text: Faculty),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),

                // Field of study
                Text(
                  'Field of Study :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7.5),
                TextField(
                  controller: TextEditingController(text: Field_of_study),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),

                // Issue
                Text(
                  'Issue :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7.5),
                TextField(
                  controller: TextEditingController(text: Issue),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),

                // Name
                Text(
                  'Name :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7.5),
                TextField(
                  controller: TextEditingController(text: Name),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),

                // Student ID
                Text(
                  'Student ID :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7.5),
                TextField(
                  controller: TextEditingController(text: Student_ID),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),

                // VALID_THRU
                Text(
                  'VALID THRU :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7.5),
                TextField(
                  controller: TextEditingController(text: VALID_THRU),
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

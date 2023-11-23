import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynisit/features/user_auth/presentation/pages/setting_page.dart';
import 'package:mynisit/features/user_auth/presentation/pages/todo_page.dart';
import '../pages/home_page.dart';
import '../pages/more_page.dart';
import '../pages/profile_page.dart';
import '../pages/schedule_page.dart';
import '../pages/student_card_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List pages = [HomePage(), TodoPage(), SchedulePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyNisit"),
        backgroundColor: Color(0xFF006664),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'images/Nisit_6330202605.jpg'
              ),
            ),
              decoration: BoxDecoration(
                color: Color(0xFFB2BB1E),
              ),
              accountName: Text('Valintron Vichaidit', style: TextStyle(fontSize: 17.0),),
              accountEmail: Text('valintron.v@ku.th', style: TextStyle(fontSize: 13.5)),
            ),
            SizedBox(height: 6),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile',style: TextStyle(fontSize: 17),),
              subtitle: Text('Personal information'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfilePage(), // ใช้ชื่อหน้าของ Profile Page ที่คุณสร้าง
                ));
              },
            ),
            SizedBox(height: 6),
            ListTile(
              leading: Icon(Icons.credit_card_rounded),
              title: Text('Nisit Card',style: TextStyle(fontSize: 17),),
              subtitle: Text('Student card information'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => StudentCardPage(), // ใช้ชื่อหน้าของ Student Card Page ที่คุณสร้าง
                ));
              },
            ),
            SizedBox(height: 6),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting',style: TextStyle(fontSize: 17),),
              subtitle: Text('Customize app settings'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SettingPage(),
                ));
              },
            ),
            SizedBox(height: 6),
            ListTile(
              leading: Icon(Icons.more_horiz_rounded),
              title: Text('More',style: TextStyle(fontSize: 17),),
              subtitle: Text('Additional options'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MorePage(),
                ));
              },
            ),
            const Divider(color: Colors.black54),
            ListTile(
              title: Text('Logout',style: TextStyle(fontSize: 17),),
              trailing: Icon(Icons.exit_to_app_outlined),
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            ListTile(
              dense: true,
              title: Text('Version 1.0.0',style: TextStyle(fontSize: 10),),
              onTap: () {
              },
            ),
            ListTile(
              dense: true,
              title: Text('Kasetsart University Sriracha Campus',style: TextStyle(fontSize: 10),),
              onTap: () {
              },
            ),
          ],
        ),
      ),

      body: pages[currentIndex], // แสดงหน้าที่ถูกเลือกจาก List ของ pages
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_rounded),
            label: 'To-do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart_rounded),
            label: 'Schedule',
          ),
        ],
      ),
    );
  }
}


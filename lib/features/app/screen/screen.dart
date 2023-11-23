import 'package:flutter/material.dart';
//หน้านี้จะเป็นหน้าที่แสดงภาพหรือข้อความ ก่อนเด้งไปที่หน้า Login สามารถตกแต่งได้อารมณ์คล้าย Intro อาจจะโชว์ตรามหาลัยหรืออื่นๆ

class Screen extends StatefulWidget {
  final Widget? child;
  const Screen({super.key, this.child});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 4),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget.child!), (route) => false);
    }
    );
    super.initState();
  }

//ด้านล่างนี้จะเป็นส่วนที่แสดงข้อมูลในหน้าจอ เมื่อคุณลอง Run จะเห็นว่ามีข้อความเล็กๆ ขึ้นว่า My Nisit สีเขียวตามที่ Coding เอาไว้
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('images/KUlogin.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20), // ระยะห่างระหว่างรูปและ loading indicator
            CircularProgressIndicator(), // Loading indicator
          ],
        ),
      ),
    );
  }
}
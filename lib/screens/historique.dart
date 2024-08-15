import 'package:flutter/material.dart';
import 'package:waohqr/screens/qrCreeBody.dart';
import 'package:waohqr/screens/qrLueBody.dart';

class History extends StatelessWidget {
  History({super.key});
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff140344),
          shadowColor: Color(0xff140344),
          title:
              Center(child: Text('WAOH QR', style: TextStyle(color: Colors.white, fontSize: 15))),
          toolbarHeight: 40,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Color(0xff140344),
            indicatorColor: Color(0xff140344),
            tabs: [
              Tab(
                child: Text(
                  'Lecture',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poppins-Regular'),
                ),
              ),
              Tab(
                child: Text(
                  'Création',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poppins-Regular'),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            QrLueBody(),
            QrCreeBody()
          ],
        ),

      ),
    );
  }
}

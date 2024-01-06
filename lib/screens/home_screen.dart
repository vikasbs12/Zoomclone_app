import 'package:flutter/material.dart';
import 'package:zoomclone_app/screens/history_meeting_screen.dart';
import 'package:zoomclone_app/screens/meeting_screen.dart';
import 'package:zoomclone_app/utils/colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page =0;
  onPageChanges(int page){
    setState(() {
      _page=page;
    });

  }
  List <Widget> pages = [  MeetingScreen(),
  const HistoryMeetingScreen(),
  const Text('Contacts'),
  const Text("Settings") ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
      title:  const Text('Meet & Chat'),
      centerTitle: true,
      
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanges,
        currentIndex: _page,
      unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
           
            icon: Icon(Icons.chat_bubble), // Corrected from Icons.comment_bank
            label: 'Meet & Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Meeting',
          ),
             BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Contacts',
          ),
             BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
         
        ],
      ),
    );
  }
}


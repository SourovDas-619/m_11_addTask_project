import 'package:flutter/material.dart';
import 'package:m_11_addtask_project/ui/screen/cancel_task_screen.dart';
import 'package:m_11_addtask_project/ui/screen/completed_task_screen.dart';
import 'package:m_11_addtask_project/ui/screen/in_progress_task_screen.dart';
import 'package:m_11_addtask_project/ui/screen/new_task_screen.dart';

class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({super.key});

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  int _selectedScreenIndex = 0;

  final List<Widget> _screens =[
     NewTaskScreen(),
     InProgressTaskScreen(),
     CancelTaskScreen(),
     CompletedTaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedScreenIndex,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(
            color: Colors.grey
          ),
          showSelectedLabels: true,
          selectedItemColor: Colors.green,
          onTap: (int index){
            _selectedScreenIndex = index;
            if(mounted){
              setState(() {
              });
            }
          },
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label: 'New'),
        BottomNavigationBarItem(icon: Icon(Icons.account_tree),label: 'In Progress'),
        BottomNavigationBarItem(icon: Icon(Icons.cancel_outlined),label: 'Cancel'),
        BottomNavigationBarItem(icon: Icon(Icons.done_all),label: 'Completed'),
      ]),

    );
  }
}

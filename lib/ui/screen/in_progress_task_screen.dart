import 'package:flutter/material.dart';
import 'package:m_11_addtask_project/ui/widgets/summary_card.dart';
import 'package:m_11_addtask_project/ui/widgets/task_list_tile.dart';
import 'package:m_11_addtask_project/ui/widgets/user_profile_banner.dart';

class InProgressTaskScreen extends StatelessWidget {
  const InProgressTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              UserProfileBanner(),
              Expanded(
                  child: ListView.separated(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return SizedBox();
                      //return TaskListTile();
                    }, separatorBuilder: (BuildContext context, int index) {
                    return Divider(height: 4,);
                  },))
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:m_11_addtask_project/Data/Models/response_object.dart';
import 'package:m_11_addtask_project/Data/Models/summary_card_model.dart';
import 'package:m_11_addtask_project/Data/Models/task_list_model.dart';
import 'package:m_11_addtask_project/Data/Utils/urls.dart';
import 'package:m_11_addtask_project/Data/services/network_caller.dart';
import 'package:m_11_addtask_project/ui/screen/add_new_task_screen.dart';
import 'package:m_11_addtask_project/ui/widgets/summary_card.dart';
import 'package:m_11_addtask_project/ui/widgets/task_list_tile.dart';
import 'package:m_11_addtask_project/ui/widgets/user_profile_banner.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getCountSummaryInProgress = false, _getNewTaskInProgress = false;
  SummaryCardModel _summaryCardModel = SummaryCardModel();
  TaskListModel _taskListModel = TaskListModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCountSummary();
      getNewTask();
    });
  }

  Future<void> getCountSummary() async {
    _getNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.taskStatusCount);
    if (response.isSuccess) {
      _summaryCardModel = SummaryCardModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Get new task data failed')));
      }
    }
    _getNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> getNewTask() async {
    _getCountSummaryInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.newTasks);
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Summary data get failed')));
      }
    }
    _getCountSummaryInProgress = false;
    if (mounted) {
      setState(() {});
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          UserProfileBanner(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _getCountSummaryInProgress ? LinearProgressIndicator() : Row(
              children: [
                Expanded(child: SummaryCard(number: 123, title: 'New')),
                Expanded(child: SummaryCard(number: 123, title: 'Progress')),
                Expanded(child: SummaryCard(number: 123, title: 'Cancelled')),
                Expanded(child: SummaryCard(number: 123, title: 'Completed')),
              ],
            ),
          ),
          Expanded(
              child: RefreshIndicator(
                onRefresh: () async{
                  getNewTask();
                },
                child: ListView.separated(
            itemCount: _taskListModel.data?.length ?? 0,
            itemBuilder: (context, index) {
                return TaskListTile(
                  data: _taskListModel.data![index],
                );
            },
            separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 4,
                );
            },
          ),
              ))
        ],
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddNewTaskScreen()));
          }),
    );
  }
}

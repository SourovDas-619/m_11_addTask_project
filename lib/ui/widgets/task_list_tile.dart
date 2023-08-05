import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_11_addtask_project/Data/Models/task_list_model.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key, required this.data,
  });

  final TaskData data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.title ?? 'Unknown'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.description ?? ''),
          Text(data.createdDate ?? ''),
          Row(
            children: [
              Chip(
                label: Text(
                  data.status ?? 'New',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.green,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red.shade300,)),
            ],
          )
        ],
      ),
    );
  }
}
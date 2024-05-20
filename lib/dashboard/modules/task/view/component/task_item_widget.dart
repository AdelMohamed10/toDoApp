import 'dart:typed_data';
import 'package:commerce_project/dashboard/modules/task/controller/task_cubit.dart';
import 'package:commerce_project/dashboard/modules/task/model/entity_model/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.taskModel,
    required this.controller,
  });

  final TaskModel taskModel;
  final TaskCubit controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              /// product info
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.memory(
                      taskModel.image ?? Uint8List(5),
                      height: 50,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskModel.name ?? 'task',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        taskModel.desc ?? 'description',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        (taskModel.availableTimes ?? 0).toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
              ),

              /// actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /// like
                  // Icon button to mark task as done
                  InkWell(
                    child: Icon(
                      taskModel.done == 1
                          ? CupertinoIcons.check_mark_circled_solid
                          : CupertinoIcons.check_mark_circled,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      if (taskModel.done == 1) {
                        controller.addItemToDone(taskModel.id ?? 0, 0);
                      } else {
                        controller.addItemToDone(taskModel.id ?? 0, 1);
                        if (taskModel.missed == 1) {
                          controller.addItemToMissed(taskModel.id ?? 0, 0);
                        }
                      }
                    },
                  ),
                  /// divider
                  Container(
                    height: 30,
                    width: 0.33,
                    color: Colors.grey,
                  ),

                  // Icon button to mark task as missed
                  InkWell(
                    child: Icon(
                      taskModel.missed == 1
                          ? CupertinoIcons.clear_circled_solid
                          : CupertinoIcons.clear_circled,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      if (taskModel.missed == 1) {
                        controller.addItemToMissed(taskModel.id ?? 0, 0);
                      } else {
                        controller.addItemToMissed(taskModel.id ?? 0, 1);
                        if (taskModel.done == 1) {
                          controller.addItemToDone(taskModel.id ?? 0, 0);
                        }
                      }
                    },
                  ),
                  Container(
                    height: 30,
                    width: 0.33,
                    color: Colors.grey,
                  ),
                  // Icon button to delete task
                  InkWell(
                    child: const Icon(
                      Icons.delete,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      controller.deleteTask(taskModel.id ?? 0);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

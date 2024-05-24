import 'dart:io';

import 'package:commerce_project/dashboard/modules/new_task/cubit/new_task_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewTaskCubit(),
      child: BlocBuilder<NewTaskCubit, NewTaskState>(
        builder: (context, state) {
          final NewTaskCubit cubit = context.read<NewTaskCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Add New Task'),
            ),
            body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Name
                    const Text(
                      'Name',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 7),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.name,
                      controller: cubit.nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter task name',
                      ),
                    ),
                    const SizedBox(height: 14),

                    /// Description
                    const Text(
                      'Description',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 7),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.name,
                      controller: cubit.descController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter task description',
                      ),
                    ),
                    const SizedBox(height: 14),

                    /// Remained times
                    const Text(
                      'Remained Times',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 7),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      controller: cubit.tmsController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter remained times',
                      ),
                    ),
                    const SizedBox(height: 14),

                    /// Image Picker
                    Row(
                      children: [
                        IconButton(
                          onPressed: cubit.pickTaskImage,
                          icon: const Icon(CupertinoIcons.photo),
                          tooltip: 'Pick Image from Gallery',
                        ),
                        IconButton(
                          onPressed: cubit.takeTaskImage,
                          icon: const Icon(CupertinoIcons.camera),
                          tooltip: 'Take a Photo',
                        ),
                      ],
                    ),

                    if (cubit.image != null)
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.file(
                            File(cubit.image!.path),
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                    const SizedBox(height: 14),

                    /// Add Task Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () => cubit.addTask(context),
                        child: const Text("Add Task"),
                      ),
                    ),
                    const SizedBox(height: 16), // Add additional space at the bottom
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
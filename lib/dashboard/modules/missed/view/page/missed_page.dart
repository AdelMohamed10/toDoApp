import 'package:commerce_project/dashboard/modules/missed/controller/missed_cubit.dart';
import 'package:commerce_project/dashboard/modules/missed/view/component/missed_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MissedPage extends StatelessWidget {
  const MissedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MissedCubit(),
      child: BlocBuilder<MissedCubit, MissedState>(
        builder: (context, state) {
          final MissedCubit controller = context.read<MissedCubit>();
          return Scaffold(
            body: state is MissedStateLoading
                ? const CircularProgressIndicator()
                : state is MissedStateEmpty
                    ? const Center(
                        child: Icon(
                          CupertinoIcons.delete,
                          size: 100,
                          color: Colors.blue,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (_, int index) => MissedItemWidget(
                          taskModel: controller.tasks[index],
                          controller: controller,
                        ),
                        itemCount: controller.tasks.length,
                      ),
          );
        },
      ),
    );
  }
}

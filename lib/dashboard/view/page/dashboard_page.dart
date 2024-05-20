
import 'package:commerce_project/dashboard/cubit/dashboard_cubit.dart';
import 'package:commerce_project/dashboard/modules/done/view/page/done_page.dart';
import 'package:commerce_project/dashboard/modules/missed/view/page/missed_page.dart';
import 'package:commerce_project/dashboard/modules/task/view/page/task_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          DashboardCubit cubit = context.read<DashboardCubit>();
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'new_task');
                    },
                    icon: const Icon(CupertinoIcons.plus))
              ],
            ),
            body: PageView(
              controller: cubit.pageController,
              onPageChanged: cubit.onChangeTab,
              children: const [
                TaskPage(),
                DonePage(),
                MissedPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.green,
              currentIndex: cubit.currentIndex,
              onTap: cubit.onChangeTab,
              items: const [
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.collections), label: 'Task'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.check_mark_circled), label: 'Done'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.clear_circled), label: 'Missed')
              ],
            ),
          );
        },
      ),
    );
  }
}

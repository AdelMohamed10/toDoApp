import 'package:commerce_project/dashboard/modules/task/controller/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserStateLoaded) {
            final user = state.user;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('First Name: ${user.fname}', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text('Last Name: ${user.lname}', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text('Email: ${user.email}', style: const TextStyle(fontSize: 16)),
                  // Add more fields as necessary
                ],
              ),
            );
          } else if (state is UserStateError) {
            return Center(child: Text(state.errorMessage));
          } else if (state is UserStateEmpty) {
            return const Center(child: Text('No user data available'));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:commerce_project/dashboard/modules/task/model/entity_model/user_model.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({
    Key? key,
    required this.userModel,
    required this.onUpdateFName,
    required this.onUpdateLName,
    required this.onUpdateEmail,
    required this.onUpdatePassword,
  }) : super(key: key);

  final UserModel userModel;
  final void Function(String) onUpdateFName;
  final void Function(String) onUpdateLName;
  final void Function(String) onUpdateEmail;
  final void Function(String) onUpdatePassword;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserInfoLabel(label: 'First Name', value: userModel.fname ?? 'N/A'),
              _buildUserInfoLabel(label: 'Last Name', value: userModel.lname ?? 'N/A'),
              _buildUserInfoLabel(label: 'Email', value: userModel.email ?? 'N/A'),
              _buildActionButton(
                label: 'Update First Name',
                onPressed: () => _showUpdateDialog(context, 'First Name', userModel.fname, onUpdateFName),
              ),
              _buildActionButton(
                label: 'Update Last Name',
                onPressed: () => _showUpdateDialog(context, 'Last Name', userModel.lname, onUpdateLName),
              ),
              _buildActionButton(
                label: 'Update Email',
                onPressed: () => _showUpdateDialog(context, 'Email', userModel.email, onUpdateEmail),
              ),
              _buildActionButton(
                label: 'Change Password',
                onPressed: () => _showUpdateDialog(context, 'Password', null, onUpdatePassword),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfoLabel({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildActionButton({required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }

  Future<void> _showUpdateDialog(BuildContext context, String fieldName, String? currentValue, void Function(String) onUpdate) async {
    final TextEditingController controller = TextEditingController(text: currentValue);
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update $fieldName'),
          content: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter new $fieldName',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                onUpdate(controller.text);
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

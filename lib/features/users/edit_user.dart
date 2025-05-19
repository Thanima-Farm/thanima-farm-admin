import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanima_admin/features/users/user_model.dart';

class EditUserDialog extends StatelessWidget {
  final UserModel user;
  final void Function(Map<String, dynamic>) onSubmit;

  const EditUserDialog({Key? key, required this.user, required this.onSubmit})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: user.name);
    final emailController = TextEditingController(text: user.email);
    final contactController = TextEditingController(text: user.mobile);
    final usernameController = TextEditingController(text: user.username);
    final passwordController = TextEditingController(text: user.password);
    final roleController = TextEditingController(text: user.role);

    return AlertDialog(
      title: const Text("Edit User"),
      content: SingleChildScrollView(
        child: SizedBox(
          height: 682.h,
          width: 431.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(nameController, "Name"),
              _buildTextField(contactController, "Contact"),
              _buildTextField(emailController, "Mail Id"),
              _buildTextField(roleController, "Role"),
              _buildTextField(usernameController, "Username"),
              _buildTextField(passwordController, "Password"),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            final updatedUser = {
              // "id": user.id,
              "name": nameController.text,
              "email": emailController.text,
              "mobile": contactController.text,
              "username": usernameController.text,
              // "password": passwordController.text,
              "role": roleController.text,
              // "status": user.status, // Preserving existing status
            };

            onSubmit(updatedUser);
            Navigator.of(context).pop();
          },
          child: const Text("Save", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(height: 5.h),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: label,
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateUserDialog extends StatelessWidget {
  final void Function(Map<String, String>) onSubmit;

  const CreateUserDialog({Key? key, required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final contactController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final roleController = TextEditingController();

    return AlertDialog(
      title: const Text("Add User"),
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
            final newUser = {
              "name": nameController.text,
              "email": emailController.text,
              "mobile": contactController.text,
              "username": usernameController.text,
              "password": passwordController.text,
              "role": roleController.text,
            };

            onSubmit(newUser);
            Navigator.of(context).pop();
          },
          child: const Text("Add", style: TextStyle(color: Colors.white)),
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

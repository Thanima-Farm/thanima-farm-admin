// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:thanima_admin/core/services/api_client.dart';
// import 'package:thanima_admin/features/users/cubit/users_cubit.dart';

// void showCreateUserDialog(BuildContext context) {
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final contactController = TextEditingController();
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//   final roleController = TextEditingController();
//   String status = 'Active';
//   late final ApiClient apiClient = ApiClient(
//     baseUrl: "https://gau9gqbxih.execute-api.us-east-1.amazonaws.com",
//   );

//   showDialog(
//     context: context,
//     builder: (context) {
//       return BlocProvider(
//         create: (_) => UsersCubit(apiClient),
//         child: AlertDialog(
//           title: const Text("Add User"),
//           content: SingleChildScrollView(
//             child: SizedBox(
//               height: 682.h,
//               width: 431.w,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   _buildTextField(nameController, "Name"),
//                   _buildTextField(contactController, "Contact"),
//                   _buildTextField(emailController, "Mail Id"),
//                   _buildTextField(roleController, "Role"),
//                   _buildTextField(usernameController, "Username"),
//                   _buildTextField(passwordController, "Password"),
//                 ],
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 final newUser = {
//                   "name": nameController.text,
//                   "email": emailController.text,
//                   "contact": contactController.text,
//                   "username": usernameController.text,
//                   "password": passwordController.text,
//                   "role": roleController.text,
//                   // "status": status,
//                 };

//                 // Print or use Bloc to send this to API
//                 debugPrint("Create user: $newUser");
//                 context.read<UsersCubit>().createUser(newUser);
//                 Navigator.of(context).pop();
//               },
//               child: const Text("Add", style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// Widget _buildTextField(TextEditingController controller, String label) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label),
//         SizedBox(height: 5.h),
//         TextField(
//           controller: controller,
//           decoration: InputDecoration(
//             hintText: label,
//             border: const OutlineInputBorder(),
//           ),
//         ),
//       ],
//     ),
//   );
// }

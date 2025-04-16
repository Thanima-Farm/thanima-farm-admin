import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanima_admin/features/layout/header.dart';
import 'package:thanima_admin/features/users/cubit/users_cubit.dart';
import 'package:thanima_admin/features/users/cubit/users_state.dart';
import 'package:thanima_admin/features/users/user_model.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    context.read<UsersCubit>().fetchUsers(); // Fetch data on screen load
  }

  @override
  Widget build(BuildContext context) {
    //dialog box
    return BlocListener<UsersCubit, UsersState>(
      listener: (context, state) {
        if (state is UserCreateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is UserCreateFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0D2B25),
        body: Container(
          width: 1064.w,
          height: 774.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(54.0),
              bottomLeft: Radius.circular(54.0),
            ),
            border: Border.all(color: const Color(0xFFB4B4B4)),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const Header(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildSearchBar(),
                      ElevatedButton(
                        onPressed: () {
                          showCreateUserDialog(context);
                          // final newUser = {
                          //   "name": "Rahul",
                          //   "email": "rahul@gmail.com",
                          //   "mobile": "+911299453212",
                          //   "username": "rwt",
                          //   "password": "Guides",
                          //   "role": "Guides",
                          // };

                          // // Print or use Bloc to send this to API
                          // debugPrint("Create user: $newUser");
                          // context.read<UsersCubit>().createUser(newUser);
                          // // Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text("+ Create Users"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BlocBuilder<UsersCubit, UsersState>(
                    builder: (context, state) {
                      if (state is UsersLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is UsersLoaded) {
                        final users =
                            state.users
                                .where(
                                  (user) => user.name.toLowerCase().contains(
                                    searchQuery.toLowerCase(),
                                  ),
                                )
                                .toList();

                        return buildUserTable(users);
                      } else if (state is UsersError) {
                        return Center(child: Text(state.message));
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showCreateUserDialog(BuildContext outerContext) {
    // all controllers ...
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final contactController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final roleController = TextEditingController();
    String status = 'Active';

    showDialog(
      context: outerContext,
      builder: (dialogContext) {
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
              onPressed: () => Navigator.of(dialogContext).pop(),
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

                debugPrint("Create user: $newUser");

                // ✅ Use the outerContext that has UsersCubit
                outerContext.read<UsersCubit>().createUser(newUser);
                Navigator.of(dialogContext).pop();
              },
              child: const Text("Add", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
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

  Widget buildSearchBar() {
    return Container(
      width: 276.w,
      height: 32.h,
      color: Colors.transparent,
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
          hintText: "Search by Name",
          hintStyle: TextStyle(fontSize: 14),
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          setState(() {
            searchQuery = value;
          });
        },
      ),
    );
  }

  Widget buildUserTable(List<UserModel> users) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: const Color(0xFFB4B4B4)),
      ),
      child: DataTable(
        headingTextStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        dataTextStyle: const TextStyle(fontSize: 11),
        headingRowColor: WidgetStateColor.resolveWith(
          (states) => const Color(0xFFE8FEEA),
        ),
        columns: const [
          DataColumn(label: Text("Serial")),
          DataColumn(label: Text("Name")),
          DataColumn(label: Text("Contact")),
          DataColumn(label: Text("Mail Id")),
          DataColumn(label: Text("Role")),
          DataColumn(label: Text("Username")),
          DataColumn(label: Text("Password")),
          DataColumn(label: Text("Status")),
          DataColumn(label: Text("Action")),
        ],
        rows:
            users.map((user) {
              return DataRow(
                cells: [
                  DataCell(Text(user.id.toString())),
                  DataCell(Text(user.name)),
                  DataCell(Text(user.mobile)),
                  DataCell(Text(user.email)),
                  DataCell(Text(user.role)),
                  DataCell(Text(user.username)),
                  DataCell(Text(user.password)),
                  DataCell(StatusBadge(status: user.status)),
                  const DataCell(ActionButtons()),
                ],
              );
            }).toList(),
      ),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final isActive = status.toLowerCase() == "active";
    final bgColor =
        isActive ? const Color(0xFF92FFAC) : const Color(0xFFFF9292);

    return Container(
      height: 16.h,
      width: 60.w,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: const Color(0xFFB4B4B4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            status,
            style: const TextStyle(color: Color(0xFF757575), fontSize: 10),
          ),
          const Icon(Icons.keyboard_arrow_down_rounded, size: 10),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.delete_outline_outlined),
        SizedBox(width: 5),
        Icon(Icons.edit_outlined),
      ],
    );
  }
}

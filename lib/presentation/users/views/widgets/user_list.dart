import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanima_admin/presentation/users/bloc/user_bloc.dart';
import 'package:thanima_admin/presentation/users/viewmodels/user_model.dart';
class UserTable extends StatefulWidget {
  const UserTable({super.key});

  @override
  _UserTableState createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search by Name",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value.toLowerCase();
              });
            },
          ),
        ),

        // Data Table
        Expanded(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              List<User> filteredUsers = state.users.where((user) {
                return user.name.toLowerCase().contains(searchQuery);
              }).toList();

              return DataTable(
                headingRowColor: WidgetStateColor.resolveWith((states) => Colors.green.shade100),
                columns: [
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
                rows: filteredUsers.map((user) {
                  return DataRow(cells: [
                    DataCell(Text(user.serial)),
                    DataCell(Text(user.name)),
                    DataCell(Text(user.contact)),
                    DataCell(Text(user.mail)),
                    DataCell(Text(user.role)),
                    DataCell(Text(user.username)),
                    DataCell(Text(user.password)),
                    
                    // Status Dropdown
                    DataCell(
                      DropdownButton<String>(
                        value: user.status,
                        items: ["Active", "Disable"].map((String status) {
                          return DropdownMenuItem(
                            value: status,
                            child: Text(
                              status,
                              style: TextStyle(color: status == "Active" ? Colors.green : Colors.red),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          context.read<UserBloc>().add(ToggleStatus(user.serial));
                        },
                      ),
                    ),

                    // Action Buttons
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Implement delete action
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            // Implement edit action
                          },
                        ),
                      ],
                    )),
                  ]);
                }).toList(),
              );
            },
          ),
        ),

        // Create User Button
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            icon: Icon(Icons.add),
            label: Text("Create Users"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              // Implement Create User Action
            },
          ),
        ),
      ],
    );
  }
}
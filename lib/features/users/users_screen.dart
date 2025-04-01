import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanima_admin/features/layout/header.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D2B25),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.all(Radius.circular(54.0)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(54.0),
            bottomLeft: Radius.circular(54.0),
          ),
          border: Border.all(color: Color(0xFFB4B4B4)),
        ),
        width: 1064.w,
        height: 774.h,
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Header(),
              SizedBox(height: 20),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 276.w,
                          height: 32.h,
                          color: Colors.transparent,
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: "Search by Name",
                              hintStyle: TextStyle(fontSize: 14),
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
                        ElevatedButton(
                          onPressed: () {
                            // print("Button Pressed");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // Button color
                            foregroundColor: Colors.white, // Text color
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                5,
                              ), // Curved borders
                            ),
                          ),
                          child: Text("+ Create Users"),
                        ),
                      ],
                    ),
                  ),

                  //
                  // Users Table
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(color: Color(0xFFB4B4B4)),
                  ),
                  child: DataTable(
                    headingTextStyle: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                    dataTextStyle: TextStyle(fontSize: 11),
                    headingRowColor: WidgetStateColor.resolveWith(
                      (states) => Color(0xFFE8FEEA),
                    ), // Header Row Color
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
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Text("01")),
                          DataCell(Text("Aadarsh Soni")),
                          DataCell(Text("+91-9876543214")),
                          DataCell(Text("aada@gmail.com")),
                          DataCell(Text("Supervisor")),
                          DataCell(Text("aada101")),
                          DataCell(Text("Admin@12345#")),
                          DataCell(
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF92FFAC),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                border: Border.all(color: Color(0xFFB4B4B4)),
                              ),
                              height: 16.h,
                              width: 60.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Active",
                                    style: TextStyle(
                                      color: Color(0xFF757575),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DataCell(
                            Row(
                              children: [
                                Icon(Icons.delete_outline_outlined),
                                Icon(Icons.edit_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("02")),
                          DataCell(Text("Aadarsh Soni")),
                          DataCell(Text("+91-9876543214")),
                          DataCell(Text("aada@gmail.com")),
                          DataCell(Text("Supervisor")),
                          DataCell(Text("aada101")),
                          DataCell(Text("Admin@12345#")),
                          DataCell(
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF92FFAC),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                border: Border.all(color: Color(0xFFB4B4B4)),
                              ),
                              height: 16.h,
                              width: 60.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Active",
                                    style: TextStyle(
                                      color: Color(0xFF757575),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DataCell(
                            Row(
                              children: [
                                Icon(Icons.delete_outline_outlined),
                                Icon(Icons.edit_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("03")),
                          DataCell(Text("Aadarsh Soni")),
                          DataCell(Text("+91-9876543214")),
                          DataCell(Text("aada@gmail.com")),
                          DataCell(Text("Supervisor")),
                          DataCell(Text("aada101")),
                          DataCell(Text("Admin@12345#")),
                          DataCell(
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF92FFAC),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                border: Border.all(color: Color(0xFFB4B4B4)),
                              ),
                              height: 16,
                              width: 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Active",
                                    style: TextStyle(
                                      color: Color(0xFF757575),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DataCell(
                            Row(
                              children: [
                                Icon(Icons.delete_outline_outlined),
                                Icon(Icons.edit_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("04")),
                          DataCell(Text("Aadarsh Soni")),
                          DataCell(Text("+91-9876543214")),
                          DataCell(Text("aada@gmail.com")),
                          DataCell(Text("Supervisor")),
                          DataCell(Text("aada101")),
                          DataCell(Text("Admin@12345#")),
                          DataCell(
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFF9292),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                border: Border.all(color: Color(0xFFB4B4B4)),
                              ),
                              height: 16.h,
                              width: 60.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Disable",
                                    style: TextStyle(
                                      color: Color(0xFF757575),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DataCell(
                            Row(
                              children: [
                                Icon(Icons.delete_outline_outlined),
                                Icon(Icons.edit_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

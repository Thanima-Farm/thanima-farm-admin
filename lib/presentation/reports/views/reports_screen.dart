import 'package:flutter/material.dart';
import 'package:thanima_admin/presentation/shared/widgets/header.dart';
import 'package:intl/intl.dart';


class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {

  TextEditingController searchController = TextEditingController();
  String searchQuery = "";
  DateTime selectedDate = DateTime.now();
  String selectedType = "All";
  final List<String> typeOptions = ["All", "Option 1", "Option 2", "Option 3"];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SizedBox(
        width: 1200,
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: 20,
              ),
             Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Date Picker Field
                              Expanded(
                                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    SizedBox(
                      width: 301.33,
                      child: TextFormField(
                        style: TextStyle(fontSize: 14),
                        readOnly: true,
                        controller: TextEditingController(
                          text: DateFormat("dd.MM.yyyy").format(selectedDate),
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () => _selectDate(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                  
                              // Type Dropdown
                              Expanded(
                                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Type", style: TextStyle(fontWeight: FontWeight.bold,)),
                    SizedBox(height: 5),
                    SizedBox(
                      width: 301.33,
                      child: DropdownButtonFormField<String>(
                        value: selectedType,
                        items: typeOptions.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(type, style: TextStyle(fontSize: 14,)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedType = value!;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                  
                              // View Button
                              ElevatedButton(
                                onPressed: () {
                  // print("Date: ${DateFormat("dd.MM.yyyy").format(selectedDate)}, Type: $selectedType");
                                },
                                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                                ),
                                child: Text("View"),
                              ),
                            ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 276,
                        height: 32,
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
          width: 1100,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
          Radius.circular(5.0) 
             ),
          border: Border.all(
            
            color: Color(0xFFB4B4B4)
          
          ),
           ),
           child: DataTable(
            
            headingTextStyle: TextStyle(fontSize: 11,fontWeight: FontWeight.w600),
            dataTextStyle: TextStyle(fontSize: 11),
            headingRowColor: WidgetStateColor.resolveWith((states) => Color(0xFFE8FEEA)), // Header Row Color
            columns: [
            DataColumn(label: Text("Serial")),
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Contact")),
            DataColumn(label: Text("Mail Id")),
            DataColumn(label: Text("Package")),
            DataColumn(label: Text("Guide Assisted")), 
            DataColumn(label: Text("Feedback")),
            DataColumn(label: Text("Action")),
           
           ], rows: [
            DataRow(cells:[
              DataCell(Text("01"),),
              DataCell(Text("Aadarsh Soni"),),
              DataCell(Text("+91-9876543214"),),
              DataCell(Text("aada@gmail.com"),),
              DataCell(Text("Supervisor"),),
              DataCell(Text("aada101"),),
              DataCell(Text("Good"),),
              DataCell(Row(
                children: [
                  Icon(Icons.delete_outline_outlined),
                  Icon(Icons.edit_outlined)
                ],
              ),),
            ]),
            DataRow(cells:[
              DataCell(Text("02"),),
              DataCell(Text("Aadarsh Soni"),),
              DataCell(Text("+91-9876543214"),),
              DataCell(Text("aada@gmail.com"),),
              DataCell(Text("Supervisor"),),
              DataCell(Text("aada101"),),
              DataCell(Text("Good"),),
              DataCell(Row(
                children: [
                  Icon(Icons.delete_outline_outlined),
                  Icon(Icons.edit_outlined)
                ],
              ),),
            ]),
            DataRow(cells:[
              DataCell(Text("03"),),
              DataCell(Text("Aadarsh Soni"),),
              DataCell(Text("+91-9876543214"),),
              DataCell(Text("aada@gmail.com"),),
              DataCell(Text("Supervisor"),),
              DataCell(Text("aada101"),),
              DataCell(Text("Good"),),
              DataCell(Row(
                children: [
                  Icon(Icons.delete_outline_outlined),
                  Icon(Icons.edit_outlined)
                ],
              ),),
            ]),
            DataRow(cells:[
              DataCell(Text("04"),),
              DataCell(Text("Aadarsh Soni"),),
              DataCell(Text("+91-9876543214"),),
              DataCell(Text("aada@gmail.com"),),
              DataCell(Text("Supervisor"),),
              DataCell(Text("aada101"),),
              DataCell(Text("Good"),),
              DataCell(Row(
                children: [
                  Icon(Icons.delete_outline_outlined),
                  Icon(Icons.edit_outlined)
                ],
              ),),
            ]),
           ]),
         ),
       )
            ],
          ),
        ),
      ),
    );
  }

  // Date Picker Function
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

}


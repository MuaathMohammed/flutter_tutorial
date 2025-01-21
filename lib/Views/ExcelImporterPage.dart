import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/ExcelController.dart';
import '../Models/Users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataTableWidget extends StatelessWidget {
  final ExcelController excelController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (excelController.users.isEmpty) {
        return Center(child: Text('No data available.'));
      }

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
            DataColumn(label: Text('Gender')),
            DataColumn(label: Text('Notes')),
            DataColumn(label: Text('Score')),
            DataColumn(label: Text('Date')),
          ],
          rows: excelController.users.map((user) {
            return DataRow(cells: [
              DataCell(Text(user.name)),
              DataCell(Text(user.age.toString())),
              DataCell(Text(user.gender)),
              DataCell(Text(user.notes)),
              DataCell(Text(user.score.toString())),
              DataCell(Text(user.date)),
            ]);
          }).toList(),
        ),
      );
    });
  }
}
class ExcelImporterPage extends StatelessWidget {
  final ExcelController excelController = Get.put(ExcelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excel Import with GetX'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              excelController.pickExcelFile();
            },
            child: Text('Import Excel'),
          ),
          Expanded(
            child: DataTableWidget(), // Display the table here
          ),
        ],
      ),
    );
  }
}
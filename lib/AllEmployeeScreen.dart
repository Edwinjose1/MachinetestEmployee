import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machinetesapi/Alldetails.dart';

class Employee {
  final String name;
  final String dob;
  final String email;
  final String address;
  final String phone;
  final String city;
  final String gender;

  Employee(
      {required this.gender,
      required this.name,
      required this.dob,
      required this.email,
      required this.address,
      required this.phone,
      required this.city});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        name: json['name'],
        dob: json['dob'],
        email: json['email'],
        address: json['address'],
        phone: json['phone'],
        city: json['city'],
        gender: json['gender']);
  }
}

class AllemployeeScreen extends StatefulWidget {
  @override
  _AllemployeeScreenState createState() => _AllemployeeScreenState();
}

class _AllemployeeScreenState extends State<AllemployeeScreen> {
  List<Employee> employees = [];

  Future<void> fetchEmployees() async {
    final response = await http
        .get(Uri.parse('https://cashbes.com/attendance/apis/employees'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        employees = (jsonData['data'] as List)
            .map((employeeJson) => Employee.fromJson(employeeJson))
            .toList();
        print(employees.length);
      });
    } else {
      // Handle error case here
      print('Failed to fetch employees. Error: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Employee List'),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return EmployeeItem(employee: employee);
        },
      ),
    );
  }
}

class EmployeeItem extends StatelessWidget {
  final Employee employee;

  EmployeeItem({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EmployeeDetailsScreen(
                    address: employee.address,
                    phone: employee.phone,
                    name: employee.name,
                    city: employee.city,
                    dob: employee.dob,
                    email: employee.email,
                    gender: employee.gender,
                  )));
        },
        title: Text('Name: ${employee.name}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phone no: ${employee.phone}'),
            Text('Address: ${employee.address}'),
          ],
        ),
      ),
    );
  }
}

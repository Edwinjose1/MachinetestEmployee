import 'package:flutter/material.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final String name;
  final String dob;
  final String email;
  final String city;
  final String gender;
  final String address;
  final String phone;

  EmployeeDetailsScreen({
    required this.name,
    required this.dob,
    required this.email,
    required this.city,
    required this.gender,
    required this.address,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title:const Text('Employee Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title:const Text('Name'),
            subtitle: Text(name),
          ),
          ListTile(
            title:const Text('Date of Birth'),
            subtitle: Text(dob),
          ),
          ListTile(
            title:const Text('Email'),
            subtitle: Text(email),
          ),
          ListTile(
            title:const Text('City'),
            subtitle: Text(city),
          ),
          ListTile(
            title:const Text('Gender'),
            subtitle: Text(gender),
          ),
          ListTile(
            title:const Text('Address'),
            subtitle: Text(address),
          ),
          ListTile(
            title:const Text('Phone Number'),
            subtitle: Text(phone),
          ),
        ],
      ),
    );
  }
}

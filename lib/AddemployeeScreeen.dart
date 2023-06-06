import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machinetesapi/HomeScreen.dart';

class AddEmployeeScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title:const Text('Add employee details'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [const
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the name';
                      }
                      return null;
                    },
                  ),
                const  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _dobController,
                    decoration: const InputDecoration(
                      labelText: 'D-O-B',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the date of birth';
                      }
                      return null;
                    },
                  ),
                 const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
                    decoration:const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _cityController,
                    decoration:const InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the city';
                      }
                      return null;
                    },
                  ),
                 const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _genderController,
                    decoration: const InputDecoration(
                      labelText: 'Gender',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the gender';
                      }
                      return null;
                    },
                  ),
                 const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _addressController,
                    decoration:const InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the Address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _phoneController,
                    decoration:const InputDecoration(
                      labelText: 'Phone number',
                      border:  OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the phonenumber';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                     const SizedBox(width: 150),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // Form is valid, send data to the API
                            final url =
                                'https://cashbes.com/attendance/apis/add_employee';

                            // Create a Map to hold the form data
                            final formData = {
                              'name': _nameController.text,
                              'dob': _dobController.text,
                              'email': _emailController.text,
                              'city': _cityController.text,
                              'gender': _genderController.text,
                              'address':_addressController.text,
                              'phone':_phoneController.text,
                            };

                            // Send a POST request to the API endpoint
                            final response =
                                await http.post(Uri.parse(url), body: formData);

                            if (response.statusCode == 200) {
                              // Request successful, handle the response
                              print('Data submitted successfully!');
                              // Handle the response based on the API's expected response format
                              // Show success message
                              ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(
                                  content: Text('Employee added successfully!'),
                                ),
                              );

                              // Navigate to HomeScreen
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                            } else {
                              // Request failed, handle the error
                              print(
                                  'Failed to submit data: ${response.statusCode}');
                              // Handle the error based on the response status code
                            }
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

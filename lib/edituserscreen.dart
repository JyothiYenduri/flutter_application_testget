import 'package:flutter/material.dart';
import 'package:flutter_application_testget/usermodel.dart';

class EditUserScreen extends StatefulWidget {
  final User user;

  EditUserScreen({required this.user});

  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController ageController;
  late TextEditingController genderController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  // Add controllers for other fields as needed

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing user data
    firstNameController = TextEditingController(text: widget.user.firstName);
    lastNameController = TextEditingController(text: widget.user.lastName);
    ageController = TextEditingController(text: widget.user.age.toString());
    genderController = TextEditingController(text: widget.user.gender.toString());
    emailController = TextEditingController(text: widget.user.email);
    phoneController = TextEditingController(text: widget.user.phone);
    
    // Initialize other controllers with existing user data
  }

  @override
  void dispose() {
    // Dispose controllers when not needed
    firstNameController.dispose();
    lastNameController.dispose();
    // Dispose other controllers as needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[400],
      appBar: AppBar(
        title: Text('Edit User'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(labelText: 'First Name'),
                  ),
                  TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(labelText: 'Last Name'),
                  ),
                  TextField(
                    controller: ageController,
                    decoration: InputDecoration(labelText: 'Age'),
                  ),
                  TextField(
                    controller: genderController,
                    decoration: InputDecoration(labelText: 'Gender'),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(labelText: 'Phone'),
                  ),
                  // Add more TextFields for other user attributes
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Call a method to submit edited user data
                      _submitEditedUserData();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple, // Set button color to purple
                    ),
                    child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitEditedUserData() {
    // Get updated values from controllers
    String updatedFirstName = firstNameController.text;
    String updatedLastName = lastNameController.text;
    // Get updated values for other attributes
    // Call a method to update user data
    // For simplicity, let's just print the updated values for now
    print('Updated First Name: $updatedFirstName');
    print('Updated Last Name: $updatedLastName');
    // Call a method to update user data using dataService
    // dataService.updateUserData(widget.user.id, updatedFirstName, updatedLastName, ...);

    // Show a Snackbar to inform the user that the data has been updated
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User data updated successfully'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

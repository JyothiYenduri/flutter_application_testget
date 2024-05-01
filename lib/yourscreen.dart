import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_testget/dataservice.dart';
import 'package:flutter_application_testget/edituserscreen.dart';
import 'package:flutter_application_testget/insertuserscreen.dart';
import 'package:flutter_application_testget/userdetailsscreen.dart';
import 'package:flutter_application_testget/usermodel.dart';

class YourScreen extends StatelessWidget {
  final DataService dataService = DataService();
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[400],
      appBar: AppBar(
        title: Text('User List'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InsertUserScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<Post>(
        future: dataService.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<User> users = snapshot.data!.users;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final User user = users[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to a new screen to display user details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailsScreen(user: user),
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 8),
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  
                                  CircleAvatar(
                                      radius: 40.0,
                                      backgroundImage: NetworkImage(user
                                          .image), // Assuming image is a URL
                                    ),
                                    SizedBox(
                                    height: 20.0,
                                  ),
                                  Text('User ID: ${user.id}'),
                                  Text(
                                      'Name: ${user.firstName} ${user.lastName}'),
                                  Text('Age: ${user.age}'),
                                  Text('Gender: ${user.gender}'),
                                  Text('Email: ${user.email}'),
                                  Text('Phone: ${user.phone}'),

                                  
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Navigate to a screen where user data can be edited
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditUserScreen(user: user),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // Call a method to delete user data
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Confirm Deletion'),
                                      content: Text(
                                          'Are you sure you want to delete this user?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Call method to delete user data
                                            dataService
                                                .deleteUserData(user.id)
                                                .then((_) {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                              // Navigator.of(context).pop(); // Close the UserDetailsScreen
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'User deleted successfully'),
                                                  duration:
                                                      Duration(seconds: 2),
                                                ),
                                              );
                                            }).catchError((error) {
                                              // Handle error
                                            });
                                          },
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            // Handle error case
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Display loading indicator while fetching data
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_testget/usermodel.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  UserDetailsScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[400],
      appBar: AppBar(
        title: Text('User Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    user.image, // Assuming image is a URL
                    height: 150.0, // Adjust the height as needed
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    color: Colors.purple[200],
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(3),
                        },
                        children: [
                          _buildTableRow('User ID:', '${user.id}'),
                          _buildTableRow(
                              'Name:', '${user.firstName} ${user.lastName}'),
                          _buildTableRow('Email:', '${user.email}'),
                          _buildTableRow('Phone:', '${user.phone}'),
                          _buildTableRow('Username:', '${user.username}'),
                          _buildTableRow('Birth Date:', '${user.birthDate}'),
                          _buildTableRow('Height:', '${user.height}'),
                          _buildTableRow('Weight:', '${user.weight}'),
                          _buildTableRow('Domain:', '${user.domain}'),
                          _buildTableRow('Address:', '${user.address.address}'),
                          _buildTableRow('State:', '${user.address.state}'),
                          _buildTableRow('University:', '${user.university}'),
                          _buildTableRow(
                              'Company Name:', '${user.company.name}'),
                          _buildTableRow('Blood Group:', '${user.bloodGroup}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(value),
        ),
      ],
    );
  }
}







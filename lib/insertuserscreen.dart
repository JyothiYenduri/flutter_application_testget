import 'package:flutter/material.dart';
import 'package:flutter_application_testget/dataservice.dart';
import 'package:flutter_application_testget/usermodel.dart';

class InsertUserScreen extends StatelessWidget {
  final DataService dataService = DataService();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[400],
      appBar: AppBar(
        title: Text('Insert User'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          children: [
            Card(
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                      ),
                    ),
                    TextField(
                      controller: lastNameController,
                      decoration: InputDecoration(labelText: 'Last Name'),
                    ),
                    TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                        labelText: 'Age',
                      ),
                    ),
                    TextField(
                      controller: genderController,
                      decoration: InputDecoration(
                        labelText: 'Gender',
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                      ),
                    ),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),

                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        String firstName = firstNameController.text;
                        String lastName = lastNameController.text;

                        dataService
                            .postData(User(
                          id: 0,
                          firstName: firstName,
                          lastName: lastName,
                          maidenName: '',
                          age: 0,
                          gender: Gender.FEMALE,
                          email: '',
                          phone: '',
                          username: '',
                          password: '',
                          birthDate: DateTime.now(),
                          image: '',
                          bloodGroup: '',
                          height: 0,
                          weight: 0.0,
                          eyeColor: EyeColor.AMBER,
                          hair: Hair(color: Color.BROWN, type: Type.STRAIGHT),
                          domain: '',
                          ip: '',
                          address: Address(
                            address: '',
                            city: '',
                            coordinates: Coordinates(lat: 0.0, lng: 0.0),
                            postalCode: '',
                            state: '',
                          ),
                          macAddress: '',
                          university: '',
                          bank: Bank(
                            cardExpire: '',
                            cardNumber: '',
                            cardType: '',
                            currency: '',
                            iban: '',
                          ),
                          company: Company(
                            address: Address(
                              address: '',
                              city: '',
                              coordinates: Coordinates(lat: 0.0, lng: 0.0),
                              postalCode: '',
                              state: '',
                            ),
                            department: '',
                            name: '',
                            title: '',
                          ),
                          ein: '',
                          ssn: '',
                          userAgent: '',
                          crypto: Crypto(
                            coin: Coin.BITCOIN,
                            wallet: Wallet
                                .THE_0_XB9_FC1004_BFE7702_DE522516_CF34_A5_DA41_C4_EF2_B5,
                            network: Network.ETHEREUM_ERC20,
                          ),
                        ))
                            .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('User inserted successfully'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.pop(context);
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Failed to insert user data: $error'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[
                            400], // Change the background color to purple
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

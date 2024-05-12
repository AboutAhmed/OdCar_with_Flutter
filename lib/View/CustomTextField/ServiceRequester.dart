import 'package:flutter/material.dart';
import 'package:odcar/View/CustomTextField/CustomTextField.dart';
import 'package:odcar/View/CustomTextField/VerificationScreen.dart';

class ServiceRequester extends StatefulWidget {
  const ServiceRequester({Key? key}) : super(key: key);

  @override
  State<ServiceRequester> createState() => _ServiceRequesterState();
}

class _ServiceRequesterState extends State<ServiceRequester> {
  String code = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Color(0xFF00803E),
                  iconSize: 30,
                ),
              ),
              const SizedBox(height: 10,),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Service Requester data',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'inter',
                    color: Color(0xFF00803E),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              CustomTextFormField(labelText: 'Mobile Number', isRequired: true),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF00803E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF00803E),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  thickness: 0.5,
                  color: Colors.black26,
                ),
              ),
              SizedBox(height: 10,),
              const Center(
                child: Text(
                  'Please enter the verification code',
                  style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.bold,
                    fontFamily: 'inter',
                    color: Color(0xFF00803E),
                  ),
                ),
              ),
              SizedBox(height: 18,),
              const Center(
                child: Text(
                  'A code has been sent to your ********059',
                  style: TextStyle(fontSize: 14,
                  color: Colors.black38,
                  ),
                ),
              ),
              SizedBox(height: 18,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCodeDigit(code.length > 0 ? code.substring(0, 1) : ''),
                    buildCodeDigit(code.length > 1 ? code.substring(1, 2) : ''),
                    buildCodeDigit(code.length > 2 ? code.substring(2, 3) : ''),
                    buildCodeDigit(code.length > 3 ? code.substring(3, 4) : ''),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF00803E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => VerificationScreen()),
                      );
                      // Submit button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00803E),
                    ),
                    child: const Text('Verify', style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCodeDigit(String digit) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Text(
        digit,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}


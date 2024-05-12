import 'package:flutter/material.dart';
import 'package:odcar/View/CustomTextField/CustomTextField.dart';
import 'package:odcar/View/CustomTextField/ExaminationScreen.dart';

class OwnerData extends StatefulWidget {
  const OwnerData({Key? key}) : super(key: key);

  @override
  State<OwnerData> createState() => _OwnerDataState();
}

class _OwnerDataState extends State<OwnerData> {
  String? _selectedCity;

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
              SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Owner Data',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'inter',
                    color: Color(0xFF00803E),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              CustomTextFormField(
                labelText: 'Owner name',
                isRequired: true,
              ),
              SizedBox(height: 20,),
              CustomTextFormField(
                labelText: 'Owner Mobile Phone',
                isRequired: true,
              ),
              SizedBox(height: 20,),
              CustomTextFormField(
                labelText: 'City',
                isRequired: true,
                suffixIcon: Icons.keyboard_arrow_down,
              ),
              SizedBox(height: 20,),
              CustomTextFormField(
                labelText: 'Vehicle Price',
                isRequired: true,
              ),
              SizedBox(height: 70,),
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
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ExaminationScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF00803E),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:odcar/View/CustomTextField/VehicleData.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
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
      const SizedBox(height: 50,),
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Color(0xFF00803E),
                   child:  Image.asset('assets/Tick.png'),
                  ),
                ),
                SizedBox(height: 20,),
               const Center(
                  child: Text('Verified', style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00803E),
                  ),),
                ),
                SizedBox(height: 20,),
               Center(
                 child: Text('You have successfully verified your number',
                 style: TextStyle(
                   color: Colors.black38,
                   fontSize: 14
                 ),
                 ),
               ),
                SizedBox(height: 20,),
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
                          MaterialPageRoute(builder: (context) => VehicleData()),
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
    );
  }
}

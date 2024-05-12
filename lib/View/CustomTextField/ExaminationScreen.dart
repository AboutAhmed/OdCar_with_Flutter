import 'package:flutter/material.dart';
import 'package:odcar/View/CustomTextField/Desiredpackages.dart';

class ExaminationScreen extends StatefulWidget {
  const ExaminationScreen({Key? key}) : super(key: key);

  @override
  State<ExaminationScreen> createState() => _ExaminationScreenState();
}

class _ExaminationScreenState extends State<ExaminationScreen> {
  bool firstContainerChecked = false;
  bool secondContainerChecked = false;

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
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Examination Center',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'inter',
                  color: Color(0xFF00803E),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Determine the date and place of examination',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerWithCheckBox(
                  text: 'Determine the data and location of the examination now',
                  isChecked: firstContainerChecked,
                  onTap: () {
                    setState(() {
                      firstContainerChecked = !firstContainerChecked;
                    });
                  },
                ),
                ContainerWithCheckBox(
                  text: 'The data and the location of the inspection will be determined later by the vehicle owner',
                  isChecked: secondContainerChecked,
                  onTap: () {
                    setState(() {
                      secondContainerChecked = !secondContainerChecked;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 160,),
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
                      MaterialPageRoute(builder: (context) => DesiredPackages()),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF00803E),
                  ),
                  child: const Text(
                    'Next',
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

class ContainerWithCheckBox extends StatelessWidget {
  final String text;
  final bool isChecked;
  final VoidCallback onTap;

  const ContainerWithCheckBox({
    required this.text,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isChecked ? Color(0xffDFDFDF) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: isChecked ? Colors.black : Colors.black,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isChecked ? Color(0xFF00803E) : Colors.white,
                border: Border.all(
                  color: isChecked ? Color(0xFF00803E) : Color(0xFF00803E),
                ),
              ),
              child: isChecked
                  ? Icon(Icons.check, color: Colors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ExaminationScreen(),
  ));
}

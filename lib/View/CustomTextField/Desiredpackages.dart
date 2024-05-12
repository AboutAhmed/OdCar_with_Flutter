import 'package:flutter/material.dart';
import 'package:odcar/View/CustomTextField/ScheduleInspection/ScheduleInspection.dart';

class DesiredPackages extends StatefulWidget {
  const DesiredPackages({Key? key}) : super(key: key);

  @override
  State<DesiredPackages> createState() => _DesiredPackagesState();
}

class _DesiredPackagesState extends State<DesiredPackages> {
  bool firstContainerChecked = false;
  bool secondContainerChecked = false;
  bool thirdContainerChecked = false;

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Choose Your desired Package',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'inter',
                    color: Color(0xFF00803E),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContainerWithCheckBox(
                      text: 'Basic Package\nSAR1000\nUpto 1000cc',
                      isChecked: firstContainerChecked,
                      onTap: () {
                        setState(() {
                          firstContainerChecked = !firstContainerChecked;
                        });
                      },
                      image: Image.asset(
                        'assets/RedCar.png',
                        height: 60,
                      ),
                    ),
                    ContainerWithCheckBox(
                      text: 'Standard Package\nSAR2000\nUpto 1000cc',
                      isChecked: secondContainerChecked,
                      onTap: () {
                        setState(() {
                          secondContainerChecked = !secondContainerChecked;
                        });
                      },
                      image: Image.asset(
                        'assets/BlackCar.png',
                        height: 60,
                      ),
                    ),
                    ContainerWithCheckBox(
                      text: 'Premium Package\nSAR3000\nUpto 1000cc',
                      isChecked: thirdContainerChecked,
                      onTap: () {
                        setState(() {
                          thirdContainerChecked = !thirdContainerChecked;
                        });
                      },
                      image: Image.asset(
                        'assets/WhiteCar.png',
                        height: 60,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60,),
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
                        MaterialPageRoute(builder: (context) => ScheduleInspection()),
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
      ),
    );
  }
}

class ContainerWithCheckBox extends StatelessWidget {
  final String text;
  final bool isChecked;
  final VoidCallback onTap;
  final Widget? image;

  const ContainerWithCheckBox({
    required this.text,
    required this.isChecked,
    required this.onTap,
    this.image,
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
          border: Border.all(color: Color(0xFF00803E), width: 1),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: text.split('\n')[0] + '\n',
                          style: TextStyle(
                            color: isChecked ? Colors.black : Colors.black,
                            fontSize: 12,
                            fontFamily: 'inter',
                          ),
                        ),
                        TextSpan(
                          text: text.split('\n')[1] + '\n',
                          style: TextStyle(
                            color: Color(0xFF00803E),
                            fontSize: 22,
                            fontFamily: 'inter',
                          ),
                        ),
                        TextSpan(
                          text: text.split('\n')[2],
                          style: TextStyle(
                            color: isChecked ? Colors.black : Colors.black,
                            fontSize: 12,
                            fontFamily: 'inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            if (image != null) SizedBox(
              height: 60,
              child: image,
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
                  ? Icon(Icons.check, color: Colors.white, size: 20)
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
    home: DesiredPackages(),
  ));
}

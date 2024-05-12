import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String imagePath;

  const CustomContainer({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 60) / 2,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Container()), // Empty expanded widget
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/Vector 1.png'),
                      Text('\$42000',style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              // Divider(
              //   indent: 0, // Remove the space at the beginning of the divider
              //   endIndent: 0, // Remove the space at the end of the divider
              // ),
              const SizedBox(height: 2,),
              const Center(
                child:  Text(
                  'BMW F12 6 CONVERRIBLE',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildImageWithText('assets/Road.png', '26000'),
                  _buildDivider(),
                  _buildImageWithText('assets/Car.png', 'Diesel'),
                  _buildDivider(),
                  _buildImageWithText('assets/Clock.png', '2014'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageWithText(String image, String text) {
    return Expanded(
      child: Row(
        children: [
          Image.asset(image, width: 10, height: 10),
          SizedBox(width: 1),
          Text(text, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 5,
      height: 16,
      child: const VerticalDivider(
        thickness: 0.5,
        color: Colors.black,
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Color(0xFF00803E),
                      iconSize: 30,
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Our Top ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Inter',
                            ),
                          ),
                          TextSpan(
                            text: 'Rated Car',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF00803E),
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Add your search logic here
                      },
                      icon: Icon(Icons.search),
                      color: Colors.black26,
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildTabContainer(context, 'All'),
                    _buildTabContainer(context, 'Mercedes'),
                    _buildTabContainer(context, 'Tesla'),
                    _buildTabContainer(context, 'BMW'),
                    _buildTabContainer(context, 'BMW'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomContainer(imagePath: 'assets/Car1.png'),
                        SizedBox(width: 10),
                        CustomContainer(imagePath: 'assets/Car2.png'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        CustomContainer(imagePath: 'assets/Car3.png'),
                        SizedBox(width: 10),
                        CustomContainer(imagePath: 'assets/Car4.png'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        CustomContainer(imagePath: 'assets/Car5.png'),
                        SizedBox(width: 10),
                        CustomContainer(imagePath: 'assets/Car6.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed, // Add this line
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment),
                  label: 'My Request',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.monetization_on),
                  label: 'Auction',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shop),
                  label: 'Buy & Sell',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              selectedItemColor: Color(0xFF00803E),
              unselectedItemColor: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContainer(BuildContext context, String label) {
    double containerWidth;
    if (label == 'BMW') {
      containerWidth = (label.length * 10.0) + 40.0; // Adjust according to your needs
    } else {
      containerWidth = (label.length * 10.0) + 20.0; // Adjust according to your needs
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal:5),
      child: Container(
        width: containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
          ),
          color: label == 'All' ? Color(0xFF00803E) : Colors
              .transparent, // Background color
        ),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              // Handle tab tap
            },
            splashColor: Colors.white, // Splash color
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  label,
                  style: TextStyle(
                    color: label == 'All' ? Colors.white : Colors
                        .black, // Text color
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

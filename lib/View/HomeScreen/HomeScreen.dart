import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odcar/View/CustomTextField/ServiceRequester.dart';
import 'package:odcar/View/HomeScreen/ViewScreen.dart';

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
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = (screenWidth - 80) / 2;
    double buttonWidth = screenWidth * 0.35;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, // Set page background color to white
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Add padding to ListTile
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Stack(
                            children: [
                              CircleAvatar(
                                child: Image.asset('assets/leadingi.png'),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Fareed Khan'),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 16,
                                    color: Color(0xFF00803E),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Saudia Arabia',
                                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            child: Stack(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.notifications_none_outlined,
                                    color: Color(0xFF00803E),
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: Container(
                                    padding: const EdgeInsets.all(1),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    constraints: const BoxConstraints(
                                      minWidth: 2,
                                      minHeight: 2,
                                    ),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      constraints: const BoxConstraints(
                                        minWidth: 8,
                                        minHeight: 8,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 9,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search for cars',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.1)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.1)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.3)),
                            ),
                            fillColor: Color(0xffDFDFDF), // Background color similar to white 700
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 16.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                          width:
                          8), // Adjust the space between search bar and image
                      const Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                             SizedBox(
                                height:
                                8), // Adjust the space between search bar and image
                            Icon(Icons.tune,
                              color: Color(0xFF00803E),

                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    height: 10), // Add spacing between text field and containers
                Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00803E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Your premier hub for car buying & selling',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Inter',
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Discover the easiest way to buy or sell & auction your car online with OdCar',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Add your onPressed logic here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: Size(buttonWidth, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Adjust the value as needed
                                ),
                              ),
                              child: const Text(
                                'Buy & Sell',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF00803E),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Image.asset(
                              'assets/C1.png',
                              fit: BoxFit.contain,
                              width: cardWidth * 0.9,
                              height: 120,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 70, right: 70),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xff9B2525),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Evaluate your car today',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Inter',
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Certify your car with our trusted car evaluation services',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ServiceRequester()),
                                );
                                // Add your onPressed logic here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: Size(buttonWidth, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Adjust the value as needed
                                ),
                              ),
                              child: const Text(
                                'Request',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff9B2525),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Stack(
                          children: [
                            Image.asset('assets/image 36.png',
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.contain,
                            ),
                            Image.asset(
                              'assets/C2.png',
                              alignment: Alignment.centerRight,
                              fit: BoxFit.contain,
                              width: cardWidth * 0.9,
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ViewScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomContainer(imagePath: 'assets/Car1.png'),
                          SizedBox(width: 18),
                          CustomContainer(imagePath: 'assets/Car2.png'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          CustomContainer(imagePath: 'assets/Car3.png'),
                          SizedBox(width: 18),
                          CustomContainer(imagePath: 'assets/Car4.png'),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
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
    );
  }
}

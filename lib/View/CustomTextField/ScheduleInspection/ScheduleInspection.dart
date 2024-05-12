import 'package:flutter/material.dart';
import 'package:odcar/View/CustomTextField/CustomTextField.dart';
import 'package:odcar/View/CustomTextField/ScheduleInspection/BottomSheet.dart';

class ScheduleInspection extends StatefulWidget {
  const ScheduleInspection({Key? key}) : super(key: key);

  @override
  State<ScheduleInspection> createState() => _ScheduleInspectionState();
}

class _ScheduleInspectionState extends State<ScheduleInspection> {
  TextEditingController _locationController = TextEditingController();
  TextEditingController _areaController = TextEditingController();
  TextEditingController _makeModelController = TextEditingController();
  TextEditingController _slotController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  String selectedCar = '';
  String selectedMake = '';
  String selectedModel = '';
  String selectedVersion = '';
  String labelText = 'Make/Model/Version';
  bool isRequired = true;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _slotController.text =
            pickedDate.toString(); // You can format the date as you wish
      });
    }
  }

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
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
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
                  'Schedule OdCar Car Inspection',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'inter',
                    color: Color(0xFF00803E),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomBottomSheet(
                        controller: _locationController,
                        items: const [
                          'Karachi',
                          'Lahore',
                          'Islamabad',
                          'Kasur',
                          'Chunian',
                          'Rahim Yar Khan (RYK)',
                          // Add more locations if needed
                        ],
                        labelText: 'Choose City',
                      );
                    },
                  );
                },
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _locationController,
                      labelText: 'Location',
                      isRequired: true,
                      enabled: false,
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomBottomSheet(
                        controller: _areaController,
                        items: const [
                          'Popular',
                          'Gulshan e Johar',
                          'Gulshan e iqbal',
                          'Khald bin Waleed Road',
                          // Add more areas if needed
                        ],
                        labelText: 'Choose Area',
                      );
                    },
                  );
                },
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _areaController,
                      labelText: 'House No/Building No,Street,Area',
                      isRequired: true,
                      enabled: false,
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showCarBottomSheet();
                  _showMakeBottomSheet();
                  _showModelBottomSheet();
                  _showVersionBottomSheet();
                },
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 5),
                      child: Row(
                        children: [
                          Text(
                            labelText,
                            style: TextStyle(color: Colors.black),
                          ),
                          if (isRequired)
                            Text(
                              ' *',
                              style: TextStyle(color: Colors.red),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 50,
                          width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                            color: Color(0xffDFDFDF),
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 10),
                                Text(' $selectedCar'),
                                Text('$selectedModel'),
                                Text('$selectedMake'),
                                Text('$selectedVersion'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: _slotController,
                            labelText: 'Inspection Slot',
                            isRequired: true,
                            enabled: false,
                            suffixIcon: Icons.calendar_today,
                            suffixIconColor: Color(0xFF00803E),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomBottomSheet(
                        controller: _fullNameController,
                        items: const [
                          "Ghulam Fareed Khan",
                          "Ahmed",
                          "Yasir",
                          "Jane Doe",
                          "Alice Smith"

                          // Add more slots if needed
                        ],
                        labelText: 'Choose Name',
                      );
                    },
                  );
                  // Add onTap functionality
                },
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _fullNameController,
                      labelText: 'Enter Full Name',
                      isRequired: true,
                      enabled: false,
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomBottomSheet(
                        controller: _phoneController,
                        items: const [
                          "+92 316 04466-04",
                          "+92 316 04455-04",
                          "+92 316 05544-04",
                          "+1 234 567 8901",
                          "+1 345 678 9012"
                          // Add more slots if needed
                        ],
                        labelText: 'Choose Phone',
                      );
                    },
                  );
                  // Add onTap functionality
                },
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _phoneController,
                      labelText: 'Enter Your Phone',
                      isRequired: true,
                      enabled: false,
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF00803E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            ScheduleInspection()),
                      );
                    },
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
            ],
          ),
        ),
      ),
    );
  }
  
  void _showCarBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Choose Model Year'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: 7, // Assuming you want to list years from 2024 to 2018
                    itemBuilder: (BuildContext context, int index) {
                      final year = (2024 - index).toString();
                      return Column(
                        children: [
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  year,
                                  style: TextStyle(
                                    color: selectedModel == year
                                        ? Color(0xFF00803E)
                                        : Colors.black,
                                  ),
                                ),
                                if (selectedModel == year)
                                  Icon(
                                    Icons.check,
                                    color: Color(0xFF00803E),
                                  ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                selectedModel = year;
                              });
                              Navigator.pop(context);
                            },
                          ),
                          if (index != 6) Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF00803E)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF00803E),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      color: Color(0xFF00803E),
                      border: Border.all(color: Color(0xFF00803E)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      onPressed: () {
                        _makeModelController.text = selectedModel;
                        Navigator.pop(context);
                        FocusScope.of(context).nextFocus();
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20,
                          backgroundColor: Color(0xFF00803E),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
  void _showMakeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Choose Make'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: 4, // Fixing the itemCount to the number of elements in the list
                    itemBuilder: (BuildContext context, int index) {
                      final make = ["Popular", "BMW", "Honda", "Others"][index];
                      return Column(
                        children: [
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  make,
                                  style: TextStyle(
                                    color: selectedMake == make
                                        ? Color(0xFF00803E)
                                        : Colors.black,
                                  ),
                                ),
                                if (selectedMake == make)
                                  Icon(
                                    Icons.check,
                                    color: Color(0xFF00803E),
                                  ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                selectedMake = make;
                              });
                              Navigator.pop(context);
                            },
                          ),
                          if (index != 3) Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF00803E)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF00803E),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      color: Color(0xFF00803E),
                      border: Border.all(color: Color(0xFF00803E)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      onPressed: () {
                        _makeModelController.text = selectedMake;
                        Navigator.pop(context);
                        FocusScope.of(context).nextFocus();
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20,
                          backgroundColor: Color(0xFF00803E),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
  void _showModelBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Choose Model'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: 6, // Assuming you want to list models
                    itemBuilder: (BuildContext context, int index) {
                      final model = ["Alto", "Wagon R", "Cultus", "Swift", "Aerio", "Beleno"][index];
                      return Column(
                        children: [
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  model,
                                  style: TextStyle(
                                    color: selectedModel == model
                                        ? Color(0xFF00803E)
                                        : Colors.black,
                                  ),
                                ),
                                if (selectedModel == model)
                                  Icon(
                                    Icons.check,
                                    color: Color(0xFF00803E),
                                  ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                selectedModel = model;
                              });
                              Navigator.pop(context);
                            },
                          ),
                          if (index != 5) Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF00803E)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF00803E),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      color: Color(0xFF00803E),
                      border: Border.all(color: Color(0xFF00803E)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      onPressed: () {
                        _makeModelController.text = selectedModel;
                        Navigator.pop(context);
                        FocusScope.of(context).nextFocus();
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20,
                          backgroundColor: Color(0xFF00803E),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
  void _showVersionBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Choose Version (Optional)'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: 3, // Assuming you want to list versions
                    itemBuilder: (BuildContext context, int index) {
                      final version = [
                        "2021-2024 \n\n . Smile 2 -Tone Hybrid S \n . 658cc, Automatic, Hybrid",
                        "2021-2024 \n\n  . Smile 2 -Tone Hybrid S \n . 658cc, Automatic, Hybrid",
                        "2021-2024 \n\n  . Smile 2 -Tone Hybrid S \n . 658cc, Automatic, Hybrid",
                        // Add more versions if needed
                      ][index];
                      return Column(
                        children: [
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  version,
                                  style: TextStyle(
                                    color: selectedVersion == version
                                        ? Color(0xFF00803E)
                                        : Colors.black,
                                  ),
                                ),
                                if (selectedVersion == version)
                                  Icon(
                                    Icons.check,
                                    color: Color(0xFF00803E),
                                  ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                selectedVersion = version;
                              });
                              Navigator.pop(context);
                            },
                          ),
                          if (index != 2) Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF00803E)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF00803E),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      color: Color(0xFF00803E),
                      border: Border.all(color: Color(0xFF00803E)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      onPressed: () {
                        _makeModelController.text = selectedVersion;
                        Navigator.pop(context);
                        FocusScope.of(context).nextFocus();
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20,
                          backgroundColor: Color(0xFF00803E),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

}

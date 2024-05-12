import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  final TextEditingController controller;
  final List<String> items;
  final String labelText;

  CustomBottomSheet({required this.controller, required this.items, required this.labelText});

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  late String _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20),
      child: Row(
        children: [
          Expanded(
            child: CustomBottomSheetContent(
              controller: widget.controller,
              items: widget.items,
              labelText: widget.labelText,
              selectedItem: _selectedItem,
              onItemSelected: (item) {
                setState(() {
                  _selectedItem = item;
                  widget.controller.text = item;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomSheetContent extends StatelessWidget {
  final TextEditingController controller;
  final List<String> items;
  final String labelText;
  final String selectedItem;
  final Function(String) onItemSelected;

  CustomBottomSheetContent({
    required this.controller,
    required this.items,
    required this.labelText,
    required this.selectedItem,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          ListTile(
            title: Text(labelText),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white70.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildItem(items[index], context);
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                      controller.text = selectedItem;
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
      ),
    );
  }

  Widget _buildItem(String item, BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item,
            style: TextStyle(
              color: selectedItem == item ? Color(0xFF00803E) : Colors.black,
            ),
          ),
          if (selectedItem == item)
            Icon(
              Icons.check,
              color: Color(0xFF00803E),
            ),
        ],
      ),
      onTap: () {
        onItemSelected(item);
      },
    );
  }
}

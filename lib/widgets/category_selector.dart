import 'package:flutter/material.dart';

class category_selector extends StatefulWidget {
  // const category_selector ({ Key? key }) : super(key: key);

  @override
  _category_selectorState createState() => _category_selectorState();
}

class _category_selectorState extends State<category_selector> {
  int selectedIndex = 0;
  final List<String> categories = ['Message'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
onTap: () {
  setState(() {
    selectedIndex = index;
  });
},

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: Text(categories[index],style: TextStyle(
                  
                  color: Colors.white,
                  fontSize: 25.0,
                 
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

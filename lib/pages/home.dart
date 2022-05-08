import 'package:flutter/material.dart';
import 'package:flutter_workshop/pages/StockList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    StockList(),
    Center(
      child: Text('Setting'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      body: pages[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.inventory,
                    size: 50,
                    color: Colors.white,
                  ),
                  Text(
                    'Inventory Workshop',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Stock'),
              onTap: () {
                selectIndex(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('setting'),
              onTap: () {
                selectIndex(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }

  selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context);
    });
  }
}

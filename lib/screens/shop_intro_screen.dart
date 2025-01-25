import 'package:flutter/material.dart';
import 'package:sneaker_store/screens/cart_screen.dart';
import 'package:sneaker_store/screens/shop_screen.dart';
import '../components/bottom_nav_bar.dart';


class ShopIntroScreen extends StatefulWidget {
  const ShopIntroScreen({super.key});

  @override
  State<ShopIntroScreen> createState() => _ShopIntroScreenState();
}

class _ShopIntroScreenState extends State<ShopIntroScreen> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screen = [const ShopScreen(), const CartScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => {Scaffold.of(context).openDrawer()},
              icon: Icon(Icons.menu, color: Colors.black));
        }),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child:
                      Image.asset('assets/images/nike_2.png', color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),
                           const  Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const  Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const  Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: _screen[_selectedIndex],
    );
  }
}

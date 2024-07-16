import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:multi_vendor_web_panel/views/screens/side_bar_screen/categories_screen.dart';
import 'package:multi_vendor_web_panel/views/screens/side_bar_screen/dashboard_screen.dart';
import 'package:multi_vendor_web_panel/views/screens/side_bar_screen/orders_screen.dart';
import 'package:multi_vendor_web_panel/views/screens/side_bar_screen/products_screen.dart';
import 'package:multi_vendor_web_panel/views/screens/side_bar_screen/upload_screen.dart';
import 'package:multi_vendor_web_panel/views/screens/side_bar_screen/vendors_screen.dart';
import 'package:multi_vendor_web_panel/views/screens/side_bar_screen/withdrawals_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedItem = DashboardScreen();

  selectedRoute(item) {
    switch (item.route) {
      case DashboardScreen.routeName:
        setState(() {
          _selectedItem = DashboardScreen();
        });
        break;
      case CategoryScreen.routeName:
        setState(() {
          _selectedItem = CategoryScreen();
        });
        break;
      case OrdersScreen.routeName:
        setState(() {
          _selectedItem = OrdersScreen();
        });
        break;
      case ProductScreen.routeName:
        setState(() {
          _selectedItem = ProductScreen();
        });
        break;
      case UploadScreen.routeName:
        setState(() {
          _selectedItem = UploadScreen();
        });
        break;
      case VendorScreen.routeName:
        setState(() {
          _selectedItem = VendorScreen();
        });
        break;
      case WithdrawalScreen.routeName:
        setState(() {
          _selectedItem = WithdrawalScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade900,
          title: Text('Management'),
        ),
        sideBar: SideBar(
          items: [
            AdminMenuItem(
                title: 'Dashboard',
                icon: Icons.dashboard,
                route: DashboardScreen.routeName),
            AdminMenuItem(
                title: 'Vendors',
                icon: CupertinoIcons.person_3,
                route: VendorScreen.routeName),
            AdminMenuItem(
                title: 'Withdrawal',
                icon: CupertinoIcons.money_dollar,
                route: WithdrawalScreen.routeName),
            AdminMenuItem(
                title: 'Orders',
                icon: CupertinoIcons.shopping_cart,
                route: OrdersScreen.routeName),
            AdminMenuItem(
                title: 'Categories',
                icon: Icons.category,
                route: CategoryScreen.routeName),
            AdminMenuItem(
                title: 'Products',
                icon: Icons.shop,
                route: ProductScreen.routeName),
            AdminMenuItem(
                title: 'Upload Banners',
                icon: CupertinoIcons.add,
                route: UploadScreen.routeName),
          ],
          selectedRoute: '',
          onSelected: (item) {
            selectedRoute(item);
          },
          header: Container(
            height: 50,
            width: double.infinity,
            color: const Color(0xff444444),
            child: const Center(
              child: Text(
                'Multi Store Admin',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          footer: Container(
            height: 50,
            width: double.infinity,
            color: const Color(0xff444444),
            child: const Center(
              child: Text(
                'footer',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: _selectedItem);
  }
}

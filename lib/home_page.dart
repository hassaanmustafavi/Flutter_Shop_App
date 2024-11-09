import 'package:flutter/material.dart';
import 'package:shop_app/Product_List.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int currentPage;

  @override
  void initState() {
    super.initState();
    currentPage=0;
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: const ProductList(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value){
          setState(() {
            currentPage=value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: '',
            icon:Icon(Icons.shopping_bag) )
        ]),
    );
  }
}
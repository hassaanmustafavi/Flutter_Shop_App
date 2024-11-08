import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = ['All','Addidas', 'Nike','Bata']; 
  late String selectedFiltered;

  @override
  void initState() {
    selectedFiltered=filters[0];
  }
  
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search_rounded),
                      border: border,
                      focusedBorder: border,
                      enabledBorder: border,
                    ),
                  )
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                       setState(() {
                          selectedFiltered=filter;
                       });
                      },
                      child: Chip(
                        backgroundColor: selectedFiltered==filter? Theme.of(context).colorScheme.primary :Color.fromRGBO(245, 247, 249, 1),
                        side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        label: Text(filter),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(style:BorderStyle.none ),
                        ),
                        
                      ),
                    ),
                  );
                },
              ),
            )
          ],
          ListView.builder(itemBuilde)
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map <String,Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product
    });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body:Column(
        
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(flex: 1,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(flex: 2),
          Container(
            height: 250,
            decoration: const BoxDecoration(
              color:  Color.fromRGBO(245, 247, 249, 1),
              borderRadius:BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context,index){
                    
                    final int size = (widget.product['sizes'] as List<int>)[index];  
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedSize=size;
                            });
                          },
                          child: Chip(
                            label:Text(size.toString()),
                            backgroundColor: selectedSize==size? Theme.of(context).colorScheme.primary:null,
                          ),
                        )
                      );
                    }
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton.icon(
                    onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    icon: const Icon(Icons.shopping_cart,color: Colors.black,),
                    label: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),),
                    
                    ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}